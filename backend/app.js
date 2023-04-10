const express = require("express");
const app = express();
var authRoute = require("./routes/auth");

app.get("/", (req, res) => {
  res.send("Hi Everything");
});

app.use("/auth", authRoute);

app.listen(3000, () => {
  console.log("Start server at port 3000.");
});
