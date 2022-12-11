
-- ------> learn create table with all constrain   <--------

show databases;
use ineuron;
show warnings;
show tables;
show columns from iriss;
select * from ineuron.iriss;         -- <--- without use databaase directly access
SELECT * from iriss limit 2;
select * from iriss limit 2 offset 2            --  <<<<--- OFFSET FOR SKIP ROW
SELECT SUM(sepal_len + sepal_width) AS 'sum_of_two_column',COUNT(species) AS 'no_of_entry'
FROM iriss
WHERE sepal_len + sepal_width < 7;
    
select DISTINCT sepal_width FROM iriss;
-- CASE KEYWORD
select idd , sepal_width , CASE 
WHEN sepal_width=3 THEN 'Three'
WHEN sepal_width =2 THEN 'Two'
WHEN sepal_width = 4  THEN 'four'
ELSE 'nothing'
END AS 'IF_ELSE' FROM iriss;

-- 2. type of use case keyword
select   CASE 
WHEN sepal_width=3 THEN 'Three'
WHEN sepal_width =2 THEN 'Two'
WHEN sepal_width = 4  THEN 'four'
ELSE 'nothing'
END  as 'condition_columns' FROM iriss;

-- alias AS keyword in sql
select species AS 'category' from iriss;
select species AS 'category' from iriss where species='setosa';
select COUNT(species) AS 'category' from iriss where species='setosa';
select DISTINCT species AS 'unique_species' from iriss ;
select i.species from iriss AS i;
select COUNT(i.species) As 'NO_of_entry' from iriss AS i;
select i.species from iriss AS i where species ='setosa';
select i.species from iriss AS i where i.species = 'setosa';
select i.species AS 'category' from iriss AS i where species = 'setosa';
select i.species AS 'category' from iriss AS i where (species = 'setosa')AND(sepal_len>2);
select COUNT(i.species) AS 'category' from iriss AS i where (species = 'setosa')AND(sepal_len>5);
select COUNT(i.species) AS 'count' ,MAX(sepal_len) as 'max_sepal_len',min(sepal_len) as 'min_sepal_len',round(avg(sepal_len),2) as average from iriss AS i where (species = 'setosa')AND(sepal_len>5);

-- GROUP BY KEYWORD

select species, sum(sepal_len) as 'sum_of_species' from iriss group by species;
select species,COUNT(sepal_len) as 'sum_of_species' from iriss group by species;
select species ,sum(sepal_len) as 'sum_of_species',COUNT(sepal_len) as 'No_of_COUNT' from iriss group by species;
select species ,sum(sepal_len) as 'sum_of_species',COUNT(sepal_len) as 'No_of_COUNT',avg(sepal_len) as 'average' from iriss group by species;

-- GROUP BY KEYWORD WITH HAVING CLAUSE,it is specify a condition on agregate function in group by
select species, ROUND(sum(sepal_len),2) as 'sum_of_species' from iriss group by species HAVING sum(sepal_len)>251;

select species, ROUND(sum(sepal_len),2) as 'sum_of_species',avg(sepal_len) as 'average' from iriss group by species 
HAVING avg(sepal_len)>5.1;

-- SELECT FROM WHERE GROUP BY HAVING ORDER BY <-- SEQUENCE
select species, ROUND(sum(sepal_len),2) as 'sum_of_species',avg(sepal_len) as 'average' from iriss group by species 
HAVING avg(sepal_len)>5.1 order by avg(sepal_len) DESC;

-- SELECT FROM WHERE GROUP BY HAVING ORDER BY LIMIT <-- SEQUENCE
select species, ROUND(sum(sepal_len),2) as 'sum_of_species',avg(sepal_len) as 'average' from iriss group by species 
HAVING avg(sepal_len)>5.1 order by avg(sepal_len) DESC LIMIT 1;


select species, ROUND(sum(sepal_len),2) as 'sum_of_species',avg(sepal_len) as 'average' from iriss 
WHERE sepal_len BETWEEN 4 AND 6 group by species ;

select species, ROUND(sum(sepal_len),2) as 'sum_of_species',ROUND(avg(sepal_len),2) as 'average' from iriss 
WHERE sepal_len BETWEEN 4 AND 6 group by species 
HAVING ROUND(sum(sepal_len),2)<250 ;

SELECT 
    species,
    ROUND(SUM(sepal_len), 2) AS 'sum_of_species',
    ROUND(AVG(sepal_len), 2) AS 'average'
FROM
    iriss
WHERE
    sepal_len BETWEEN 4 AND 6
