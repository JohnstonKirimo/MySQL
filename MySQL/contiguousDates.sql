/*

Table: Failed

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| fail_date    | date    |
+--------------+---------+
fail_date is the primary key for this table.
This table contains the days of failed tasks.
 

Table: Succeeded

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| success_date | date    |
+--------------+---------+
success_date is the primary key for this table.
This table contains the days of succeeded tasks.
 

A system is running one task every day. Every task is independent of the previous tasks. The tasks can fail or succeed.

Write an SQL query to generate a report of period_state for each continuous interval of days in the period from 2019-01-01 to 2019-12-31.

period_state is 'failed' if tasks in this interval failed or 'succeeded' if tasks in this interval succeeded. Interval of days are retrieved as start_date and end_date.

Return the result table ordered by start_date.

*/

--sample solution:
WITH CTE1 AS
(
Select Fail_Date AS Date1, 'failed' AS period_state 
From Failed
Where Year(Fail_Date) = '2019'
 
UNION

Select Success_Date, 'succeeded'
From Succeeded
Where Year(success_date) = '2019'
)

, CTE2 AS 
(
Select Period_State, Date1, ROW_NUMBER() OVER(Order by Date1) AS Overall_rank, ROW_NUMBER() OVER(Partition by Period_State Order by Date1) AS Status_rank
From CTE1
Order by Date1
)

,CTE3 AS
(
Select Period_State, Date1, (Overall_rank - Status_rank) AS Rank1
From CTE2
)

Select Period_State, MIN(Date1) AS start_date, MAX(Date1) AS end_date
From CTE3 
Group by Period_State, Rank1;


-- ALTERNATIVE SOLUTION:

-- FIND START DATE (alias group_date, as I will use it for grouping later) FOR EACH FAILED ROW
WITH failed_groups AS
(
    SELECT
        fail_date as date_p,
        'failed' as period_state,
        DATEADD(day, 1 - DENSE_RANK() OVER(ORDER BY fail_date ASC), fail_date)  as group_date
    FROM Failed
    WHERE fail_date BETWEEN '2019-01-01' AND '2019-12-31'
)
-- SAME FOR SUCCEEDED
, success_groups AS
(
    SELECT
        success_date as date_p,
        'succeeded' as period_state,
        DATEADD(day, 1 - DENSE_RANK() OVER(ORDER BY success_date ASC), success_date)  as group_date
    FROM Succeeded
    WHERE success_date BETWEEN '2019-01-01' AND '2019-12-31'
)
-- ASSEMBLE ALL SUCCESS AND FAIL TASKS IN THE SAME TABLE
, assembled AS
(
    SELECT *
    FROM success_groups
    UNION ALL
    SELECT *
    FROM failed_groups
)
-- GROUP BY PERIOD STATE AND GROUP_DATE (THE START DATE FOR EACH PERIOD)
SELECT
    period_state,
    MIN(date_p) as start_date,
    MAX(date_p) as end_date
FROM assembled
GROUP BY period_state, group_date
ORDER BY 3 ASC