const express = require("express"), //โหลด module express
  router = express.Router();
const db = require("../config/db");

router.post('/ticket', function (req, res) {
  const {
      concert_id, 
      ticket_zone_id, 
      seat_name, 
      purchase_date, 
  } = req.body
});

module.exports = router;
