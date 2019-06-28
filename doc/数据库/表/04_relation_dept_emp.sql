use out_clinic_sys;
create table relation_dept_emp(
    id smallint primary key auto_increment ,
    dept_id smallint not null comment '科室ID',
    emp_id smallint not null comment '职员ID'
);