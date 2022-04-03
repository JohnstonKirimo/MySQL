/*
Write an SQL query to swap the seat id of every two consecutive students.
If the number of students is odd, the id of the last student is not swapped.

Return the result table ordered by id in ascending order.
*/
SELECT
    s1.id, COALESCE(s2.student, s1.student) AS student
FROM
    seat s1
        LEFT JOIN
    seat s2 ON ((s1.id + 1) ^ 1) - 1 = s2.id
ORDER BY s1.id;

--Faster/better solution
SELECT s1.id, s2.student
FROM seat s1, seat s2
WHERE (CASE WHEN s1.id%2 = 1 AND s1.id = (SELECT MAX(id) FROM seat) THEN s1.id = s2.id
      WHEN s1.id%2=0 THEN s1.id = s2.id + 1
      ELSE s2.id = s1.id +1
      END)
ORDER BY s1.id;
