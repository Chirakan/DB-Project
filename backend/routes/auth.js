const express = require("express"),
  router = express.Router();
const db = require("../config/db");

router.get("/user", async function (req, res) {
  db.query(`SELECT * FROM User`, (error, results, fields) => {
    if (error) {
      throw error;
    }
    res.json(results);
  });
});

module.exports = router;
