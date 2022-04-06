Dense Rank function

/*
The DENSE_RANK() is a window function that assigns a rank to each row within a partition or result
set with no gaps in ranking values.
The rank of a row is increased by one from the number of distinct rank values which come before the row.
*/

-- Example Syntax :
DENSE_RANK() OVER (
   PARTITION BY <expression>[{,<expression>...}]
   ORDER BY <expression> [ASC|DESC], [{,<expression>...}]
)

--Query Sample
SELECT
   sales_employee,
   fiscal_year,
   sale,
   DENSE_RANK() OVER (PARTITION BY
                    fiscal_year
                ORDER BY
                    sale DESC
               ) sales_rank
FROM
   sales;
