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
      console.log(results);
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
      phonenumber, 
      email, 
      password, 
      address, 
      postcode,
  } = req.body;

  const hashedPassword = bcrypt.hashSync(password, 10);

  // const { address, country, province } = req.body.address;

  const createUser = `INSERT INTO Users (username, firstName, lastName, gender, birthday, phonenumber, email, password, address, postcode) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;

  db.query(
    createUser,
    [
      username, 
      firstName, 
      lastName, 
      gender, 
      birthday, 
      phonenumber, 
      email, 
      password, 
      address, 
      postcode
    ],
    // (error, results) => {
    //   if (error) {
    //     console.log(error);
    //   }
    //   // const createAddress = `INSERT INTO Address (address, country, province, user_id) VALUES (?, ?, ?, ?)`;

    //   const userId = results.insertId;

    //   db.query(
    //     createAddress,
    //     [address, country, province, results.insertId],
    //     (error, results) => {
    //       if (error) {
    //         console.log(error);
    //       } else {
    //         console.log("insert ", results);
    //         res.send(`Created user ${firstName} with id ${userId}`);
    //       }
    //     }
    //   );
    // }
  );
});

module.exports = router;
