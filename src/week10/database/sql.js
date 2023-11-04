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

export const selectSql = {
  getStudent: async () => {
    const sql = `select * from student`;
    const [result] = await promisePool.query(sql);
    return result;
  },
  getStudentInfo: async (data) => {
    const sql = `select * from student where student.id="${data}"`;
    const [result] = await promisePool.query(sql);
    return result[0];
  },
  getParticipateClass: async (data) => {
    const sql = `select class.id, class.name, class.professor from student_in_class join class on student_in_class.class_id=class.id where student_in_class.student_id=${data}`;
    const [result] = await promisePool.query(sql);
    return result;
  }
};

export const deleteSql = {
  deleteClass: async (data) => {
    console.log("delete student_in_class student_id=", data.student_id, " class_id=", data.class_id);
    const sql = `delete from student_in_class where student_id="${data.student_id}" and class_id="${data.class_id}"`;
    console.log(sql);
    await promisePool.query(sql);
  },
};
