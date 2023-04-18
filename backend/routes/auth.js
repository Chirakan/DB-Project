const express = require("express"),
  router = express.Router();
const db = require("../config/db");
const bcrypt = require("bcrypt");

router.get("/user", function (req, res) {
  db.query(`SELECT * FROM users`, (error, results) => {
    if (error) {
      throw error;
    }
    console.log(results);
    res.json(results);
  });
});

router.get("/user/:id", function (req, res) {
  const { id } = req.params;

  db.query(
    `SELECT * FROM Users
    WHERE
      user_id = ?`,
    [id],
    (error, results) => {
      if (error) {
        throw error;
      }
      res.json(results[0]);
    }
  );
});

router.post("/register", function (req, res) {
  const {
    username,
    firstName,
    lastName,
    gender,
    birthday,
    phoneNumber,
    email,
    password,
    address,
    postcode,
  } = req.body;

  const hashedPassword = bcrypt.hashSync(password, 10);

  const createUser = `INSERT INTO users (username, first_name, last_name, gender, birthday, phonenumber, email, password, address, postcode) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;

  db.query(
    createUser,
    [
      username,
      firstName,
      lastName,
      gender,
      birthday,
      phoneNumber,
      email,
      password,
      address,
      postcode,
    ],
    (error, results) => {
      if (error) {
        throw error;
      }
      db.query(
        `SELECT * FROM users
    WHERE
      user_id = ?`,
        [results.insertId],
        (error, results) => {
          if (error) {
            throw error;
          }
          res.json(results[0]);
        }
      );
    }
  );
});

module.exports = router;
