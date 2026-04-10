--RELATIONSHIPS 

--Real world databases have many tables like for employee
-- you need to store salary attendance etc etc 

--Type 

--1) one to one 
-- only one in many databases like , emp_id and name in one 
-- only one address number details etc

--2) one to many 
-- emplyee name and employee tasks , many tasks right

--3) many to many 
-- example books and author 

--USE CASES 

-- one to many 

-- condider you need to store name email order date and order price

-- like if we store all this in same table , if the customer keeps repeating for orders , 
-- it keeps on storing the full detials again and again 

-- so instead create 2 tables , one for details of customer
-- other for order details , it will be realted to customer by customer id;

--FOREIGN KEY 
-- the primary key of a table used in another table for realationship of 2 tables 


--NEW PROJECT 

create DATABASE storedb;

CREATE table customers(
    cust_id serial primary key,
    cust_name varchar(100) not null
);

create table orders(
    ord_id serial primary key,
    ord_date date not null,
    price numeric not null,
    cust_id integer not null,
    FOREIGN key(cust_id) references customers(cust_id)

);

INSERT INTO customers (cust_name)

VALUES 

    ('Raju'), ('Sham'), ('Paul'), ('Alex');


INSERT INTO orders (ord_date, cust_id, price)

VALUES 

    ('2024-01-01', 1, 250.00),  

    ('2024-01-15', 1, 300.00),  

    ('2024-02-01', 2, 150.00),

    ('2024-03-01', 3, 450.00),

    ('2024-04-04', 2, 550.00);  


-- JOIN -> operation is used to combine rows from two or more tables based on a related colummn between them.COMMENT

--types COMMENT

---1)cross join - every row of one table to every other row of another table , all combinations COMMENT

select * from customers cross join orders;

--2) inner join - returns only rows wehre there is match between specified columns in both tables COMMENT

select * from customers c -- here c is alias
inner JOIN
orders o 
on c.cust_id = o.cust_id; -- can do without alias also 

-- left join

-- returns all the columns from left column and matching rows from right table 

select * from customers 
left JOIN
orders
on customers.cust_id = orders.cust_id; -- here if no thing matches in other column still all rows will be shown and the other side will be empty , unlike inner join wehre it shows only the thing that has a match in both columns and does not show the things that do not have a match

-- vice verca right join

--3)many to many relation

-- student , courses , student_courses table

create DATABASE institute;

create table students(
    s_id serial primary key,
    name varchar(100) not null
);

create table courses(
    c_id serial primary key,
    name varchar(100) not null,
    fee numeric not null
);

create table enrollment(
    enrollment_id serial primary key,
    s_id int not null,
    c_id int not null,
    enrollment_date date not null,
    foreign key(s_id) references students(s_id),
    foreign key(c_id) references courses (c_id)
);
INSERT INTO courses (name, fee)
VALUES
('Mathematics', 500.00),
('Physics', 600.00),
('Chemistry', 700.00);


INSERT INTO Students (name) VALUES
('Raju'),
('Sham'),
('Alex');

INSERT INTO enrollment (s_id, c_id, enrollment_date)
VALUES
(1, 1, '2024-01-01'), -- Raju enrolled in Mathematics
(1, 2, '2024-01-15'), -- Raju enrolled in Physics
(2, 1, '2024-02-01'), -- Sham enrolled in Mathematics
(2, 3, '2024-02-15'), -- Sham enrolled in Chemistry
(3, 3, '2024-03-25'); -- Alex enrolled in Chemistry

-- now displaying 
-- inner join can also be wriiten simply as join
select * from enrollment e
join students s on e.s_id = s.s_id
join courses c on c.c_id = e.c_id;

-- if you do this you will get the whole thing so select the columns which you need only COMMENT

select s.name,c.name,c.fee from enrollment e
join students s on e.s_id = s.s_id
join courses c on c.c_id = e.c_id;