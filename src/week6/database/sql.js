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

// select query
export const selectSql = {
  getBuilding: async () => {
    const sql = `select * from building`;
    const [result] = await promisePool.query(sql);
    return result;
  },
  getDepartment: async () => {
    const sql = `select * from department`;
    const [result] = await promisePool.query(sql);
    return result;
  },
  getRoom: async () => {
    const sql = `select * from room`;
    const [result] = await promisePool.query(sql);
    return result;
  },
  getStudent: async () => {
    const sql = `select * from Student`;
    const [result] = await promisePool.query(sql);
    return result;
  },
  getClass: async () => {
    const sql = `select * from class`;
    const [result] = await promisePool.query(sql);
    return result;
  },
};

// insert query
export const insertSql = {
  setStudent: async (data) => {
    const sql = `insert into student values (
            "${data.Id}", "${data.Name}", "${data.Email}", 
            "${data.PhoneNumber}", "${data.Major}"
        )`;
    console.log(data);
    await promisePool.query(sql);
  },
};

// update query
export const updateSql = {
  updateStudent: async (data) => {
    console.log(data);
    const sql = `
            UPDATE Student 
            SET id = ${data.Id}, name = "${data.Name}", 
                email = "${data.Email}", phone_number = "${data.PhoneNumber}",
                major = "${data.Major}"
            WHERE id = ${data.Id}`;
    console.log(sql);
    await promisePool.query(sql);
  },
  updateDepartment: async (data) => {
    console.log(data);
    const sql = `
            UPDATE Department 
            SET id = ${data.Id}, email = "${data.Email}", 
                phone_number = "${data.PhoneNumber}",
                major_id = "${data.MajorId}"
            WHERE Id = ${data.Id}`;
    console.log(sql);
    await promisePool.query(sql);
  },
};
