create table SwimEmployee (
SwimmerID int PRIMARY KEY NOT NULL identity (1,1),
CoachID int,
FirstName nvarchar(50) NOT NULL,
LastName nvarchar(50) NOT NULL,
Birthday date,
Gender char(1),
PassportNumber nvarchar(30),
Citizenship nvarchar(10),
Rank nvarchar(50)
)

drop table SwimEmployee


select *
from SwimmingCompetitionsGroup2.People.Swimmer

alter table People.Swimmer
alter column gender nchar(1)

ALTER TABLE [People].[Swimmer]  WITH CHECK ADD CHECK  (([Gender]='F' OR [Gender]='M'))


insert into AdventureWorks2017.dbo.SwimEmployee
select DISTINCT TOP 100000 convert(int,RIGHT(ABS(CHECKSUM(NEWID())),5)) as CoachID
,p.FirstName
,p.LastName
,e.BirthDate
,e.Gender
,CONCAT('SWR',SUBSTRING(Ph.PhoneNumber,2,5),SUBSTRING(ad.AddressLine1,3,4)) AS PassportNumber
,prv.CountryRegionCode
,(CASE 
	WHEN SUBSTRING(P.LastName,3,1) BETWEEN 'A' AND 'C' THEN 'U2'
	WHEN SUBSTRING(P.LastName,3,1) BETWEEN 'D' AND 'F' THEN 'MS'
	WHEN SUBSTRING(P.LastName,3,1) BETWEEN 'G' AND 'J' THEN 'U3'
	WHEN SUBSTRING(P.LastName,3,1) BETWEEN 'K' AND 'M' THEN 'U1'
	WHEN SUBSTRING(P.LastName,3,1) BETWEEN 'N' AND 'P' THEN 'CMS'
	WHEN SUBSTRING(P.FirstName,1,1) BETWEEN 'Q' AND 'S' THEN '2'
	WHEN SUBSTRING(P.FirstName,1,1) BETWEEN 'T' AND 'V' THEN '1'
	WHEN SUBSTRING(P.FirstName,1,1) BETWEEN 'W' AND 'X' THEN 'WMS'
	WHEN SUBSTRING(P.FirstName,1,1) BETWEEN 'Y' AND 'Z' THEN '3'
END
) AS 'Rank'
from AdventureWorks2017.HumanResources.Employee e 
join AdventureWorks2017.Person.Person p on e.BusinessEntityID = p.BusinessEntityID
join AdventureWorks2017.Person.PersonPhone ph on p.BusinessEntityID = ph.BusinessEntityID
JOIN AdventureWorks2017.Person.BusinessEntityAddress BusAd ON P.BusinessEntityID = BusAd.BusinessEntityID
JOIN AdventureWorks2017.Person.Address Ad ON BusAd.AddressID = Ad.AddressID
join AdventureWorks2017.Person.StateProvince prv on prv.StateProvinceID = ad.StateProvinceID

delete from People.Swimmer
where SwimmerID > 100000