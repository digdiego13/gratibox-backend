import supertest from 'supertest';
import { createUser, userSession } from '../src/factories/userFactory.js';
import connection from '../src/database/database.js';
import app from '../src/app.js';
import dayjs from 'dayjs';

afterAll(async () => {
  connection.end();
});
describe('POST /subscription', () => {
  test('Returns 401 if not Logged In', async () => {
    const result = await supertest(app)
      .post('/subscription')
      .send({
        subscriptionType: 'Semanal',
        subscriptionDates: '1',
        subscriptionItems: ['Incensos'],
        adress: 'Rua das Ostras',
        cep: '33030385',
        city: 'Rio De Janeiro',
        state: 'RJ',
      })
      .set('Authorization', `Bearer token errado`);
    expect(result.status).toEqual(401);
  });

  test('Returns 200 if client is Logged AND body is Correct', async () => {
    const user = await createUser();
    const token = await userSession(user.id);
    const result = await supertest(app)
      .post('/subscription')
      .send({
        subscriptionType: 'Semanal',
        subscriptionDates: '1',
        subscriptionItems: ['Incensos'],
        adress: 'Rua das Ostras',
        cep: '22020060',
        city: 'Rio De Janeiro',
        state: 'RJ',
      })
      .set('Authorization', `Bearer ${token}`);
    expect(result.status).toEqual(200);
  });
});

describe('GET /subscription', () => {
  test('Returns 401 if not Logged In', async () => {
    const result = await supertest(app)
      .get('/subscription')
      .set('Authorization', `Bearer token errado`);
    expect(result.status).toEqual(401);
  });

  test('Returns 200 if client is Logged', async () => {
    const user = await createUser();
    const token = await userSession(user.id);

    const show = await supertest(app)
      .post('/subscription')
      .send({
        subscriptionType: 'Semanal',
        subscriptionDates: '1',
        subscriptionItems: ['Incensos'],
        adress: 'Rua das Ostras',
        cep: '22020060',
        city: 'Rio De Janeiro',
        state: 'RJ',
      })
      .set('Authorization', `Bearer ${token}`);

    const result = await supertest(app)
      .get('/subscription')
      .set('Authorization', `Bearer ${token}`);
    expect(result.status).toEqual(200);
  });
});
