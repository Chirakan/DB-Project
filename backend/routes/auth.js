const express = require("express"),
  router = express.Router();
const db = require("../config/db");
const bcrypt = require("bcrypt");

router.get("/user", async function (req, res) {
  db.query(`SELECT * FROM User`, (error, results) => {
    if (error) {
      throw error;
    }
    res.json(results);
  });
});

router.get("/user/:id", async function (req, res) {
  const { id } = req.params;

  db.query(
    `SELECT * FROM User
      INNER JOIN Address ON User.user_id = Address.user_id
    WHERE
      User.user_id = ?`,
    [id],
    (error, results) => {
      if (error) {
        throw error;
      }
      res.json(results[0]);
    }
  );
});

router.post("/register", async function (req, res) {
  const {
    firstName,
    lastName,
    username,
    email,
    password,
    gender,
    birthday,
    phoneNumber,
  } = req.body;

  const hashedPassword = bcrypt.hashSync(password, 10);

  const { address, country, province } = req.body.address;

  const createUser = `INSERT INTO User (firstName, lastName, username, email, password, gender, birthday, phoneNumber) VALUES (?, ?, ?, ?, ?, ?, ?, ?)`;

  db.query(
    createUser,
    [
      firstName,
      lastName,
      username,
      email,
      hashedPassword,
      gender,
      birthday,
      phoneNumber,
    ],
    (error, results) => {
      if (error) {
        console.log(error);
      } else {
        const createAddress = `INSERT INTO Address (address, country, province, user_id) VALUES (?, ?, ?, ?)`;

        const userId = results.insertId;

        db.query(
          createAddress,
          [address, country, province, results.insertId],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.send(`Created user ${firstName} with id ${userId}`);
            }
          }
        );
      }
    }
  );
});

module.exports = router;
