const express = require("express"),
  router = express.Router();
const db = require("../config/db");

router.get("/allUser", async function (req, res) {
  db.query(`SELECT * FROM User`, (error, results) => {
    if (error) {
      throw error;
    }
    res.json(results);
  });
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

  const { address, country, province } = req.body.address;

  const createUser = `INSERT INTO User (firstName, lastName, username, email, password, gender, birthday, phoneNumber) VALUES ("${firstName}", "${lastName}", "${username}", "${email}", "${password}", "${gender}", "${birthday}", "${phoneNumber}")`;

  db.query(createUser, (error, results, fields) => {
    if (error) {
      console.log(error);
    } else {
      const createAddress = `INSERT INTO Address (address, country, province, user_id) VALUES ("${address}", "${country}", "${province}", ${results.insertId})`;

      const userId = results.insertId;

      db.query(createAddress, (error, results) => {
        if (error) {
          console.log(error);
        } else {
          res.send(`Created user ${firstName} with id ${userId}`);
        }
      });
    }
  });
});

module.exports = router;
