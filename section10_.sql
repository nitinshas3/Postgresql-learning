--STORED ROUTINE 
-- an sql statement or a set of sql statement that can be stored on db server which can be called no of times z

-- 2 types stored procedure and user defined functions 

--stored procedure - like a funciton for queries 

create or replace procedure procedure_name(parameter_name parameter<type,...)   
language plpgsql
as $$
begin
    --procedural code here
end;
$$;

--example

create or replace procedure update_emp_salary(
    p_employee_id int,
    p_new_salary numeric
)
language plpgsql
as $$
begin   
    update employees
    set salary = p_new_salary
    where emp_id=p_employee_id;
end;
$$;

-- to call the function or procedure
call update_emp_salary(3,70000);

--stored routine 2nd type USER DEFINED FUNCTIONS 

| Feature        | Function            | Procedure              |
| -------------- | ------------------- | ---------------------- |
| Return value   | ✅ Required          | ❌ Not required         |
| Used in SELECT | ✅ Yes               | ❌ No                   |
| Called using   | `SELECT`            | `CALL`                 |
| Transactions   | ❌ Limited           | ✅ Can COMMIT/ROLLBACK  |
| Purpose        | Calculation / logic | Operations / workflows |

CREATE OR REPLACE function function_name(parameters)
returns return_type as $$
begin
    -- function body (sql satements)
    return some_value; -- for scalar functions 
end;
$$ language plpgsql;

--WINDOW FUNCTIONS 
--allow you to perform calculations across a set of rows related to the current ro

--defined by an over() clause

--they enable complex calculations like running totals, moveing averages,rank calculations, and cumulative distributions 

--unlike aggregate functiosn , theis does not collapse rows 

select sum(salary) over() from employees;

--cte common table expression


-- =========================
-- 🔹 CTE (COMMON TABLE EXPRESSIONS)
-- =========================

-- Basic Syntax
WITH cte_name AS (
SELECT column1, column2
FROM table
WHERE condition
)
SELECT * FROM cte_name;

-- Example
WITH high_salary AS (
SELECT name, salary
FROM employees
WHERE salary > 50000
)
SELECT * FROM high_salary;

-- Multiple CTEs
WITH
dept_avg AS (
SELECT dept_id, AVG(salary) AS avg_sal
FROM employees
GROUP BY dept_id
),
high_paid AS (
SELECT * FROM employees WHERE salary > 60000
)
SELECT h.name, d.avg_sal
FROM high_paid h
JOIN dept_avg d
ON h.dept_id = d.dept_id;

-- Recursive CTE (hierarchy)
WITH RECURSIVE emp_tree AS (
SELECT emp_id, manager_id
FROM employees
WHERE manager_id IS NULL

```
UNION ALL

SELECT e.emp_id, e.manager_id
FROM employees e
JOIN emp_tree t
ON e.manager_id = t.emp_id
```

)
SELECT * FROM emp_tree;

-- =========================
-- 🔹 WINDOW FUNCTIONS
-- =========================

-- Basic Syntax
SELECT column,
function() OVER (
PARTITION BY column
ORDER BY column
)
FROM table;

-- SUM over partition
SELECT name, dept, salary,
SUM(salary) OVER (PARTITION BY dept) AS dept_total
FROM employees;

-- Running total
SELECT name, salary,
SUM(salary) OVER (ORDER BY salary) AS running_total
FROM employees;

-- ROW_NUMBER
SELECT name, dept,
ROW_NUMBER() OVER (PARTITION BY dept ORDER BY salary DESC) AS rn
FROM employees;

-- RANK vs DENSE_RANK
SELECT name, salary,
RANK() OVER (ORDER BY salary DESC) AS rnk,
DENSE_RANK() OVER (ORDER BY salary DESC) AS drnk
FROM employees;

-- LAG (previous row)
SELECT name, salary,
LAG(salary) OVER (ORDER BY salary) AS prev_salary
FROM employees;

-- LEAD (next row)
SELECT name, salary,
LEAD(salary) OVER (ORDER BY salary) AS next_salary
FROM employees;

-- FIRST_VALUE
SELECT name,
FIRST_VALUE(salary) OVER (ORDER BY salary) AS lowest_salary
FROM employees;

-- Window frame (running sum)
SELECT name, salary,
SUM(salary) OVER (
ORDER BY salary
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) AS running_total
FROM employees;


