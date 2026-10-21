-- filtering data from the table 
-- where 

create database organization;
use organization;
create table employee (empid int not null primary key,
First_name varchar (20), 
Last_name varchar (20),
gender char, 
role varchar(15), 
dept varchar(15), 
manager_id varchar(10));

insert into employee values 
(1,'rhiya','gandhi','F','Team leader','Development','M1'),
(2,'yash','deokate','M','Team leader','retail','M2'),
(3,'parnika','bhagwat','F','Manager','HR','M3'),
(4,'nikhil','deo','M','President','HR','M4'),
(5,'mohit','dhumal','M','President','Development','M5');
select * from employee;

-- select distinct keyword
-- distinct clause will only preserve one null value since it considers all null values to be the same
-- we will get the values which are distinct in the required column
-- used by order by clause
select distinct dept from employee order by dept;
select distinct role from employee order by role;

-- and operator = is a logocal operator that will combine 2 or more boolean expression and returns 0,1 or null 
-- and operator used to filter the data with where clasue 
select * from employee where role = 'president' and dept = 'development';  
select * from employee where role = 'team leader' and dept = 'hr'; -- if this is not present it will return null

-- OR operator : used for filtering the data with where clause and gives combine value true if either of it is true
select * from employee where role = 'team leader' OR dept = 'hr'; 

-- In operator - if the value is IN the table for the searched value 
select * from employee where role in ('president', 'manager');
select * from employee where role in ('hr', 'hr'); -- if not present it will be null

-- not in the table (except this all will be shown)
select * from employee where role NOT in ('president','manager');

-- between operator = returns if the value belongs to the given range
alter table employee add column Experience int;
select * from employee;
update employee set Experience = 5 where empid =1;
update employee set Experience = 5 where empid =2;
update employee set Experience = 10 where empid =3;
update employee set Experience = 4 where empid =4;
update employee set Experience = 2 where empid =5;

-- BETWEEEN OPERATOR 
select * from employee where Experience between 1 and 5; -- from 1 to 5 exp all values shown
select * from employee where Experience=2  OR Experience = 10; -- specific exp

-- like operator 
select * from employee where Last_name like 'B%';
select * from employee where First_name like 'r%';

-- limit operator - to limit the number of rows to be returned
select * from employee order by Experience limit 4; -- this will be sorted by the experience value it will be in ascending value 

-- is null - wether the value is null or not 
insert into employee values (6,"",'mehta','F','president','hr','M6',10);
insert into employee values (7,"jiya",null,'F','president','hr','M7',15);
select * from employee where Last_name is null; -- it will show which has null value 

-- filtering data from table

select*from employee;
select count(empid) from employee where dept="hr";
select min(experience) from employee;
select max(experience) from employee;
select sum(experience) from employee;
select avg(experience)as emp_exp from employee;

-- group by clause- divides a set of rows into subgroups 

-- find the dept wise employee count

select dept ,count(*) as employee_count from employee group by dept;
select role ,count(*) as employee_count from employee group by role;
select gender ,count(*) as employee_count from employee group by gender;

-- having clause - each group produced by group clause is evaluated by having clause 
-- and if the result is true the row  

select dept, sum(experience) as total_exp from employee group by dept
having total_exp>=10 and total_exp<=20;

select role,sum(experience) as total_exp from employee group by role
having total_exp >=1 and total_exp<=10;

-- fetch dept wise employee count using  having clause and sort the data

select dept,count(empid) from employee group by dept
having count(empid) >= 2
order by count(empid)desc;

select dept,sum(experience) as total_exp from employee group by dept
having total_exp >=1 or total_exp <=20;

