import bcrypt from 'bcrypt';
import { v4 as uuid } from 'uuid';
import connection from '../../database/database.js';

async function signIn(req, res) {
  const { email, password } = req.body;
  try {
    const result = await connection.query(
      `
        SELECT * FROM users
        WHERE email = $1
    `,
      // eslint-disable-next-line comma-dangle
      [email]
    );

    const user = result.rows[0];
    if (user && bcrypt.compareSync(password, user.password)) {
      // sucesso, usuário encontrado com este email e senha!

      const token = uuid();
      await connection.query(
        `
          INSERT INTO sessions ("user_id", token)
          VALUES ($1, $2)
        `,
        // eslint-disable-next-line comma-dangle
        [user.id, token]
      );

      res.send({
        name: user.name,
        token,
        email: user.email,
        adress: user.adress,
      });
    } else {
      // usuário não encontrado (email ou senha incorretos)
      res.sendStatus(403);
    }
  } catch (error) {
    res.sendStatus(500);
  }
}

export default signIn;
