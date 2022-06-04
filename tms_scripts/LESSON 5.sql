/*SELECT MAX (D.LineTotal) OVER(PARTITION BY D.SalesOrderID) AS 'MAXIMUM LINETOTAL'
, MIN(D.LineTotal) OVER(PARTITION BY D.SalesOrderID) AS 'MINIMUM LINETOTAL'
, AVG(D.LineTotal) OVER(PARTITION BY D.SalesOrderID) AS 'AVERAGE LINETOTAL'
, D.SalesOrderID
FROM Sales.SalesOrderDetail D
WHERE D.SalesOrderID IN (43659,43664)


SELECT CONCAT('SOSNITSKIY',' login',(ISNULL(TERRITORYID,' '))) AS 'LOGIN'
,A.BusinessEntityID
,RANK() OVER (ORDER BY SalesYTD DESC) AS 'RANKING'
,SalesYTD
,SalesLastYear
FROM Sales.SalesPerson A


SELECT V.[Name], COUNT(P.OnOrderQty) 'SOLD'
FROM Purchasing.ProductVendor P LEFT JOIN Purchasing.Vendor V ON P.BusinessEntityID = V.BusinessEntityID
GROUP BY V.[Name]
HAVING COUNT(P.OnOrderQty) = 0


SELECT DISTINCT V.[Name], P.BusinessEntityID, V.BusinessEntityID
FROM Purchasing.ProductVendor P LEFT JOIN Purchasing.Vendor V ON P.BusinessEntityID = V.BusinessEntityID
WHERE P.OnOrderQty IS NULL



SELECT * 
FROM (
SELECT NAME, StandardCost, MAX(StandardCost) OVER (ORDER BY StandardCost DESC) AS MAX_COST FROM Production.Product) D
WHERE StandardCost = MAX_COST

SELECT *
FROM
(
SELECT Name,StandardCost, RANK() OVER (ORDER BY StandardCost DESC) AS 'RANKING'
FROM Production.Product ) X
WHERE X.RANKING = 1


SELECT BusinessEntityID, YEAR(QuotaDate) AS SalesYear, SalesQuota AS CurrentQuota, 
	LEAD(SalesQuota, 1) OVER (ORDER BY YEAR(QuotaDate)) AS LEAD,   
	LAG(SalesQuota, 1) OVER (ORDER BY YEAR(QuotaDate)) AS LAG,
	FIRST_VALUE(SalesQuota) OVER (ORDER BY YEAR(QuotaDate) DESC) AS LAG
FROM Sales.SalesPersonQuotaHistory  
WHERE BusinessEntityID = 275 AND YEAR(QuotaDate) IN ('2011','2012')
ORDER BY YEAR(QuotaDate)



CREATE TABLE LocalTemporary
(
UserID int, 
Name varchar(50),
Address varchar(100)

PRIMARY KEY (UserID)
)

INSERT INTO LocalTemporary
VALUES 
(1,'A','DOM1'),
(2,'B','HATA2'),
(3,'C','HIBARA3'),
(4,'D','OPLOT4'),
(5,'E','LACHUGA5'),
(6,'FUUUU','ZAMOK6')
*/



--UPDATE LocalTemporary SET NAME = 'F' WHERE UserID = 6


/*
CREATE TABLE #LocalTemp
(
UserID int, 
Name varchar(50),
Address varchar(100)

PRIMARY KEY (UserID)
)

CREATE TABLE ##GlobalTemp
(
UserID int, 
Name varchar(50),
Address varchar(100)

PRIMARY KEY (UserID)
)


CREATE VIEW dbo.vCryptos
AS
SELECT *
FROM Sales.Currency
WHERE ModifiedDate >= '01.01.2021'




DECLARE @MYCOUNTER NVARCHAR(10)
SET @MYCOUNTER = 'Oh My God'
PRINT @MYCOUNTER

SELECT @MYCOUNTER, Name
FROM Sales.Currency
*/

