
set names utf8;
drop database if exists out_clinic_sys;
create database out_clinic_sys charset=utf8;

use out_clinic_sys;

create table organization(
    id smallint primary key auto_increment comment "机构id",
    name varchar(30) not null comment "机构名称",
    type smallint not null comment "机构类型：诊所、医院、卫生室",
    bus_license text comment "营业执照（照片）",
    industry_no varchar(30) unique comment "工商编码",
    legal_preson varchar(10) comment "法人",
    phone varchar(30) unique not null comment "联系电话",
    address varchar(100) comment "地址"
);
