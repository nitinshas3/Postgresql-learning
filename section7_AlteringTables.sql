--ALTERING TABLES
--update query was to update the data in table 
-- this is to change the table itself

-- adding or deleting a new column

alter table person 
add column age int;

alter table person 
add column age int default 0;

alter table person 
drop column age ;

--RENAMING 

alter table person
 rename name  to fname;

alter table employee 
rename iname to lname;

-- RENAMING A TALBE

alter table person 
rename to people;

--adding default values to a colume

alter table people 
alter column fname 
set data type varchar(150);

alter table people
alter column fname
set default 'unknown';

--CHECK CONDITION  inputs values have restrictions 

create table contacts(
    name varchar(50),
    mob varchar(15) unique check(length(mob)>=10) -- as of now crud , clauses , agregate and string functions
);

alter talbe person
add column mob varchar(15) check (length(mob)>=10);

--NAMED CONSTRAINTS 
create table contacts(
    name varchar(50),
    mob varchar(15) unique 
    constraint mob_no_less_than_10digits check(length(mob)>=10)
);

--CASE
select fname,salary,
case WHEN salary>=50000 then 'high'
else 'low'
ese as salary_category
from employee;