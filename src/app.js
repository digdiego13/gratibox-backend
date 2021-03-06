import express from 'express';
import cors from 'cors';
import singUp from './controllers/signUp/signUp.js';
import signIn from './controllers/signIn/signIn.js';
import logout from './controllers/logout.js';
import getSubscription from './controllers/subscription/getSubscription.js';
import postSubscription from './controllers/subscription/postSubscription.js';

const app = express();
app.use(cors());
app.use(express.json());

app.get('/status', (req, res) => {
  // Manda como resposta o texto 'Hello World'
  res.send('Server online');
});

app.post('/sign-up', singUp);
app.post('/sign-in', signIn);
app.post('/logout', logout);

app.get('/subscription', getSubscription);
app.post('/subscription', postSubscription);

export default app;
