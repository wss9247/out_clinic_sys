use out_clinic_sys;
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