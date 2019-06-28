const express=require('express');
const bodyparser=require('body-parser');

// 引入用户信息路由
const patientInfoRouter=require('./routers/patientInfo_router.js');
const orgRouter=require('./routers/org_router.js');

var server=express();
server.listen(8080);


server.use(express.static('public'));
server.use(express.static('ajax'));
server.use(express.static('css'));
server.use(express.static('images'));
server.use(bodyparser.urlencoded({
    extended:false
}));

// 
server.use('/patient',patientInfoRouter);
server.use('/org',orgRouter);

