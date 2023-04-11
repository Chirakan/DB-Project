var mysql = require("mysql2");
require("dotenv").config();

const db = mysql.createConnection(process.env.DATABASE_URL);

module.exports = db;
