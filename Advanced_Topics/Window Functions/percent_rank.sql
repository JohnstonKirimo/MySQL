Percent Rank Function
/*
The PERCENT_RANK() calculates the percentile rank of a row within a partition or result set.
*/

--Syntax:
PERCENT_RANK()
    OVER (
        PARTITION BY expr,...
        ORDER BY expr [ASC|DESC],...
    )

--Query Sample:
WITH t AS (
    SELECT
        productLine,
        SUM(orderValue) orderValue
    FROM
        productLineSales
    GROUP BY
        productLine
)
SELECT
    productLine,
    orderValue,
    ROUND(
       PERCENT_RANK() OVER (
          ORDER BY orderValue
       )
    ,2) percentile_rank
FROM
    t;

-- Query sample with partition
 SELECT
    productLine,
    orderYear,
    orderValue,
    ROUND(
    PERCENT_RANK()
    OVER (
        PARTITION BY orderYear
        ORDER BY orderValue
    ),2) percentile_rank
FROM
    productLineSales;
