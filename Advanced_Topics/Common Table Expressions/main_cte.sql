--Query Sample 3

WITH topsales2003 AS (
   SELECT
       salesRepEmployeeNumber employeeNumber,
       SUM(quantityOrdered * priceEach) sales
   FROM
       orders
           INNER JOIN
       orderdetails USING (orderNumber)
           INNER JOIN
       customers USING (customerNumber)
   WHERE
       YEAR(shippedDate) = 2003
           AND status = 'Shipped'
   GROUP BY salesRepEmployeeNumber
   ORDER BY sales DESC
   LIMIT 5
)
SELECT
   employeeNumber,
   firstName,
   lastName,
   sales
FROM
   employees
       JOIN
   topsales2003 USING (employeeNumber);
