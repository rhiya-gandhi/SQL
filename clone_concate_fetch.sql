create database user;
use user;
show databases;
create table customer (custid int, custname varchar(15),city varchar(10),product varchar(15),price int);
desc customer;

insert into customer values (01,"rhiya","pune","soap",50);
insert into customer values (02,"yash","baramati","shampoo",100);
insert into customer values (03,"deo","kolhapur","conditioner",150);
select * from customer;

alter table customer add constraint primary key(custid);
select custid, custname, city from customer; -- to display specific columns
select * from customer where custid = 01 or custid = 02;  -- to display 2 id datas
-- how to clone the existing table 
create table CloneTable as select * from customer;
select * from CloneTable;
drop table CloneTable;

select custname, product, price from customer where price >= 15;
select * from customer where city = 'pune';
 
-- sorting data using order by single column
select * from customer order by price; -- by default ascending order
select * from customer order by price desc;

-- sort multiple column data by order by
select * from customer order by city,price; -- city sorted with alphabetical order (priority wise)
select * from customer order by price,city; -- this will be sorted by price 
select * from customer order by price asc,city desc; -- here also priority will be to price

-- sinlge row function 
-- case convertion function (upper case to lower and viceversa)
-- Q .convert custname to upper case of cust id 01
select upper(custname), lower(product) from customer where custid = 03;
-- to all record
select upper(custname), lower(product) from customer;

alter table customer add column lastname varchar(15);
desc customer;
update customer set lastname = "gandhi" where custid = 01; 
update customer set lastname = "deokate" where custid = 02;
update customer set lastname = "nikhil" where custid = 03;
select * from customer; 
-- join names
select concat(custname,' ' ,lastname) from customer;
-- add the alias name (that is the column name)
select concat(custname,' ' ,lastname) as Fullname from customer;

-- use substr adn instr functions
select * from customer;
select substr(custname,1,3) from customer; -- start from 1st letter till 3rd letter 
select substr(custname,1,1) from customer; -- only 1st letter
select substr(custname,1) from customer; -- full name

select instr(custname,"a") as position from customer; -- the letter a is at which position in the name 
insert into customer values (04,"anamika","karad","soap",200,"singh"); -- multiple letter position first pos it tell

select substr(custname,1,3) as substring, instr(custname,"a") as instring  from customer;

select substr(custname,1,3) as substring, instr(custname,"a") as instring  from customer where custid = 01;

-- date and time function
select now();
select now() as current_datetime;
alter table customer add column datetime date;
update customer set datetime = '2024-02-20' where custid = 01;
update customer set datetime = '2024-02-10' where custid = 02;
update customer set datetime = '2024-02-25' where custid = 03;
select * from customer;
