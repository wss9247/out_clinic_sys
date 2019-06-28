use out_clinic_sys;
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