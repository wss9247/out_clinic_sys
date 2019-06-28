use out_clinic_sys;
create table ICD_10(
    id varchar(10) primary key comment '诊断id',
    name varchar(100) not null comment '诊断编码'
);