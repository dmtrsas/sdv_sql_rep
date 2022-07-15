

select 1
where 2>2
having count(1) = 0

--ТОЛЬКО count(*) учитывает NULL, агрегаты по значениям NULL не учитывают

--НЕВЕРНО
Name | Count(*) | Count(name) | Count(cost) | Avg (cost) | Max (id) |
null		2			2			2				null		31
A			1			1			1				500			1
B			2			2			2				50			50
C			1			1			1				null		2



/*select *
from SwimCompetitions2020.dbo.Pool

select top 10 
p.PoolName,
CONCAT(a.Country, ' ', a.City, ' ', a.AddressId),
ROUND (p.width/5,0)
from SwimCompetitions2020.dbo.Pool p
join SwimCompetitions2020.dbo.Address a on p.AddressId = a.AddressId
*/

select * 
from Competitions.Competition

declare @compname nvarchar(50) set @compname = 'World championship'

declare @compyear int set @compyear = 2021

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


