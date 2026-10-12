create database demo;
use demo;
CREATE TABLE Students (
	Student_ID Int,
    Name varchar(50),
    Age Int,
    Course varchar(50)
);
select * from Students;
show columns from Students;
describe Students;
select Name, Course from Students;
insert into Students values (0,"Rhiya",21,"");
insert into Students value (null,"yash",40,"");
update Students Set Student_ID = 6
WHERE Student_ID = 1;
set sql_safe_updates=0; 
update Students SET Student_ID = 7
Where Student_ID = null;
Delete from Students 
where Age = 40;
