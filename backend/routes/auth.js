var express = require("express"),
  router = express.Router();

router.get("/register", function (req, res) {
  const { username, firstName, lastName, password, email, phoneNumber } =
    req.body;

  const sqlQuery = `INSERT INTO User ()`;
});

module.exports = router;
