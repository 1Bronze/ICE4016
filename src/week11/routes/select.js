import express from "express";
import { selectSql, createSql } from "../database/sql";

const router = express.Router();

router.get('/', async function (req, res) {
    if (req.cookies.user) {
        const classes = await selectSql.getClasses(req.cookies.user);
        const allClass = await selectSql.getAllClass();
        res.render('select', { 
            user: req.cookies.user,
            title: "Course completion list",
            title2: "Course List (Registration)",
            classes: classes,
            allClass: allClass
         });
    } else {
        res.render('/')
    }

});

router.post('/', async(req, res) => {
    const data = {
        cId: req.body.applyBtn,
        sId: req.cookies.user,
    };
    const canEnroll = await selectSql.canEnroll(data);
    console.log(canEnroll);
    if (canEnroll) {
        await createSql.addClass(data);
    } 
    res.redirect('back');
});

module.exports = router;