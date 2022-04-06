LAST_VALUE FUNCTION
/*
- Allows you to select the last row in an ordered set of rows.
- Returns the value of the expression from the last row of a sorted set of rows.
*/

--Query Sample
SELECT
   employee_name,
   department,
   hours,
   LAST_VALUE(employee_name) OVER (
   PARTITION BY department
       ORDER BY hours
       RANGE BETWEEN
     UNBOUNDED PRECEDING AND
           UNBOUNDED FOLLOWING
 ) most_overtime_employee
FROM
   overtime;
   
