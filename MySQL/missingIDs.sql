/*

Table: Customers

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| customer_id   | int     |
| customer_name | varchar |
+---------------+---------+
customer_id is the primary key for this table.
Each row of this table contains the name and the id customer.
 

Write an SQL query to find the missing customer IDs. The missing IDs are ones that are not in the Customers table but are in the range between 1 and the maximum customer_id present in the table.

Notice that the maximum customer_id will not exceed 100.

Return the result table ordered by ids in ascending order.

The query result format is in the following example.


Example 1:

Input: 
Customers table:
+-------------+---------------+
| customer_id | customer_name |
+-------------+---------------+
| 1           | Alice         |
| 4           | Bob           |
| 5           | Charlie       |
+-------------+---------------+
Output: 
+-----+
| ids |
+-----+
| 2   |
| 3   |
+-----+
Explanation: 
The maximum customer_id present in the table is 5, so in the range [1,5], IDs 2 and 3 are missing from the table.

*/

-- Sample solution:
WITH RECURSIVE CTE AS (
SELECT 1 as n 
UNION ALL
SELECT n+1 FROM CTE WHERE n+1 <= 100)


SELECT n as ids
FROM CTE
WHERE n NOT IN ( 
                SELECT customer_id
                FROM Customers)
AND n < ALL (   SELECT * FROM (
                SELECT MAX(customer_id)
                FROM Customers
                LIMIT 1) j )                
ORDER BY n ASC 

--ALTERNATE SOLUTION SAMPLE:
with recursive t as (
select 1 as id
union all
select id + 1
from t    
where id < (select max(customer_id) from customers ))

select id as ids
from t
left join customers c on 
t.id = c.customer_id
where customer_id is null
