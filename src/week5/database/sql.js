import mysql from "mysql2";

require("dotenv").config();

const pool = mysql.createPool({
  host: "127.0.0.1",
  port: 3306,
  user: "root",
  password: "",
  database: "inha",
});

const promisePool = pool.promise();

export const ApplyQuery = {
  applyquery: async (Query) => {
    const sql = Query;
    const [result] = await promisePool.query(sql);
    return result;
  },
};
