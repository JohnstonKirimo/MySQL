
/*
Write a SQL query to find the cancellation rate of requests with unbanned users
(both client and driver must not be banned) each day between "2013-10-01" and "2013-10-03".
Round Cancellation Rate to two decimal points.
*/

#solution

SELECT a.request_at as "Day",round(SUM(CASE WHEN lower(a.status)
LIKE "%cancelled%" THEN 1 ELSE 0 END)/COUNT(a.id),2) as "Cancellation Rate"
FROM Trips a
LEFT JOIN Users b
ON a.client_id = b.users_id
LEFT JOIN Users c
ON a.driver_id = c.users_id
WHERE a.request_at between "2013-10-01" and "2013-10-03" and b.banned!="Yes" and c.banned!="Yes"
GROUP BY a.request_at;
