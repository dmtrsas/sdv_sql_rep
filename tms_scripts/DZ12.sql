CREATE VIEW People.TopCoaches
AS
SELECT TOP 50 WITH TIES SUM(x.Points) AS TotalPoints, c.CoachID, CONCAT(c.FirstName,' ', c.LastName) AS 'Coach Name'
FROM
(
SELECT
s.CoachID
,(CASE
	WHEN DENSE_RANK() OVER (PARTITION BY R.CompetitionID, R.Distance, R.Style, S.Gender ORDER BY R.Time DESC) = 1 THEN 3
	WHEN DENSE_RANK() OVER (PARTITION BY R.CompetitionID, R.Distance, R.Style, S.Gender ORDER BY R.Time DESC) = 2 THEN 2
	WHEN DENSE_RANK() OVER (PARTITION BY R.CompetitionID, R.Distance, R.Style, S.Gender ORDER BY R.Time DESC) = 3 THEN 1
	ELSE 0
END) AS 'Points'
FROM People.Coach c
JOIN People.Swimmer s ON s.CoachID = c.CoachID
JOIN Competitions.Result r ON r.SwimmerID = s.SwimmerID
)x
JOIN People.Coach c ON x.CoachID = c.CoachID
GROUP BY c.CoachID, CONCAT(c.FirstName,' ', c.LastName)
ORDER BY SUM(x.Points) DESC
