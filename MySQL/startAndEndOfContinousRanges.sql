/*
SQL Schema
Table: Logs

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| log_id        | int     |
+---------------+---------+
log_id is the primary key for this table.
Each row of this table contains the ID in a log Table.
 

Write an SQL query to find the start and end number of continuous ranges in the table Logs.

Return the result table ordered by start_id.

*/
-- sample solution:
WITH num
     AS (SELECT log_id,
                Row_number() OVER (ORDER BY log_id) row_num
         FROM   logs)
SELECT Min(log_id) start_id,
       Max(log_id) end_id
FROM   num
GROUP  BY log_id - row_num

-- alternative solution:
with cte
as
(
    select log_id, log_id - row_number() over(order by log_id) Grp
    from Logs
)

select min(log_id) start_id, max(log_id) end_id
from cte
group by Grp

