Rank Function
/*
Similar to dense_rank except it leaves gaps in the sequence of ranked values
when there are two or more rows with the same rank
*/

-- Query Syntax:
 RANK() OVER (
    PARTITION BY <expression>[{,<expression>...}]
    ORDER BY <expression> [ASC|DESC], [{,<expression>...}]
)


-- Query Sampple:
SELECT
    sales_employee,
    fiscal_year,
    sale,
    RANK() OVER (PARTITION BY
                     fiscal_year
                 ORDER BY
                     sale DESC
                ) sales_rank
FROM
    sales;


-- Rank with CTE example
WITH order_values AS(
    SELECT
        orderNumber,
        YEAR(orderDate) order_year,
        quantityOrdered*priceEach AS order_value,
        RANK() OVER (
            PARTITION BY YEAR(orderDate)
            ORDER BY quantityOrdered*priceEach DESC
        ) order_value_rank
    FROM
        orders
    INNER JOIN orderDetails USING (orderNumber)
)
SELECT
    *
FROM
    order_values
WHERE
    order_value_rank <=3;
