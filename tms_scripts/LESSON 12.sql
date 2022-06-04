select count(distinct c.CompetitionID) as NumberofComp, count(r.ResultID), j.JudgeID, concat (j.FirstName, ' ', j.LastName)
from People.Judge j
join Competitions.Result r on r.JudgeID = j.JudgeID
join Competitions.Competition c on c.CompetitionID = r.CompetitionID
where YEAR(c.date_from) between '2018' and '2019'
and YEAR(c.Date_to) between '2018' and '2019'
group by j.JudgeID, concat (j.FirstName, ' ', j.LastName)
having count(distinct c.CompetitionID) > 4
order by count( c.CompetitionID) desc
