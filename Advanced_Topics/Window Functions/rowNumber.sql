ROW_NUMBER() Function:
    Assigns a sequential integer number to each row in the query’s result set.

-- syntax:
 ROW_NUMBER() OVER (
[PARTITION BY expr1, expr2,...]
ORDER BY expr1 [ASC | DESC], expr2,...
)

-- Example code:
SELECT 
    ROW_NUMBER() OVER (
            ORDER BY salary
    ) row_num, 
    first_name, 
    last_name, 
    salary
FROM
    employees;

-- Used for pagination. E.g: to display all employees on a table in an application by pages,
-- which each page has ten records

-- sample code:
-- pagination get page #2

SELECT * FROM (
    SELECT 
        ROW_NUMBER() OVER (ORDER BY salary) row_num, 
        first_name, 
        last_name, 
        salary
    FROM
        employees
    ) t    
WHERE
    row_num > 10 AND row_num <=20;

-- Using ROW NUMBER() With CTE
WITH t AS(
    SELECT 
        ROW_NUMBER() OVER (
            ORDER BY salary
        ) row_num, 
        first_name, 
        last_name, 
        salary
    FROM
        employees
)
SELECT 
    * 
FROM 
    t
WHERE 
    row_num > 10 AND 
    row_num <=20;

-- sample code to find highest salary per department using row number()
SELECT 
    department_name,
    first_name,
    last_name,
    salary
FROM 
    (
        SELECT 
            department_name,
            `ROW_NUMBER()` OVER (
                PARTITION BY department_name
                ORDER BY salary DESC) row_num, 
            first_name, 
            last_name, 
            salary
        FROM 
            employees e
            INNER JOIN departments d 
                ON d.department_id = e.department_id
    ) t
WHERE 
    row_num = 1;

