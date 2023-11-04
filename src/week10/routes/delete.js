import express from 'express';
import { selectSql, deleteSql } from '../database/sql';

const router = express.Router();

router.get('/', async (req, res) => {
    if (req.session.user != undefined && req.session.user.role === 'student') {
        const participateClass = await selectSql.getParticipateClass(req.session.user.id);
        res.render('delete', {
            title: "Delete",
            participateClass,
        });
    } else{
        res.redirect('/');
    }
});

router.post('/', async (req, res) => {
    console.log("delete :", req.body.delBtn);
    const data = {
        class_id: req.body.delBtn,
        student_id: req.session.user.id,
    };

    await deleteSql.deleteClass(data);

    res.redirect('/delete');
});

module.exports = router;