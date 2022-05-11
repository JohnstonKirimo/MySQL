-- #1)
SELECT a.dept_id, target.COUNT ,target.sum_of_salary
FROM department a,
    (SELECT b.dept_id, COUNT(b.emp_id) count , SUM(b.salary) sum_of_salary
     FROM employee b
     GROUP BY b.dept_id) target
 WHERE target.dept_id = a.dept_id;

-- #2)
SELECT name
FROM line a
WHERE (SELECT sum(weight)
       FROM line
       WHERE a.turn >= turn) <= 1000
ORDER BY turn DESC
LIMIT 1;

-- #3)
SELECT country,
       SUM(CASE WHEN a.name = b.seller
                THEN b.value
                ELSE 0
                END) AS exports,
       SUM(CASE WHEN a.name = b.buyer
                THEN b.value
                ELSE 0
                END) AS imports
FROM companies a
LEFT JOIN trades b ON a.name IN (b.seller, b.buyer)
GROUP BY a.country
ORDER BY a.country ASC;

-- #4)
-- this schema has an error (missing of datatype charater limit), so for the purposes of
-- completing this assignment, I assumed VARCHAR(30).

--This is how it looks after the change:

create table buses (
id integer primary key,
origin varchar (30) not null,
destination varchar (30) not null,
time varchar (30) not null
);
create table passengers (
id integer primary key,
origin varchar(30) not null,
destination varchar(30) not null,
time varchar(30) not null
);

/*
Query:
*/

SELECT
  a.id,
  sum(CASE WHEN b.id > 0 THEN 1 ELSE 0 END) AS passengers_on_board
FROM buses a
  LEFT JOIN passengers b
    ON a.origin=b.origin
   AND a.destination=b.destination
   AND a.time =
     (
       SELECT min(c.time)
       FROM buses c
       WHERE c.origin = a.origin
         AND c.destination = a.destination
         AND c.time >= b.time
     )
GROUP BY a.id;




