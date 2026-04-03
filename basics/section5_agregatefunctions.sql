--AGREGATE FUNCTIONS

-- COUNT SUM AVG MIN MAX

select count(emp_id) from employee;

select sum(salary) from employee;

select AVG(salary) from employee;

select max(salary) from employee;

--GROUP BY 

-- what if we want to group ppl by their dept or gender or anything 

select dept from employee group by dept; -- this gives you departments 

-- now inside the department what if we need how many ppl are working 

select dept ,count(emp_id) from employee group by dept;

select dept , sum(salary) from employee group by dept;