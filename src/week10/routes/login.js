import express from "express";
import { selectSql } from "../database/sql";

const router = express.Router();

router.get('/', (req, res) => {
    res.render('login');
});

router.post('/', async (req, res) => {
    const vars = req.body;
    const students = await selectSql.getStudent();

    students.map((student) => {
        console.log("student ID: ", student.id);

        if (vars.id == student.id && vars.password === student.phone_number) {
            console.log('login success!');
            req.session.user = { id: student.id, role: 'student', checkLogin: true };
        }
    });

    if (req.session.user == undefined) {
        console.log('login failed!');
        res.send(`<script>
                    alert('login failed!');
                    location.href='/';
                </script>`)
    } else if (req.session.user.checkLogin && req.session.user.role === 'student') {
        res.redirect('/delete');
    }
});

module.exports = router;