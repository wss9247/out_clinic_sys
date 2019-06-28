
set names utf8;
drop database if exists out_clinic_sys;
create database out_clinic_sys charset=utf8;

use  out_clinic_sys;
-- 机构表
create table organization(
    id smallint primary key auto_increment comment "机构id",
    name varchar(30) not null comment "机构名称",
    type smallint comment "机构类型：诊所、医院、卫生室",
    bus_license text comment "营业执照（照片）",
    industry_no varchar(30) unique comment "工商编码",
    legal_preson varchar(10) comment "法人",
    phone varchar(30) unique not null comment "联系电话",
    address varchar(100) comment "地址"
);
-- 科室表
create table department(
    id smallint primary key auto_increment comment '科室id',
    name varchar(10) not null comment '科室名称',
    type tinyint not null comment '科室属性，可多选。科室属性为药房时，需设置药房属性。关联表sys_dict_type',
    emp_id smallint comment '科室主任ID，关联表employee',
    description varchar(300) comment '科室描述',
    org_id smallint not null comment'机构id'
);
-- 职员表
create table employee(
    id smallint primary key auto_increment comment '职员编号',
    name varchar(10) not null comment '职员姓名',
    staff_num char(11) unique not null comment '职员登录名：常用员工手机号',
    pwd varchar(12) not null comment '密码：不超过12位',
    sex bool default 0 comment '性别：0-男，1-女',
    card_num char(18) unique not null comment '身份证号',
    caritify_type tinyint comment '执业类别',
    cratify_num varchar(30) unique comment '执业证书编号',
    introduce varchar(500) comment '个人介绍',
    limits varchar(10) comment '权限：可以有多个权限'
);
-- 科室职员关系表
create table relation_dept_emp(
    id smallint primary key auto_increment ,
    dept_id smallint not null comment '科室ID',
    emp_id smallint not null comment '职员ID'
);
-- 患者信息表
create table in_patient_file(
    in_patient_file_id int primary key auto_increment comment '病人编号',
    name varchar(10) not null comment '姓名',
    pwd varchar(12) not null comment '密码',
    user_num char(11) unique not null comment '手机号（登录名）',
    sex bool default 0 comment '性别：0男，1女',
    card_num char(18) unique not null comment '身份证号',
    birthday date comment '出生日期',
    p_reg_time date comment '注册时间',
    address varchar(100) comment '出生地址',
    contact_name varchar(10) comment '其他联系人姓名',
    relation tinyint comment '关系：0-父母，2-兄弟姊妹，3-其他',
    contact_tel char(11) comment '电话'
); 
-- 门诊挂号登记表
create table out_regist_sheet(
    out_reg_id int primary key auto_increment comment '就诊记录ID',
    patient_num char(11) not null comment '患者手机号，关联表in_patient_file',
    in_patient_file_id int comment '患者信息ID，关联表in_patient_file',
    name varchar(10) comment '姓名',
    sex bool comment '性别：0男，1女',
    age tinyint comment '年龄',
    dept_id smallint comment '挂号科室id',
    dept_name varchar(10) comment '挂号科室名称',
    emp_id smallint comment '挂号医生id',
    emp_name varchar(10) comment '挂号医生姓名',
    regtype tinyint comment '挂号类别 prescription_sheet',
    staus tinyint comment '挂号状态，0-待诊，1-已接诊，2-结束就诊，3-作废',
    reg_time date comment '挂号登记时间'
);
-- 门诊病历表
create table out_electronic(
    out_elec_id int primary key auto_increment comment '编号',
    patient_id int not null comment '病人ID',
    dept_id smallint comment '就诊科室ID',
    dept_name varchar(10) comment '就诊科室名称',
    emp_id smallint comment '就诊医生ID',
    emp_name varchar(10) comment '就诊医生姓名',
    chief_complaint varchar(500) comment '主诉',
    disease_history varchar(500) comment '既往史',
    allergies varchar(200) comment '过敏史',
    temp_type tinyint comment '体温类型：1-口温，2-腋温，3-肛温',
    temperature decimal(4,2) comment '体温',
    BP varchar(10) comment '血压，如：145/79 mmHg',
    breathe tinyint comment '呼吸',
    Pulse tinyint comment '脉搏',
    HR tinyint comment '心率',
    height decimal(5,2) comment'身高 cm',
    weight decimal(4,2) comment '体重 kg',
    save_time date comment '病历保存时间',
    save_doc_id smallint comment '最后一次保存病历的医生id'   
);
-- 门诊诊断记录表
create table diagnose(
    id int primary key auto_increment, 
    patient_id int not null comment '病人id',
    diagnose_id varchar(10) comment '诊断id，获取icd_10中的诊断编码',
    diagnose_name varchar(100) comment '诊断名称，既可以从icd_10中获取，也可以手输'
);
-- ICD_10诊断编码
create table ICD_10(
    id varchar(10) primary key comment '诊断id',
    name varchar(100) not null comment '诊断编码'
);
