/*
Lead() Function
 - It  provides access to a row at a specified physical offset which follows the current row.
 - From the current row, you can access data of the next row, or the second 
 row that follows the current row, or the third row that follows the current row, and so on.
 - Also useful for calculating the difference between the value of the current row and that of the following row.
*/

--Syntax overview:
LEAD(return_value [,offset[, default ]]) OVER (
    PARTITION BY expr1, expr2,...
	ORDER BY expr1 [ASC | DESC], expr2,...
)

--Sample code:
SELECT 
	first_name,
	last_name, 
	hire_date, 
	LEAD(hire_date, 1) OVER (
		ORDER BY hire_date
	) AS next_hired
FROM 
	employees;

-- sample code #2
SELECT 
	first_name,
	last_name, 
	department_name,
	hire_date, 
	LEAD(hire_date, 1, 'N/A') OVER (
		PARTITION by department_name
		ORDER BY hire_date
	) AS next_hire_date
FROM 
	employees e
INNER JOIN departments d ON 
	d.department_id = e.department_id;
