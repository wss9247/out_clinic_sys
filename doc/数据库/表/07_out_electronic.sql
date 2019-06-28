use out_clinic_sys;
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