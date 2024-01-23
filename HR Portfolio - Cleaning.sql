create database Human_Resource;
use human_resource;
select * from hr;
create table hr2 as select*from hr;
alter table hr 
change column ï»¿id emp_id varchar(20) null;
describe hr;
select birthdate from hr;
set sql_safe_updates=0;

update hr
set birthdate = case
   when birthdate like '%/%' then date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
   when birthdate like '%-%' then date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
   Else Null
end;
alter table hr
modify column birthdate date;
select birthdate from hr;

UPDATE hr
set hire_date = case
   when hire_date like '%/%' then date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
   when hire_date like '%-%' then date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
   Else Null
end;

alter table hr
modify column hire_date date;

update hr
set termdate=date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
where termdate is not null and termdate != '';
select termdate from hr;

Alter table hr
modify column termdate date;

select termdate from hr;
ALTER TABLE hr ADD COLUMN age INT;
update hr
set age = timestampdiff(year,birthdate,curdate());

select
min(age) as youngest,
max(age) as oldest
from hr;
select count(*) from hr where age<18;