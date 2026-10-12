create database companydb;
use companydb;
create table employee (emp_id int not null , firstname varchar(40),lastname varchar(40),age int, empzone varchar(40));
desc employee1;
insert into employee values(01,"rhiya","gandhi",21,"east");
select * from employee;

create table employee1 (emp_id int not null unique , firstname varchar(40),lastname varchar(40),age int, empzone varchar(40));
insert into employee1 values(01,"parnika","bhagwat",21,"east");
select * from employee2;
insert into employee1 values(02,"yash","deokate",21,"east");

create table employee2 (emp_id int not null , firstname varchar(40),lastname varchar(40),age int, check (age>20), empzone varchar(40));
insert into employee2 values(01,"rhiya","gandhi",21,"east"); 
insert into employee2 values(02,"yash","deokate",7,"east");-- wont execute
alter table employee2 add column salary int;
alter table employee2 drop column salary;
alter table employee2 add column salary int, add check (salary>10000);
update employee2 set salary = 30000 where emp_id =01;
insert into employee2 values(02,"yash","deokate",7,"east",5000);-- wont execute
show create table employee2; -- to see all the constarints of the table
alter table employee2 drop check employee2_chk_2;

create table employee3 (emp_id int primary key  , firstname varchar(40),lastname varchar(40),age int, check (age>20), empzone varchar(40));
insert into employee3 values(01,"rhiya","gandhi",21,"east"); 
insert into employee2 values(null,"yash","deokate",21,"east"); -- wont execute
alter table employee3 add column salary int, add check (salary >=5000);
alter table employee3 add constraint chk_age_salary check (age>20 and salary > 10000);-- add constraint on multiple tables
insert into employee3 values(02,"rhiya","gandhi",21,"east",11000); 
insert into employee3 values(null,"yash","deokate",21,"east",5000); -- wont execute 
show create table employee3;
desc employee3;
select * from employee3;
alter table employee3 drop check chk_age_salary; -- drop the constraint

-- default constraint : set a default value for the column 
create table employee4 (emp_id int primary key , firstname varchar(10), lastname varchar(10), age int, dept varchar(10) default ("IT"));
insert into employee4 (emp_id,firstname,lastname,age)
values (1, 'rhiya' , 'gandhi', 21); -- this syntax is to add multiple values into specific columns
insert into employee4 (emp_id,firstname,lastname,age)
values (2, 'yash' , 'deokate', 21);
desc employee4;

-- Create index statment is used to create indexs in the table 
-- indexes are used to retreive data from the database more quickyly 
-- it is not seen by the users it is used to search more quickyly 
select * from employee4;
create index demoindex on employee4(firstname);
create index demoindex2 on employee4(firstname, lastname);
show indexes from employee4;
drop index demoindex2 on employee4;

-- auto increement the id value 
create table person(
	personid int not null auto_increment,
    lastname varchar(20) not null,
    firstname varchar(20),
    age int,
    primary key (personid)
);
desc person;
insert into person (lastname,firstname,age) values
("gandhi","saniya",23),
("deokate","yash",21);
select * from person;
