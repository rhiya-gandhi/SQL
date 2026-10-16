CREATE DATABASE company;
USE company;
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    City VARCHAR(50),
    bdate DATE
);
INSERT INTO Employee VALUES
(1, 'Amit', 'Pune', '2000-05-12'),
(2, 'Neha', 'Mumbai', '2005-08-20'),
(3, 'Rahul', 'Nashik', '2006-02-15'),
(4, 'Priya', 'Kolhapur', '2003-11-25'),
(5, 'Sneha', 'Satara', '2000-07-10');

INSERT INTO Investor VALUES
(101, 'Investor_A', '2025-01-10', 50000, 1),
(102, 'Investor_B', '2025-02-15', 75000, 2),
(103, 'Investor_C', '2025-03-20', 60000, 3),
(104, 'Investor_D', '2025-04-12', 90000, 4),
(105, 'Investor_E', '2025-05-18', 45000, 5);

CREATE TABLE Investor (
    inv_no INT PRIMARY KEY,
    inv_name VARCHAR(50),
    inv_date DATE,
    inv_amt DECIMAL(10,2),
    emp_id INT
);

select * from Employee;
select * from Investor;

ALTER TABLE Employee ADD Age INT, ADD Salary INT ,
ADD CONSTRAINT chk_age CHECK (Age <= 50),
ADD CONSTRAINT chk_salary CHECK (Salary >= 10000);
show create table Employee;

ALTER TABLE Investor ADD Age INT;
ALTER TABLE Investor MODIFY inv_name TEXT;
desc Investor;
desc Employee;
ALTER TABLE Employee RENAME COLUMN emp_id TO E_id;
UPDATE Employee SET City = 'Nagpur' WHERE E_id = 4;
DELETE FROM Investor WHERE inv_no = 105;
ALTER TABLE Investor DROP COLUMN Age;
ALTER TABLE Employee DROP CHECK chk_age;
ALTER TABLE Investor
ADD CONSTRAINT fk_employee FOREIGN KEY (emp_id) REFERENCES Employee(E_id);
SELECT inv_no, inv_name, inv_date, inv_amt FROM Investor;
RENAME TABLE Investor TO Investor_Details;
select * from Investor_Details;
ALTER TABLE Investor_Details DROP FOREIGN KEY fk_employee;
TRUNCATE TABLE Investor_Details;
TRUNCATE TABLE Employee;
DROP TABLE Investor_Details; 
DROP TABLE Employee;