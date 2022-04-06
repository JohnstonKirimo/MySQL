--Recursive CTE
/*
A recursive common table expression (CTE) is a CTE that has a subquery
which refers to the CTE name itself.


The recursive member must not contain the following constructs:

Aggregate functions e.g., MAX, MIN, SUM, AVG, COUNT, etc.
GROUP BY clause
ORDER BY clause
LIMIT clause
DISTINCT
Note that the above constraint does not apply to the anchor member.
Also, the prohibition on DISTINCT applies only when you use UNION operator.
In case you use the UNION DISTINCT operator, the DISTINCT is permitted.

In addition, the recursive member can only reference the CTE name once and in its FROM clause, not in any subquery.
*/
--example structure:
WITH RECURSIVE cte_name AS (
    initial_query  -- anchor member
    UNION ALL
    recursive_query -- recursive member that references to the CTE name
)
SELECT * FROM cte_name;

--Query Sample 1
WITH RECURSIVE cte_count (n)
AS (
      SELECT 1
      UNION ALL
      SELECT n + 1
      FROM cte_count
      WHERE n < 3
    )
SELECT n
FROM cte_count;