GROUP BY species
HAVING ROUND(SUM(sepal_len), 2) < 250
ORDER BY ROUND(SUM(sepal_len), 2);

-- SELECT FROM WHERE BETWEEN AND GROUP BY HAVING ORDER BY LIMIT    <--- SEQUENCE
select species, ROUND(sum(sepal_len),2) as 'sum_of_species',ROUND(avg(sepal_len),2) as 'average' from iriss 
WHERE sepal_len BETWEEN 4 AND 6 group by species 
HAVING ROUND(sum(sepal_len),2)<250 ORDER BY ROUND(sum(sepal_len),2) limit 1;

-- ALTER COMMAND OF DDL
show columns from iriss;
ALTER table iriss rename column sepal_width TO sepal_wid;
ALTER table iriss rename column petal_width TO petal_wid;
ALTER TABLE iriss ADD column (Ranjit int);
ALTER TABLE iriss ADD constraint primary key(idd)       -- <=== correct it
ALTER TABLE iriss drop column Ranjit;
UPDATE  iriss set Ranjit = 1 where idd = 0;
select * from iriss limit 2;

-- to check the NULL
SELECT * FROM iriss where Ranjit is null;
SELECT species,sepal_len FROM iriss WHERE Ranjit IS NULL; 
SELECT COUNT(species) AS 'Total_Null' from iriss WHERE Ranjit IS NULL;
SELECT COUNT(species) AS 'Total_Null' from iriss WHERE Ranjit IS NOT NULL;
SELECT sepal_len,species from iriss where ranjit is not null;

--       joins in sql ---------
-- create separate database for join operation
create database joins;
show databases;
use joins;
show tables;

-- create tables for joins operation;
create table customers 
(customer_id int NOT NULL primary key ,
 customer_name varchar(30),
 customer_city varchar(25),
 cutomer_pin int,
 cutomer_salary int);
 
 create table product 
(product_id INT NOT NULL ,
customer_id int NOT NULL ,
 product_name varchar(30),
 product_quality varchar(25),
 product_quatity int,
 product_price int,
 PRIMARY KEY(product_id),
 FOREIGN KEY(customer_id)
 REFERENCES customers(customer_id));
 
 
 create table orders(
 orders_id INT NOT NULL PRIMARY KEY,
 product_id INT NOT NULL ,
 orders_date date,
 orders_day varchar(20),
 delivery_price int,
 FOREIGN KEY(product_id)
 REFERENCES product(product_id));
 
-- -----> insert data into tables   <--------
INSERT INTO customers values
(3,'lalit','hathras',204,1100),
(4,'mohan','sahpau',281,1800);

INSERT INTO product (product_id,customer_id,product_name,product_quality,product_quatity,product_price) 
values
(3,2,'keyboard','bad',22,180),
(4,4,'pointer','good',81,130);

-- ---------> INNER JOIN <-------
select p.product_id , p.customer_id , c.customer_name , p.product_name from
customers as c INNER JOIN product as p ON
c.customer_id=p.customer_id;

-- ----------> INNER JOIN <------------

select c.customer_id as 'customer_id' , p.customer_id as 'prod_cust_id' , c.customer_name , p.product_name from
customers as c INNER JOIN product as p ON
c.customer_id = p.customer_id;

SELECT * FROM customers INNER JOIN product ON
customers.customer_id =product.customer_id;

SELECT c.* FROM customers AS c INNER JOIN product ON
c.customer_id =product.product_id;  

select DISTINCT p.product_id,p.product_name,p.product_quality from customers as c INNER JOIN product AS p
ON  p.product_quality = 'good';

select DISTINCT p.product_price,p.product_id,p.product_name,p.product_quality from customers as c INNER JOIN product AS p
ON  p.product_price>100

select DISTINCT(c.cutomer_salary),p.product_id,p.product_name,p.product_price,c.customer_name from customers as c inner join product as p
on p.product_price > 100 and c.cutomer_salary>10000;

-- -------------> LEFT or LEFT OUTER JOIN <--------------

SELECT c.customer_name,p.product_name,c.customer_id as 'cust_id',p.customer_id as 'prod_id' from customers as c
LEFT join product as p
on
c.customer_id = p.customer_id;

-- -------------> RIGHT or RIGHT OUTER JOIN <--------------

SELECT c.customer_name,p.product_name,c.customer_id as 'cust_id',p.customer_id as 'prod_id' from customers as c
RIGHT join product as p
on
c.customer_id = p.customer_id;

