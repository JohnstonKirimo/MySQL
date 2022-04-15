/*

An extension of Group By. It allows for the option to include extra rows that represent the subtotals,
 (super-aggregate rows) along with the grand total row.

*/

-- sample syntax
SELECT 
    c1, c2, aggregate_function(c3)
FROM
    table
GROUP BY ROLLUP (c1, c2);

 --sample code
 SELECT 
    warehouse, SUM(quantity)
FROM
    inventory
GROUP BY ROLLUP (warehouse);

-- sample code
SELECT 
    warehouse, product, SUM(quantity)
FROM
    inventory
GROUP BY warehouse, ROLLUP (product);

