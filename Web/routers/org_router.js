const express=require('express');
const pool=require('../pool.js');

var router=express.Router();

// 机构注册
router.post('/reg',function(req,res){
    var obj=req.query;
    res.send('测试响应');
})

module.exports=router;