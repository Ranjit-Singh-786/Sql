show databases
create database rishabh
use rishabh
show tables


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
select * from employee
-- code for to count the value-- 
SELECT SUM(CASE WHEN Gender = "M" THEN 1 ELSE 0 END) as malecount ,
	   SUM(CASE WHEN Gender = "f" THEN 1 ELSE 0 END) AS femalecount  from employee

-- To count percentage
SELECT SUM(CASE WHEN Gender = "M" THEN 1 ELSE 0 END)/count(*)*100 as malecount ,
	   SUM(CASE WHEN Gender = "f" THEN 1 ELSE 0 END)/count(*)*100 AS femalecount  from employee
       
-- percentage with round
SELECT ROUND(SUM(CASE WHEN Gender = "M" THEN 1 ELSE 0 END)/count(*)*100) as malecount ,
	   ROUND(SUM(CASE WHEN Gender = "f" THEN 1 ELSE 0 END)/count(*)*100) AS femalecount  from employee
       
-- percentage with symbol
SELECT CONCAT(ROUND(SUM(CASE WHEN Gender = "M" THEN 1 ELSE 0 END)/count(*)*100),"%") as MALE_RATIO ,
	   CONCAT(ROUND(SUM(CASE WHEN Gender = "f" THEN 1 ELSE 0 END)/count(*)*100),"%") AS FEMALE_RATIO  from employee

### Query to fetch the employee’s salary but replace the LAST 2 digits with ‘XX’
    -- i.e 12345 will be 123XX

SELECT CONCAT(LEFT(salary, LENGTH(salary) - 2), '**') as 'masked_salary' FROM employee;

### Q4: Write a query to fetch even and odd rows from Employee table.

-- fetch for EVEN first way
SELECT * FROM employee where empid %2 = 0

-- fetch for EVEN second way
SELECT * FROM Employee where MOD(Empid,2)=0


-- FETCH FOR ODD
SELECT * FROM employee where empid %2!= 0

-- UNION and UNION ALL
SELECT * FROM employee where empid %2 = 0
union
SELECT * FROM employee where empid %2!= 0

SELECT * FROM employee where empid %2 = 0
union all
SELECT * FROM employee where empid %2!= 0


-- Q5(a): Write a query to find all the Employee names whose name:
-- • Begin with ‘A’
-- • Contains ‘A’ alphabet at second place
-- • Contains ‘T’ alphabet at second last place
-- • Ends with ‘L’ and contains 4 alphabets 
-- • Begins with ‘V’ and ends with ‘A’

-- %  --> for single or multiple character
-- _  --> for single character
select * from employee
SELECT EmpName FROM Employee where EmpName LIKE "A%"
SELECT EmpName FROM Employee where EmpName LIKE "_a%"
SELECT EmpName FROM Employee WHERE EmpName LIKE "%t_"
SELECT EmpName FROM Employee WHERE EmpName LIKE "___L"
SELECT EmpName FROM Employee WHERE EmpName LIKE "v%a"

-- Q5(b): Write a query to find the list of Employee names which is:
-- • starting with vowels (a, e, i, o, or u), without duplicates
-- • ending with vowels (a, e, i, o, or u), without duplicates
-- • starting & ending with vowels (a, e, i, o, or u), without duplicates

-- • starting with vowels (a, e, i, o, or u), without duplicates
SELECT EmpName
FROM Employee
WHERE left(EmpName,1) IN ('a', 'e', 'i', 'o', 'u');

-- • ENDING with vowels (a, e, i, o, or u), without duplicates
SELECT EmpName
FROM Employee
WHERE right(EmpName,1) IN ('a', 'e', 'i', 'o', 'u');

-- • starting & ending with vowels (a, e, i, o, or u), without duplicates
SELECT EmpName FROM Employee
WHERE left(empname,1) in ('a', 'e', 'i', 'o', 'u') and right(empname,1) in ('a', 'e', 'i', 'o', 'u')

SELECT DISTINCT EmpName FROM Employee
WHERE left(empname,1) in ('a', 'e', 'i', 'o', 'u') and right(empname,1) in ('a', 'e', 'i', 'o', 'u')

### Ques  Find the all record which salary greater than average salary

select * from employee where salary >=(select avg(salary) from employee)


### Q6: Find Nth highest salary from employee table with and without using the
-- TOP/LIMIT keywords.
-- LIMIT 0 , 1         --> 0 FOR offset and 1 For LIMIT


-- second highest salary using LIMIT
select empname , salary from employee order by salary desc limit 1,1

-- unique rank assigned based on the salary assume window fun,, as a column
SELECT EmpName , salary , ROW_NUMBER() over (order by salary desc) as salary_rank FROM Employee 

-- ASSIGN the unique rank , assume window fun.. as a table.
select empname ,salary , rank_column FROM (select *,row_number() over(order by salary desc) as rank_column from employee) as rank_table ;


-- FIND Nth Highest salary without using LIMIT / OFFSET

SELECT EmpName , salary 
FROM
(select *, ROW_NUMBER() over (order by salary desc) as salary_rank from employee) as RANK_TABLE
WHERE  RANK_TABLE.salary_rank = 2





