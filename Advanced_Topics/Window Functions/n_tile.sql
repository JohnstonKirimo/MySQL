/*
It allows you to break the result set into a specified number of approximately equal groups, 
or buckets. It assigns each group a bucket number starting from one. For each row in a group, 
the NTILE() function assigns a bucket number representing the group to which the row belongs.
*/


--syntax:
NTILE(buckets) OVER ( 
	PARTITION BY expr1, expr2,...
	ORDER BY expr1 [ASC|DESC], expr2 ...
)


-- Sample code: employee salaries in groups/buckets
SELECT
	first_name, 
	last_name, 
	salary,
	NTILE(5) OVER (
		ORDER BY salary DESC
	) salary_group
FROM 
	employees;


-- using NTILE() with partitioning:
SELECT
	first_name, 
	last_name, 
	department_name,
	salary,
	NTILE(2) OVER (
		PARTITION BY department_name
		ORDER BY salary
	) salary_group
FROM 
	employees e
INNER JOIN departments d
	ON d.department_id = e.department_id;



