const express = require("express"); //โหลด module express
var cors = require("cors");
const app = express(); // สร้าง Instance express
var authRoute = require("./routes/auth"); //เรียกไฟล์ auth จาก โฟลเดอร์ routes
var buyRoute = require("./routes/buy");

app.use((req, res, next) => {
  //middleware เช็ค status
  console.log("LOGGED");
  next();
});

app.get("/", (req, res) => {
  // กำหนด path url ในการเข้าเว็บ
  res.send({ id: 1, title: "HI, I'm New Coding" });
});

app.use(express.json());
app.use(cors());

app.use("/auth", authRoute); //เรียกใช้งาน route จาก auth.js
app.use("/buy", buyRoute);

app.listen(3000, () => {
  // Start Server ที่ localhost Port 3000
  console.log("Start server at port http://localhost:3000");
});
