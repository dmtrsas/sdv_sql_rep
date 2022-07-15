/*SELECT *
FROM Production.UnitMeasure U
--WHERE SUBSTRING(U.UnitMeasureCode,1,1) = 't'

INSERT INTO Production.UnitMeasureTest
VALUES ('TT1','Testing Testing','2020-09-09'),('tt2','test2test',GETDATE())

/*
CREATE TABLE Production.UnitMeasureTest (
UnitMeasureCodeTest varchar(10),
NameTest varchar(40),
ModifiedDateTest datetime
PRIMARY KEY (UnitMeasureCodeTest)
);
*/
*/
SELECT *
FROM Production.UnitMeasureTest
ORDER BY UNITMEASURECODETEST

--UPDATE Production.UnitMeasureTest SET UnitMeasureCodeTest = UPPER(UnitMeasureCodeTest) WHERE ModifiedDateTest >= '2021-01-01'
 
/*
INSERT INTO Production.UnitMeasureTest
VALUES 
('CAN','Canister','2008-04-30 00:00:00.000')
*/

--DELETE FROM Production.UnitMeasureTest

/*
SELECT MAX (D.LineTotal)
--, MIN(D.LineTotal)
--, AVG(D.LineTotal) 
OVER(PARTITION BY D.SalesOrderID) AS 'MAXIMUM LINETOTAL', D.SalesOrderID
FROM Sales.SalesOrderDetail D
WHERE D.SalesOrderID IN (43659,43664)
*/

SELECT CASE 
WHEN DATEPART(WEEKDAY,EOMONTH('2020-11-30',-1)) BETWEEN 2 AND 5 THEN DATEADD(DAY,1,EOMONTH('2020-11-30',-1))
WHEN DATEPART(WEEKDAY,EOMONTH('2020-11-30',-1)) = 6 THEN DATEADD(DAY,3,EOMONTH('2020-11-30',-1))
WHEN DATEPART(WEEKDAY,EOMONTH('2020-11-30',-1)) = 7 THEN DATEADD(DAY,2,EOMONTH('2020-11-30',-1))
WHEN DATEPART(WEEKDAY,EOMONTH('2020-11-30',-1)) = 1 THEN DATEADD(DAY,1,EOMONTH('2020-11-30',-1))
END 

/*
SELECT CONCAT('SOSNITSKIY',' login',(ISNULL(TERRITORYID,' '))) AS 'LOGIN'
,A.BusinessEntityID
,RANK() OVER (ORDER BY SALESLASTYEAR DESC) AS 'RANKING'
,*
FROM Sales.SalesPerson A
*/