go

create function People.ufnTop3Swmrs (@compname nvarchar(50), @compyear int)
returns table
as
return
(
select *
from 
(select 
concat(sw.FirstName,' ', sw.LastName) as SwimmerName
,dense_rank() over (Partition BY res.CompetitionID, res.Style, res.Distance, sw.Gender order by time) as Place
,res.CompetitionID
,res.Time
,res.Style
,res.Distance
,c.Date_from
,c.Name
from People.Swimmer sw
join Competitions.Result res on sw.SwimmerID = res.SwimmerID
join Competitions.Competition c on c.CompetitionID = res.CompetitionID
where @compname = c.Name or @compyear = YEAR(c.Date_from)) a
where a.Place in (1,2,3)
)

go


select *
from People.ufnTop3Swmrs('World championship',2020)
