/*
Compares two expressions and return null if they are equal, otherwise, return the first expression.
*/

--syntax:
NULLIF(argument_1,argument_2);

--above is equivalent to:
CASE WHEN argument_1 = argument_2
   THEN NULL
ELSE
   argument_1 
END;

--sample code (with coalesce()):
SELECT 
    article_id, 
    title, 
    COALESCE(NULLIF(excerpt,''), LEFT(body, 50)) AS summary
FROM
    articles;
    
