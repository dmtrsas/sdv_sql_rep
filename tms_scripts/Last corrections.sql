



use AdventureWorks2017
select *
from Sales.CountryRegionCurrency



update People.Swimmer
set Rank = 
(	case 
		when SUBSTRING(passportnumber,1,1) between 'A' and 'F' then 'CMS'
		when SUBSTRING(passportnumber,1,1) between 'G' and 'L' then 'MS'
		when SUBSTRING(passportnumber,1,1) between 'M' and 'P' then '1'
		when SUBSTRING(passportnumber,1,1) between 'Q' and 'T' then 'U1'
		when SUBSTRING(passportnumber,1,1) between 'U' and 'Z' then 'U2'
	end
)
where Rank is null


declare @counter int
set @counter = 1

while @counter <= 100010
	begin
		update People.Swimmer
		set Citizenship = 
		(select countryregioncode from #countries where id in (select id from #countries where id in (select abs(checksum(newid()))%109)))
		where SwimmerID = @counter
		
	
		set @counter += 1
	end



declare @counter int
set @counter = 1

while @counter <= 100010
	begin
		update People.Judge
		set Citizenship = 
		(select countryregioncode from #countries where id in (select id from #countries where id in (select abs(checksum(newid()))%109)))
		where JudgeID = @counter
		
	
		set @counter += 1
	end

update People.Swimmer
set Gender = 'F'
where FirstName in ('Lindsay','Allison','Desiree','Desirée','Courtney','Bridget','Jocelyn','Wei',
'Ty Loren','Lacey','Kyley','Bridgette','Liz','Payton','Ann','Marian','Carol Ann','Nicky','Deborah',
'Kelsey','Kelly','Heidi','Judy','Karen','Evelyn','Glenn','Jian','Jacqueline','Madison','Dorothy',
'Hailey','Summer','Sharon','Suzann','Angel','Beverly','April','Denise','Chloe','Kim','Janice','Lorraine',
'Drew','Beth','Michelle','Janelle','Carmen','Margaret','Megan','Doris','Dianne','Audrey','Abigail',
'Kendall','Candy','Gladys','Peggy','Heather','Autumn','Amy','Jaclyn','Carolyn','Wendy','Meghan',
'Jacquelyn','Shirley','Abe','Nancy','Ashley','Cheryl','Carol','Anne','Pam','Trinity','Renee','Jillian',
'Renée','Annette','Caroline','Constance','Geraldine','Kimberly','Abby','Caitlin','Brandy','Bethany',
'Madeline','Gigi','Jill','Katelyn','Jenny','Candice','Susan','Daisy','Alison','Mindy','Nicole','Celine','Amber')



update People.Judge
set Rank = CASE																	--ВЫСТАВЛЯЕМ КАТЕГОРИЮ СУДЬИ
	WHEN SUBSTRING(PassportNumber,4,1) BETWEEN '0' AND '3' THEN 'CMS'
	WHEN SUBSTRING(PassportNumber,4,1) BETWEEN '4' AND '6' THEN 'MS'
	else 'WMS'
END
where rank = 'WMS'


select *
from People.Coach
where rank = 'WMS'
*/


select distinct Name
from Competitions.Competition


create table #comps
(id int identity,
names nvarchar(255)
)



insert into #comps
values 
('European champions cup'),
('Olympic Games qualification'),
('Asian championship'),
('European championship'),
('All stars cup'),
('World championship'),
('World championship qualification'),
('International cup'),
('International league cup'),
('Paneurasian championship'),
('Panamerican championship'),
('South America champions cup'),
('North America champions cup'),
('Africa champions cup'),
('Pacific Ocean cup'),
('Indian Ocean cup'),
('Atlantic Ocean cup')

declare @counter int
set @counter = 1

while @counter <= 100010
	begin
		update Competitions.Competition
		set Name = 
		(select names from #comps where id in (select id from #countries where id in (select abs(checksum(newid()))%17)))
		where CompetitionID = @counter
		
	
		set @counter += 1
	end


update Competitions.Competition
set Name = 
case
	when CompetitionID%3 = 0  then 'All stars cup'
	when CompetitionID%4 = 0  then 'Pacific Ocean cup'
	when CompetitionID%5 = 0 then 'International cup'
	when CompetitionID%7 = 0  then 'International league cup'
	when CompetitionID%8 = 0  then 'World championship qualification'
	when CompetitionID%2 = 0  then 'Major cup swimming'
	
end
where Name is null


update Competitions.Competition
set Name = CONCAT(name,'`',substring(convert(nvarchar,date_from),3,2))


select *
from Competitions.Pool


select CONVERT(nvarchar,
from Competitions.Competition