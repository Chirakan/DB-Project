const express = require("express");
const app = express();
var authRoute = require("./routes/auth");
var buyRoute = require("./routes/buy");

app.get("/", (req, res) => {
  res.send("Server is running!!!!!");
});

app.use(express.json());

app.use("/auth", authRoute);
app.use("/buy", buyRoute);

app.listen(3000, () => {
  console.log("Start server at port http://localhost:3000");
});
