-- CLAUSES  

--where

select * from employee where dept = 'IT';

--relational things like and or

select * from employee where dept = 'IT' or dept = 'finance';

select * from employee where salary > 100000;

-- what if multiple coloum constraints 

select * from employee where dept in ('IT','finance','HR');

select * from employee where dept not in ('IT','finance','HR');

-- what if we want unique things from a column 

select DISTINCT dept from employee;

-- ORDER BY  sorting 

select * from employee ORDER BY fname; -- by default ascending 

select * from employee order by iname desc; -- descending 

-- what if we only want to see just some rows 

select * from employee limit 3;

-- what if we want names starting with some letter or ending with it

select * from employee where fname like 'A%';
-- % sign means any letters or words , so starting with A other letters dont mantter;

select * from employee where iname like '%a'; --ending with a , case sensitive

select * from employee where fname like '%i%'; -- i in middle of name

-- what if we want rows where dept has 2 letters
select * from employee where dept like '__';

-- what if we want rows where dept had second letter a;

select * from employee where dept like '_A%';

-- select __ gives the column which is mentioned if * it gives all 

-- later to that selected column we can perform other operations like agregate functions etc