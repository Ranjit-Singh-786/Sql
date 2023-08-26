show databases
create database rishabh
use rishabh

## table creating for the problem
CREATE TABLE Employee (
EmpID int NOT NULL,
EmpName Varchar(30),
Gender Char(1),
Salary int,
City Char(20) )


CREATE TABLE EmployeeDetail (
EmpID int NOT NULL,
Project Varchar(20),
EmpPosition Char(20),
DOJ date )

### INSERTING THE VALUES IN A TABLE

INSERT INTO Employee
VALUES (1, 'Arjun', 'M', 75000, 'Pune'),
(2, 'Ekadanta', 'M', 125000, 'Bangalore'),
(3, 'Lalita', 'F', 150000 , 'Mathura'),
(4, 'Madhav', 'M', 250000 , 'Delhi'),
(5, 'Visakha', 'F', 120000 , 'Mathura')


INSERT INTO EmployeeDetail
VALUES (1, 'P1', 'Executive', '2019-01-26'),
(2, 'P2', 'Executive', '2020-04-05'),
(3, 'P1', 'Lead', '2021-03-10'),
(4, 'P3', 'Manager', '2019-12-11'),
(5, 'P2', 'Manager', '2020-01-08')


### Q1(a): Find the list of employees whose salary ranges between 2L to 3L.

select EmpName ,salary from Employee
 where salary between 200000 and 300000;
 
 
 ### Q1(b): Write a query to retrieve the list of employees from the same city.
 ## first way
 
 select EmpName , city
 from Employee
 where city =
 (select city from Employee 
 group by city
 having count(city)>1)

## second way
select e1.empid, e1.empname , e1.city from Employee e1 , Employee e2
where e1.city = e2.city and e1.empid !=e2.empid;


### Q1(c): Query to find the null values in the Employee table.

select * from employee where empid IS NULL;
select count(*) from employee where empid IS NULL;
select count(*) AS 'Null_count' from employee where empid IS NULL;


### Q2(a): Query to find the cumulative sum of employee’s salary.
select salary from employee;

SELECT EmpID, Salary, SUM(Salary) OVER (ORDER BY EmpID) AS CumulativeSum
FROM Employee

### Q2(c): Write a query to fetch 50% records from the Employee table.

select * from employee 
where EmpID <= (select count(EmpID)/2 FROM Employee)


### Q2(b): What’s the male and female employees ratio.

SELECT
(COUNT(*) FILTER (WHERE Gender = 'M') * 100.0 / COUNT(*)) AS MalePct,
(COUNT(*) FILTER (WHERE Gender = 'F') * 100.0 / COUNT(*)) AS FemalePct
FROM Employee;


### Query to fetch the employee’s salary but replace the LAST 2 digits with ‘XX’
    -- i.e 12345 will be 123XX

SELECT CONCAT(LEFT(salary, LENGTH(salary) - 2), '**') as 'masked_salary' FROM employee;

