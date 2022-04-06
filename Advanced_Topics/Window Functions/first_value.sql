FIRST_VALUE FUNCTION

Returns the value of the expression from the first row of the window frame.

--Query Sample:
SELECT
   employee_name,
   department,
   hours,
   FIRST_VALUE(employee_name) OVER (
       PARTITION BY department
       ORDER BY hours
   ) least_over_time
FROM
   overtime;
