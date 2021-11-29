import dayjs from 'dayjs';
import connection from '../../database/database.js';

export default async function postSubscription(req, res) {
  const { authorization } = req.headers;
  const token = authorization?.replace('Bearer ', '');
  const {
    subscriptionType,
    subscriptionDates,
    subscriptionItems,
    adress,
    cep,
    city,
    state,
  } = req.body;
  const today = dayjs().format('YYYY/MM/DD');
  function categoryId() {
    if (subscriptionType === 'Semanal') {
      return 1;
    }
    return 2;
  }
  function itemId(item) {
    let id = 0;
    if (item === 'Chás') {
      id = 1;
    } else if (item === 'Incensos') {
      id = 2;
    } else if (item === 'Produtos organicos') {
      id = 3;
    }
    return id;
  }

  if (!token) return res.sendStatus(401);
  try {
    const findToken = await connection.query(
      `
        SELECT * FROM sessions WHERE token = $1;
        `,
      [token],
    );
    if (findToken.rowCount === 0) {
      return res.status(401).send('You are not logged in');
    }

    const userId = findToken.rows[0].user_id;

    const insertAdress = await connection.query(
      `
      INSERT INTO adress (adress_name, cep, cidade, estate) VALUES ($1, $2, $3, $4) RETURNING *;
      `,
      [adress, cep, city, state],
    );
    const adressId = insertAdress.rows[0].id;

    const insertSubscription = await connection.query(
      `
        INSERT INTO subscription (user_id, category_id, subscription_date, adress_id, chosen_date) VALUES ($1, $2, $3, $4, $5) RETURNING *;
      `,
      [userId, categoryId(), today, adressId, subscriptionDates],
    );
    const subscriptionId = insertSubscription.rows[0].id;

    subscriptionItems.forEach(async (item) => {
      await connection.query(
        `
            INSERT INTO subscription_final (subscription_id, item_id) VALUES ($1, $2)
      `,
        [subscriptionId, itemId(item)],
      );
    });
    return res.sendStatus(200);
  } catch (error) {
    return res.sendStatus(500);
  }
}
