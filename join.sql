create database Basicjoin;
use Basicjoin;
create table employee (
	employee_id int primary key,
    enmae varchar(20)
    );
insert into employee values
(1,'rhiya'),
(2,'yash'),
(3,'parnika'),
(4,'deo');

create table projects (proj_id int primary key , 
	pname varchar(50),
    employee_id int,
    foreign key (employee_id)
    references employee (employee_id));
    
insert into projects values 
(01,'project A ', 1),
(02,'project B ', 2),
(03,'project C ', 3),
(04,'project D ', 4);
