import bcrypt from 'bcrypt';
import connection from '../../database/database.js';
import signUpSchema from '../../schemas/signUpSchema.js';

async function singUp(req, res) {
  // eslint-disable-next-line object-curly-newline
  const { email, password, username, adress } = req.body;
  const isCorrectBody = signUpSchema.validate(req.body);

  if (isCorrectBody.error) {
    return res.status(400).send(`${isCorrectBody.error.details[0].message}`);
  }
  const passwordHash = bcrypt.hashSync(password, 10);
  try {
    const existEmail = await connection.query(
      `
        SELECT * FROM users
        WHERE email = $1
    `,
      // eslint-disable-next-line comma-dangle
      [email]
    );

    if (existEmail.rowCount !== 0) {
      return res.sendStatus(403);
    }

    await connection.query(
      `
        INSERT INTO users
        (name, email, password, adress)
        VALUES ($1, $2, $3, $4)
    `,
      // eslint-disable-next-line comma-dangle
      [username, email, passwordHash, adress]
    );
    return res.sendStatus(200);
  } catch (erro) {
    return res.sendStatus(500);
  }
}

export default singUp;
