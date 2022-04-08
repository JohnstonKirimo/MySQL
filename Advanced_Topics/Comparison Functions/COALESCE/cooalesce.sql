/* Return the first non-null argument in the argument list.
*/

--Sample Code:
SELECT
	ID,
	product_name,
	COALESCE (
		product_summary,
		LEFT (product_description, 50)
	) excerpt,
	price,
	discount
FROM
	products;
    
