/* DATA TYPES
-- CONSTRAINTS 


- DATATYPES 
- Numeric -> int double float decimal
- string ->varchar
- date
- boolean many more

decimal(5,2) means number of decimals can be 2 and big digits can be 5
*/

--CONSTRAINTS - rule applied to column 

--PRIMARY KEY- unique id for each row
--  only one primary key for each table 

-- NOT NULL

create table customers(
    id int not NULL,
    name varchar(100) not null
);
-- not null constraint means it must not be null obviously

-- DEFAULT TYPE
create table customers(
    id int  primary key,
    name varchar(100) not null default 'nitin'
);

--AUTO INCREMENT

 -- used to get sequential numbers in table , like primary key id

create table person(
    id serial primary key,
    firstname varchar(50)

);
-- serial is a datatype in numeric

-- task to create 
create table employee(
    emp_id serial primary key,
    fname varchar(20) not null,
    iname varchar(20) not null,
    email varchar(100) unique,
    dept varchar(10) not null,
    salary decimal(10,2) not null default 30000.00,
    hire_date date not null default current_date
); --unique keyword used here also current_date

--\d by itself → lists all tables, views, and sequences in the current database.
-- \d table_name → shows the structure of a specific table (columns, types, modifiers, indexes, constraints).


