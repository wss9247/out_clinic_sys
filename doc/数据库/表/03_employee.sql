use out_clinic_sys; 
create table employee(
	id smallint primary key auto_increment comment '职员编号',
	name varchar(10) not null comment '职员姓名',
	staff_num char(11) unique not null comment '职员登录名：常用员工手机号',
	pwd varchar(18) not null comment '密码：不超过18位',
	sex bool default 0 comment '性别：0-男，1-女',
	card_num char(18) unique not null comment '身份证号',
	caritify_type tinyint comment '执业类别',
	cratify_num	varchar(30)	unique comment '执业证书编号',
	introduce varchar(500) comment '个人介绍',
	limits varchar(10) comment '权限：可以有多个权限'
);