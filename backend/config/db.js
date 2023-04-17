// var mysql = require("mysql2");
// require("dotenv").config();

// const db = mysql.createConnection(process.env.DATABASE_URL);

// module.exports = db;

const mysql = require('mysql2');

const db = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: 'password',
  database: 'DB',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

module.exports = db;
