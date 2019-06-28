use out_clinic_sys;
create table diagnose(
    id int primary key auto_increment, 
    patient_id int not null comment '病人id',
    diagnose_id varchar(10) comment '诊断id，获取icd_10中的诊断编码',
    diagnose_name varchar(100) comment '诊断名称，既可以从icd_10中获取，也可以手输'
);
