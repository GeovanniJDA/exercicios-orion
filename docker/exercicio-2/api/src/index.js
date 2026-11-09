const express = require('express');
const { Pool } = require('pg');

// Connection settings come from the environment (set in docker-compose.yml)
const pool = new Pool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
});

const app = express();
app.use(express.json());

app.get('/health', (req, res) => res.json({ status: 'ok' }));

app.get('/items', async (req, res) => {
  const { rows } = await pool.query('SELECT * FROM items ORDER BY id');
  res.json(rows);
});

app.post('/items', async (req, res) => {
  const name = req.body?.name;
  if (typeof name !== 'string' || !name.trim()) {
    return res.status(400).json({ error: 'name is required' });
  }
  const { rows } = await pool.query(
    'INSERT INTO items (name) VALUES ($1) RETURNING *',
    [name.trim()]
  );
  res.status(201).json(rows[0]);
});

async function main() {
  // ponytail: inline table creation instead of a migration tool — adopt one when the schema grows
  await pool.query(
    `CREATE TABLE IF NOT EXISTS items (
       id SERIAL PRIMARY KEY,
       name TEXT NOT NULL,
       created_at TIMESTAMPTZ NOT NULL DEFAULT now()
     )`
  );
  app.listen(3000, () => console.log('API listening on port 3000'));
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
