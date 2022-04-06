LAG FUNCTION
/*
- Returns value of the n_th row before the current row in a partition. Returns Null if no preceding row.
- Let's you access data of a previous row from the current row in the same result set
- i.e. allows you to look back a number of rows and access data of that row from the current window
*/

--Syntax:
LAG(<expression>[,offset[, default_value]]) OVER (
    PARTITION BY expr,...
    ORDER BY expr [ASC|DESC],...
)


-- Query Sample
WITH productline_sales AS (
    SELECT productline,
           YEAR(orderDate) order_year,
           ROUND(SUM(quantityOrdered * priceEach),0) order_value
    FROM orders
    INNER JOIN orderdetails USING (orderNumber)
    INNER JOIN products USING (productCode)
    GROUP BY productline, order_year
)
SELECT
    productline,
    order_year,
    order_value,
    LAG(order_value, 1) OVER (
        PARTITION BY productLine
        ORDER BY order_year
    ) prev_year_order_value
FROM
    productline_sales;
