const express = require('express');
const pool = require('../pool.js');

var router = express.Router();

// 用户注册
router.post('/regist', function(req, res) {
    var obj = req.body;
    console.log(obj);
    // 判断提交数据中是否存为空
    if (!obj.name || !obj['user_num'] || !obj['card_num'] || !obj.pwd) {
        res.send('各项数据不能为空');
        return;
    }
    var sql = 'insert into in_patient_file(name,user_num,pwd,card_num) values(?,?,?,?)';
    pool.query(sql, [obj.name, obj['user_num'], obj.pwd, obj['card_num']], function(err, result) {
        if (err) throw err;
        // if(err) throw err;console.log(result); 
        res.send('----注册成功!----');
    });
});

// 用户登录
router.get('/login', function(req, res) {
    var obj = req.query;
    console.log(obj);
    var sql = `select * from in_patient_file where user_num=? and pwd=?`;
    pool.query(sql, [obj['user_num'], obj.pwd], function(err, result) {
        if (err) throw err;
        console.log(result.length);
        if (result.length > 0) {
            res.send('登录成功');
        } else {
            res.send('用户名不存在或密码错误！');
        }

    })
});

module.exports = router;