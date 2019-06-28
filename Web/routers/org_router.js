const express = require('express');
const pool = require('../pool.js');

var router = express.Router();

// 机构注册
router.post('/reg', function(req, res) {
        var obj = req.body;
        console.log(obj);
        var sql = `insert into organization(name,legal_preson,phone) values(?,?,?)`;
        pool.query(sql, [obj.name, obj["legal_preson"], obj.phone], function(err, result) {
            if (err) throw err;
            // console.log(result);
            if (result.affectedRows > 0) {
                res.send('注册成功');
            }
        })
    })
    // 登陆诊所
router.get('/login', function(req, res) {
    var obj = req.query;
    console.log(obj);
    var sql = `select * from organization where phone=?`;
    pool.query(sql, [obj.phone], function(err, result) {
        if (err) throw err;
        console.log(result);
        if (result.length > 0) {
            res.send('登陆成功');
        } else {
            res.send('手机号码错误或不存在，请重新输入');
        }

    })
})

module.exports = router;