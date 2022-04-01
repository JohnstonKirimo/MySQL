SELECT candidate_id
FROM Candidates  a
INNER JOIN Rounds b
ON a.interview_id = b.interview_id
WHERE years_of_exp >= 2
GROUP BY candidate_id
HAVING SUM(score) > 15
ORDER BY NULL;
