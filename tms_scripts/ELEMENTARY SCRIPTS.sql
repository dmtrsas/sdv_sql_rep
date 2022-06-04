select *
from HumanResources.Employee a
where a.Gender = 'F'
and a.MaritalStatus = 'M'
--and a.VacationHours > 50 and a.VacationHours < 60

SELECT DISTINCT A.CurrencyCode, B.FromCurrencyCode, B.ToCurrencyCode, B.EndOfDayRate FROM Sales.Currency A JOIN Sales.CurrencyRate B ON A.Name = B.FromCurrencyCode OR A.CurrencyCode = B.ToCurrencyCode
WHERE A.CurrencyCode IN ('BYN','RUB','EUR')


SELECT Color, [Name]
FROM Production.Product
WHERE 
Color IN ('Black','Silver','Red')

SELECT DISTINCT Size
FROM Production.Product

SELECT A.VacationHours, A.JobTitle
FROM HumanResources.Employee A 
ORDER BY JobTitle, VacationHours

SELECT TOP 10 VacationHours, JobTitle  
FROM HumanResources.Employee
WHERE LOWER(JobTitle) LIKE '%MANAG%'
ORDER BY VacationHours DESC



-----------рнош, рнош он спнбмъл


SELECT TOP 4 WITH TIES Listprice, ProductNumber -- еякх гмювемхе бундхр б рно, рн бйкчвюеряъ. б рюйнл яксвюе рно лнфер ашрэ ьхпе.
FROM Production.Product
WHERE Listprice > 0 
ORDER BY Listprice

SELECT TOP 10 PERCENT * 
FROM Production.Product
ORDER BY StandardCost DESC

SELECT DISTINCT TOP 1 WITH TIES Color, StandardCost  -- охьел ярюмдюпрмши йнд (днкфем пеьюрэ гюдювс бяецдю, ме рнкэйн яецндмъ)
FROM Production.Product
ORDER BY StandardCost DESC



----юцпецюрнпш
SELECT MAX(A.StandardCost), AVG(A.StandardCost)
FROM Production.Product A