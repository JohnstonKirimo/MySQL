/*
Table: Activity

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| player_id    | int     |
| device_id    | int     |
| event_date   | date    |
| games_played | int     |
+--------------+---------+
(player_id, event_date) is the primary key of this table.
This table shows the activity of players of some games.
Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.
 

Write an SQL query to report the first login date for each player.

Return the result table in any order.

*/
-- sample solution
select player_id, min(event_date) as first_login
from Activity 
Group By player_id;

-- alternative solution, using row_number
select d.player_id, d.event_date first_login from (select player_id ,event_date,
row_number() over(partition by player_id order by event_date ) rnum
from Activity ) d where d.rnum = 1

