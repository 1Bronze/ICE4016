import express from 'express';
import { selectSql } from '../database/sql';

const router = express.Router();

router.get('/', async (req, res) => {
    if (req.session.user != undefined && req.session.user.role === 'student') {
        const studentInfo = await selectSql.getStudentInfo(req.session.user.id);
        res.render('info', {
            title: "Information",
            studentInfo: studentInfo,
        });
    } else{
        res.redirect('/');
    }
});

module.exports = router;