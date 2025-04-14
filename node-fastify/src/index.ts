// import Fastify from 'fastify';
// import { Client } from 'pg';

// const server = Fastify();
// const client = new Client({
//   user: 'myuser',
//   host: 'postgres',
//   database: 'mydb',
//   password: 'mypassword',
//   port: 5432
// });

// client.connect();

// server.get('/', async () => {


//   const res = await client.query('SELECT NOW()');
//   return res.rows[0];
// });

// server.listen({ port: 3001, host: '0.0.0.0' });


import Fastify from 'fastify';

const server = Fastify();

server.get('/', async () => {
  return {
    message: 'Hello from Fastify!',
    status: 'success',
    data: {
      id: 1,
      name: 'Dummy Data',
      timestamp: new Date().toISOString()
    }
  };
});

server.listen({ port: 3001, host: '0.0.0.0' }, (err, address) => {
  if (err) {
    console.error(err);
    process.exit(1);
  }
  console.log(`Server listening at ${address}`);
});
