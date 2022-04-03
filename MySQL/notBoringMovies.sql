/*

Write an SQL query to report the movies with an odd-numbered ID and a description that is not "boring".

Return the result table ordered by rating in descending order.
*/
--solution
select * from cinema where id % 2 = 1
and description <> 'boring'
order by rating desc;
