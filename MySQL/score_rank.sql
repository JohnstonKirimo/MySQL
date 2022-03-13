
select a.score, (select count(distinct b.score) from Scores b
where a.score <= b.score) as "rank"
from Scores a
order by score desc;
