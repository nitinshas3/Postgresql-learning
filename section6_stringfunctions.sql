-- STRING FUNCTIONS
/*
    CONCAT,CONCAT_WS
    SUBSTR
    REPLACE
    LENGTH
    UPPWER,LOWER
    LEFT,RIGHT
    TRIM,LTRIM,RTRIM
    POSITON
    STRING_AGG
*/

select concat (first_col,second_col);
select concat(first_word,second_word);

-- select means printing the query

select concat(fname,iname) from employee;

-- can name the column also 

select concat(fname,iname) as fullname from employee;

-- this will join both names without space so for that

select concat(fname,' ',iname) as fullname from employee;

-- this isnt a good practice so use concat with seperator

select CONCAT_WS(' ',fname,iname) as fullname from employee;

select concat_ws(':',fname,salary) as name_n_salary from employee;

--2) SUBSTRING

select SUBSTR('hello world how are you ',1,6);

select substr(fname,1,3) from employee;

--3) REPLACE 

select replace('abcxyx','abc','prq');

select dept ,replace('IT','IT','AI') from employee;

--4) REVERSE

select reverse('hello');

select reverse(fname) from employee;

--LENGTH

select length(fname) from employee;

select fname from employee where length(fname) > 5;

--UPPER LOWER

SELECT lower(fname) from employee;
select upper(fname) from employee;

-- LEFT,RIGHT,TRIM

select left('hellow world',4); -- hell

select right('hellow world',4) -- orld

select length('  yoooo supp    ');

select trim ('    yoooo supp    ');

select(length(trim('   yooo  supp    ')));

-- POSITION 

select position('om' in 'Thomas');  -- 3

------------EXERCISE--------------

 --Raj:Sharma:IT
select concat_ws(':',fname,iname,dept) from employee;

-- Raj Sharma:50000.00:IT
select concat_ws(' ',fname,concat_ws(':',iname,salary,dept)) from employee; -- function inside function

--Suman:FINANCE
select concat_ws(':',fname,upper(dept)) from employee;

-- dufferebce type of departments in db
select DISTINCT dept from employee;

--display records from high to low salary
select salary from employee order by salary;

--seeing top 3 records
select * from employee limit 3;

-- show records where firts name starts with letter A
select fname from employee where fname like 'A%';

-- show records wehre length of the lname is 4 characters
select iname from employee where length(iname) = 4;

-- find total number of employees in db
select count(emp_id) from employee;

-- find total no of employees in each dept
-- idk this


--find highest details

select max(salary) from employee; -- only gives salary
select * from employee order by salary desc limit 1; -- what if more than 1
-- try query inside query , the inside query runs first
select * from employee
WHERE
salary = (select max(salary) from employee); --****--

-- lowest salary
select min(salary) from employee;