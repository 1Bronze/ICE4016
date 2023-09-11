import mysql from "mysql2";

const pool = mysql.createPool({
  host: "localhost",
  port: 3306,
  user: "root",
  password: "",
  database: "ice4016",
});

const promisePool = pool.promise();

const sql = {
  getEmployee: async () => {
    const results = await promisePool.query(`
        SELECT * FROM employee
        `);

    return results;
  },
};

export default sql;
