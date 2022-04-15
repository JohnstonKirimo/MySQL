/*

 GROUPING SETS is an option of the GROUP BY clause. The GROUPING SETS defines multiple grouping sets within the same query.

 */

 -- sample code
 SELECT
    warehouse,
    product, 
    SUM (quantity) qty
FROM
    inventory
GROUP BY
    GROUPING SETS(
        (warehouse,product),
        (warehouse),
        (product),
        ()
    );
