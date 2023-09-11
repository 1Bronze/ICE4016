import express from "express";
import bodyParser from "body-parser";
import path from "path";
import sql from "./sql";

const app = express();
const port = "8080";

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.get("/", async (req, res) => {
  // res.sendFile(path.join(__dirname + "/index.html"));
  const employee = await sql.getEmployee();
  res.json({ Employee: employee });
});

app.listen(port, () => {
  console.log(`server running on ${port}`);
});
