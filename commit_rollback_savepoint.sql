-- Starts a new transaction
/* Begin;
-- or
START TRANSACTION -- To execute multiple statements as a single transaction,
we must explicitly start the transaction.

COMMIT:- Saves all changes made during the transaction.
ROLLBACK:- Undoes all changes made during the transaction.
SAVEPOINT:- Sets a Savepoint withiun a transaction to roll back to later 
ROLLBACK To SAVEPOINT:- Rolls back to aspecific savepoint without affecting earlier changes. */

CREATE DATABASE TCL;
USE TCL;

CREATE TABLE orders(
	order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    status VARCHAR(50)
);
DESC orders;

-- Start the transaction --
SET autocommit = 0; -- here we are disabling the autocomit of sql
/* in MySQL auto commit mode is enabled by default which means whenever we execute any SQL statement
is automatically commited/*

/* So in such cases succeded transactions are automatically commited.
To diable the auto commit mode we are using this aslo we cannot disable the auto commit mode of DDL Commands.
In many DBMS it is disable ny default */

BEGIN; 
-- or START TRANSACTION;

INSERT INTO orders VALUES(101,'Geet','Pending');
INSERT INTO orders VALUES(102,'Bob','Pending');
select * from orders;
commit;
update orders set customer_name= 'Rhiya' where order_id = 101;
rollback;
update orders set customer_name = 'parnika' where order_id = 102;
update orders set customer_name = 'Yash' where order_id = 102;
update orders set customer_name = 'mohit' where order_id = 102;

-- insert orders and create savepoint
insert into orders values('103','deo','pending');
insert into orders values('104','jiya','pending');
savepoint sp1;
select * from orders;

update orders set customer_name = 'meetakshi' where order_id = '104';
savepoint sp2;

rollback to savepoint sp1;
rollback to savepoint sp2;

delete from orders where order_id = '102';
select * from orders;
savepoint sp3;

rollback;

truncate orders;
drop database TCL;


