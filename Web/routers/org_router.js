const express=require('express');
const pool=require('../pool.js');

var router=express.Router();

// 机构注册
router.post('/reg',function(req,res){
    var obj=req.body;
    console.log(obj);
    var sql=`insert into organization(name,legal_preson,phone) values(?,?,?)`;
    pool.query(sql,[obj.name,obj["legal_preson"],obj.phone],function(err,result){
        // if(err) throw err;
        res.send('注册成功');
    })
})

module.exports=router;