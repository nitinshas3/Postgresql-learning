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