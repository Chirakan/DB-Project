const express = require("express"),
  router = express.Router();
const db = require("../config/db");

router.get("/user", async function (req, res) {
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

  let userId;

  const createUser = `INSERT INTO User (firstName, lastName, username, email, password, gender, birthday, phoneNumber) VALUES ("${firstName}", "${lastName}", "${username}", "${email}", "${password}", "${gender}", "${birthday}", "${phoneNumber}")`;

  const createAddress = `INSERT INTO Address (address, country, province, user_id) VALUES ("${address}", "${country}", "${province}", "${userId}")`;

  db.query(createUser, (error, results) => {
    if (error) {
      console.log(error);
    } else {
      const res = results.json();
      userId = res[0].user.id;
    }
  });

  db.query(createAddress, (error, results) => {
    if (error) {
      console.log(error);
    } else {
      res.json(results);
    }
  });
});

module.exports = router;
