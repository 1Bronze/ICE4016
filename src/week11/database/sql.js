import mysql from "mysql2";

const pool = mysql.createPool(
  process.env.JAWSDB_URL ?? {
    host: '127.0.0.1',
    user: 'root',
    database: 'WEEK11_INHA_DB',
    password: '',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
  }
);

// async / await 사용
const promisePool = pool.promise();

// selec query
export const selectSql = {
  getUsers: async () => {
    const [rows] = await promisePool.query(`select * from student`);
    return rows;
  },
  getClasses: async (data) => {
    const [rows] = await promisePool.query(`
    select class.id ID, 
    class.name Course, 
    class.professor Professor, 
    department.dname Opening_departments, 
    class.number_of_participant Number_of_participant 
    from class 
    join department on class.did = department.id 
    join class_student on class.id = class_student.class_id 
    join student on class_student.student_id = student.id 
    where student.studentid = ${data}
    `)
    console.log(rows);
    return rows;
  },
  getAllClass: async () => {
    const [rows] = await promisePool.query(`
    select class.id ID, 
    class.name Course, 
    class.professor Professor, 
    department.dname Opening_departments, 
    class.number_of_participant Number_of_participant ,
    (class.number_of_participant - (
      select count(*)
      from class_student
      where class_student.class_id = class.id
    )) Remaining_participants
    from class
    join department on class.did = department.id 
    `)
    return rows;
  },
  canEnroll: async (data) => {
    const ret = await promisePool.query(`
    select case
      when exists (
        select *
        from class_student
        join student on class_student.student_id = student.id
        where student.studentid = ${data.sId} and class_student.class_id = ${data.cId}
      ) then false
      when (
        class.number_of_participant - (
          select count(*)
          from class_student
          where class_student.class_id = class.id
        )) <= 0 then false
      else true
    end as result
    from class
    where class.id = ${data.cId};
    `)
    return Boolean(ret[0][0].result);
  }
}

export const createSql = {
  addClass: async (data) => {
    const uid = await promisePool.query(`select Id from Student where StudentId=${data.sId}`);
    console.log(uid);
    const results = await promisePool.query (
      `insert into class_student values (${uid[0][0].Id}, ${data.cId});`
    )
    return results[0];
  }
}

