/*
Schema:

Table: Follow

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| followee    | varchar |
| follower    | varchar |
+-------------+---------+
(followee, follower) is the primary key column for this table.
Each row of this table indicates that the user follower follows the user followee on a social network.
There will not be a user following themself.
 

A second-degree follower is a user who:

follows at least one user, and
is followed by at least one user.
Write an SQL query to report the second-degree users and the number of their followers.

Return the result table ordered by follower in alphabetical order.
*/

-- sample solution:
SELECT a.Followee as Follower, 
    count(distinct a.Follower) as num
FROM Follow a
    LEFT JOIN follow b ON a.Followee = b.Follower
WHERE b.Followee IS NOT NULL
GROUP BY a.Followee