-- -------------> full JOIN (LEFT UNION RIGHT) <--------------
SELECT c.customer_id ,p.customer_id as 'prod_cust_id', c.customer_name,p.product_name from product as p
LEFT join customers as c on c.customer_id = p.customer_id
UNION 
SELECT c.customer_id ,p.customer_id as 'prod_cust_id', c.customer_name,p.product_name from product as p
RIGHT join customers as c on c.customer_id = p.customer_id;
use joins

SELECT c.customer_id ,p.customer_id as 'prod_cust_id', c.customer_name,p.product_name from product as p
LEFT join customers as c on c.customer_id = p.customer_id
UNION all
SELECT c.customer_id ,p.customer_id as 'prod_cust_id', c.customer_name,p.product_name from product as p
RIGHT join customers as c on c.customer_id = p.customer_id;

SELECT c.customer_id ,p.customer_id as 'prod_cust_id', c.customer_name,p.product_name from product as p
LEFT join customers as c on c.customer_id = p.customer_id
UNION  
SELECT c.customer_id ,p.customer_id as 'prod_cust_id', c.customer_name,p.product_name from product as p
RIGHT join customers as c on c.customer_id = p.customer_id;
use joins

-- -------------> CROSS JOIN (cartesian product ) <--------------

SELECT c.customer_name,p.product_name from product as p
CROSS join customers as c;

-- -------------> additional queries on product tables <------
select product_quatity * product_price from product;
select sum(product_quatity*product_price) AS 'total_expenses' from product;
select sum(product_quatity*product_price) AS 'total_expenses_on_bad_prod' from product where product_quality = 'bad';
select sum(product_quatity*product_price) AS 'total_expenses_on_good_prod' from product where product_quality = 'good';



use joins
select * from customers
select * from product
select * from iriss
 select customer_name from customers ;
 select distinct(product_name) from product
 select * from product;
 select * from customers
 
 drop tables product
 use joins
 show tables
desc customers;

-- -----------> SUB QUERY EXAMPLE <---------
-- ----> example of scaler query which gives single output <--------------
select c.cutomer_salary from customers as c where
c.cutomer_salary > (select avg(cutomer_salary) from customers);

select sub.customer_id,sub.customer_name ,sub.cutomer_salary from
(select * from customers) as sub;

SELECT f.customer_id , f.cutomer_salary ,f.product_name from
(SELECT c.customer_id ,p.customer_id as 'prod_cust_id', p.product_name,c.cutomer_salary from product as p
LEFT join customers as c on c.customer_id = p.customer_id
UNION
SELECT c.customer_id ,p.customer_id as 'prod_cust_id', c.customer_name,p.product_name from product as p
RIGHT join customers as c on c.customer_id = p.customer_id) AS f ;

-- ----------> additional functions on object data type feature <------
show databases;
use ineuron;
create table student (
stud_id int NOT NULL PRIMARY KEY  
,student_name varchar(30),
middle_name varchar(30),
surname varchar(30),
course varchar(20),
course_fee int);
desc student;

insert into student values
(1,'ranjit','singh','Thakur','CSE',75000),
(2,'jigar','singh','Thakur','BED',24000),
(3,'ashish','kumar','chaudhary','METRIC',15000);

select * from student;

--  -------> CONCAT(col1,'_',col2) as summary <--------
select CONCAT(student_name,surname) from student;
select CONCAT(student_name," ",surname) AS 'full_name' from student;
select CONCAT(student_name," ",middle_name," ",surname) from student;
select student_name + surname from student;            -- <---- we can,t concat by this operator
select student_name + course_fee from student;          -- <---- 'RAM'+1500== 1500

-- ------> SUBSTRING('ABCD',1,4) == AB <----  1= for start 4 for no. of character 
select SUBSTRING(student_name,2,4) from student;
select SUBSTRING(student_name,2,4),substring(surname,2,3) from student;
select concat(SUBSTRING(student_name,2,4),' ',substring(surname,2,3)) AS 'concate_two_substring' from student;

-- ---------> REVERSE <-----
select REVERSE(student_name) from student;
-- -----------> UPPER <-------
SELECT upper(student_name) from student;
select concat(upper(student_name),' ',substring(surname,2,3)) AS 'concate_two_substring' from student;

-- ------------> LOWER <-----------
SELECT LOWER(student_name) from student;
select concat(LOWER(student_name),' ',UPPER(substring(surname,2,3))) AS 'concate_two_substring' from student;

-- -----------> REPLACE <---------
SELECT REPLACE(student_name,'ranjit','Radhey') FROM  student;   --  <--- this is temporarly replacement not permanent

-- -------> UPDATE <------
UPDATE student set student_name = 'Radhey ji'  where stud_id = 1;        --  <-- for permanent replacement
select * from student;