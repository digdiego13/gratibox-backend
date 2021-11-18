import dayjs from 'dayjs';
import connection from '../../database/database.js';

export default async function getSubscription(req, res) {
  const { authorization } = req.headers;
  const token = authorization?.replace('Bearer ', '');

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

    const subscriptionList = await connection.query(
      `
        SELECT subscription_items.item_name, subscription.subscription_date, subscription.chosen_date, subscription_category.name
        FROM subscription_final
        JOIN subscription_items ON subscription_final.item_id = subscription_items.id
        JOIN subscription ON subscription_final.subscription_id = subscription.id
        JOIN subscription_category ON subscription.category_id = subscription_category.id
        WHERE user_id = $1;

        `,
      [userId],
    );
    if (subscriptionList.rows.length === 0) {
      return res.send({});
    }
    const subscriptionInfo = subscriptionList.rows[0];
    const subscriptionListRes = {
      type: subscriptionInfo.name,
      chosenDate: subscriptionInfo.chosen_date,
      subscriptionDate: dayjs(subscriptionInfo.subscription_date).format(
        'DD/MM/YYYY',
      ),
      items: subscriptionList.rows.map((item) => item.item_name),
    };
    return res.send(subscriptionListRes);
  } catch (error) {
    return res.sendStatus(500);
  }
}
