# in this one sql file i has covered all the command and operations,
# and some other are on working 👍
show databases;
use world;
show tables;
desc city;
select * from city;
select * from city where Name= 'Herat';
select name , countrycode from city;
select countrycode , population from city where Countrycode = 'afg';
select countrycode , population from city where Countrycode = 'afg' and population < 186800;
select countrycode , population , count(*) from city where Countrycode = 'afg' or population < 186800;
select distinct countrycode  from city
select countrycode , count(*) from city group by countrycode
select countrycode , count(*) from city group by countrycode order by countrycode
select countrycode , count(*) from city group by countrycode order by countrycode desc
select sum(population) from city
select avg(population) from city
select min(population) from city
select * from city where population = (select min(population) from city)
select * from city where population = select min(population) from city
show databases
create database if not exists ineuron
show warnings
select * from ineuron.ineuronstudent
select min(age) from ineuron.ineuronstudent    # it will return only value
select * from ineuron.ineuronstudent where ineuron.ineuronstudent.age =  (select min(age) from ineuron.ineuronstudent)   # nested query select all where age is minimum
# there is parenthesis mandatory for nested querey
use world
show tables
desc city
select countrycode , count(*) from city group by countrycode order by countrycode desc limit 10
# group by with order by with limit
select countrycode ,avg(id),sum(id) ,count(*) , min(population) , max(population)  from city group by countrycode order by countrycode desc
select avg(population) from (select * from city where countrycode ="zwe") as a 
select avg(population) from city
set sql_safe_updates = 0  # if you want to update any value in your table
# then it may be possible it will say that this is not safe. then hit this command of your value

# procedure in sql without parameter
DELIMITER &&
create procedure selectall()
BEGIN
	select * from world.city;      # THERE SEMICOLON MANDATORY
END &&

call selectall()

# procedure in sql with parameter

DELIMITER &&
CREATE PROCEDURE countryfilter2(IN valu varchar(10),in valu2 int)
BEGIN
	SELECT * from city where countrycode = valu and population < valu2;
END &&

call countryfilter2('zwe',600000)

# query on query by using alias but next line of query return a same result
select * from (select name , countrycode , population from city ) as a where a.population < 600000
select name , countrycode , population from city where population < 600000

(select name , countrycode , population from city as) a * from a WHERE a.population < 600000      # it should work but
# i dont know why is,nt work

view in sql  ....

CREATE VIEW three as select name , countrycode , population from city
# created now check
select * from three      # 👍

eg.2 on view
select * from three where countrycode = 'afg' and population < 237500

# eg other insert whole data into in another same table
insert into table1 select * from

#  and some other operation will be going on like "JOIN , TRIGGER , & other some specl character
👍👍👍👍👍👍👍👍
