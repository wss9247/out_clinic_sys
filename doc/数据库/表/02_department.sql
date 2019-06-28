use out_clinic_sys;
create table department(
    id smallint	primary key auto_increment	comment '科室id',
    name varchar(10)	not null comment '科室名称',
    type tinyint	not null comment '科室属性，可多选。科室属性为药房时，需设置药房属性。关联表sys_dict_type',
    emp_id smallint comment '科室主任ID，关联表employee',
    description	varchar(300) comment '科室描述',
    org_id	smallint not null comment'机构id'
);