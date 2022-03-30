/*
Write an SQL query to find all dates' Id with higher temperatures compared
to its previous dates (yesterday).
*/

-- solution
SELECT a.Id
FROM Weather a, Weather b
WHERE DATEDIFF(a.RecordDate, b.RecordDate) = 1
AND a.Temperature > b.Temperature ;
