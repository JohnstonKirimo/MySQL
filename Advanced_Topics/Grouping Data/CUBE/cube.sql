/*
Used to generate subtotals like the ROLLUP extension. It also generates subtotals for all combinations of grouping columns specified in the GROUP BY clause
*/

-- sample code syntax:
SELECT 
    c1, c2, AGGREGATE_FUNCTION(c3)
FROM
    table_name
GROUP BY CUBE(c1 , c2);


-- sample code:
SELECT
   warehouse,
   SUM(quantity)
FROM
   inventory
GROUP BY
   CUBE(warehouse)
ORDER BY
   warehouse;  


-- sample code #2:
SELECT
   COALESCE(department_name, '-') department,
   COALESCE(job_title,'-') job,
   COUNT(*) ,
   SUM(salary) salary
FROM
   employees
INNER JOIN departments USING (department_id)
INNER JOIN jobs USING (job_id)
GROUP BY
   CUBE(department_name,job_title)
ORDER BY
   department_name ASC NULLS LAST;