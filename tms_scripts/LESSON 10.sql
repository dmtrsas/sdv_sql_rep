
--Все победители
SELECT MIN(R.Time) AS 'Winner Time', R.Style, R.CompetitionID, R.Distance, CONCAT (S.FirstName,' ',S.LastName) AS 'Name', S.Gender
FROM Competitions.Result R
JOIN Competitions.Competition C ON R.CompetitionID = C.CompetitionID
JOIN People.Swimmer S ON S.SwimmerID = R.SwimmerID
GROUP BY R.Style, R.CompetitionID, R.Distance, CONCAT (S.FirstName,' ',S.LastName), S.Gender


--Тренера, у которых пловцы принимали участия в соревновании
SELECT DISTINCT C.CoachID 
,CONCAT (C.FirstName,' ',C.LastName) AS 'Participating swimmer'
,R.ResultID
FROM People.Coach C
JOIN People.Swimmer S ON c.CoachID = S.CoachID
JOIN Competitions.Result R ON R.SwimmerID = S.SwimmerID
ORDER BY C.CoachID


--Самый популярный стиль плавания
SELECT COUNT(*) AS 'Number of results', R.Style
FROM Competitions.Result R
GROUP BY R.Style
ORDER BY COUNT(*) DESC

--Самые популярные бассейны
SELECT P.PoolID
,COUNT(R.ResultID)
FROM Competitions.Result R
JOIN Competitions.Competition C ON R.CompetitionID = C.CompetitionID
JOIN Competitions.Pool P ON P.PoolID = C.PoolID
GROUP BY P.PoolID
ORDER BY COUNT(R.ResultID) DESC


--Поиск дубликатов
SELECT CompetitionID, PoolID, COUNT(*)
from Competitions.Bridge_Competition_Pool
GROUP BY CompetitionID, PoolID
HAVING COUNT(*) > 1
