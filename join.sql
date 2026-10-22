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

insert into employee values
(5,'mohit'),
(6,'shravan');

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
select * from projects;
select * from employee;

-- inner join only matching records will be displayed of both tables
select * from employee 
Join projects -- default is inner join
on employee.employee_id = projects.employee_id;

/*fetch the employee name and the project name they belong to
only 2 columns will be shown */

select e.enmae , p.pname from employee e -- object of the table created
inner join projects p 
on e.employee_id = p.employee_id;

insert into projects values 
(05,'project A ', 5);

select e.enmae , p.pname from employee e -- everythiong of project table will be visible 
right join projects p 
on e.employee_id = p.employee_id;

select e.enmae , p.pname from employee e -- every ename of employee table will be visible i.e the left table
left join projects p 
on e.employee_id = p.employee_id;

-- full outer join - using union display all matching and non matching data from both table 
/*join full table both*/

select * from employee 
left join projects -- all the nonmetching and inner join from project table 
on employee.employee_id = projects.employee_id -- want all table not perticular column so didnt use object 
union 
select * from employee 
right join projects 
on employee.employee_id = projects.employee_id;

/*display employee who has not been assigned any project */
select employee.enmae, projects.pname
from employee
left join projects
on employee.employee_id = projects.employee_id
where projects.proj_id is null;

-- employee with projects
select employee.enmae, projects.pname
from employee
left join projects
on employee.employee_id = projects.employee_id
where projects.proj_id is not null;



