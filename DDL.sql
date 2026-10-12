show databases;
use intitute_db;
use institute_db;
create table Staff(staff_id int, first_name varchar(50),last_name char,DOB int,dept_id int);
create table department(dept_id int,dept_name varchar(20), dept_location varchar(50));
desc Staff;
desc department;

alter table Staff add location varchar(50);
alter table Staff add joining_year int;
alter table Staff add age int, add contact_no int (10);
desc Staff;

alter table Staff Modify first_name text; 
desc staff;
alter table staff drop column age;
alter table Staff Modify first_name varchar(20); -- changing the size of data type 
desc staff;

alter table staff add Primary key (staff_id); -- to add foreign key add primary key 1st 
desc staff;
alter table department add primary key (dept_id);
desc department;
alter table staff drop primary key;

alter table staff add foreign key (dept_id) references department (dept_id); -- foreign kay is applied on staff table 
-- alter table tablename add constraint FK_(any custon name) foreign key (columnname 1) references tablename2 (columnname)
-- drop foreign key (even if you drop the MUL will not go but it is dropped)

alter table staff rename Staff1;
desc staff1;
rename table staff1 to staff; -- this is the alt option to rename 

alter table staff rename column DOB to dateOB; -- to rename the column name 
