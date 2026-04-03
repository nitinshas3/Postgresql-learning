create table person(
    id INT,
    name varchar(100),
    city varchar(100)
); -- creates a table 

insert into person(id,name,city)
values(101,'nitin','banglore'); -- like this seperate 

insert into person values(103,'sumeet','karwar'); -- or like this in one line

-- if we insert all the columns no need to mention 
insert into person 
VALUES (105,'balaji','tumkur');

--  READING DATA FROM TABLE 

SELECT * FROM person;  -- for all 

SELECT name,city FROM pesron; -- for some columns

--MODIFYING UPDATING TABLE 
update person
set city = 'london'
WHERE id = 103;

-- DELETING DATA    

delete from person
where id = 105;
