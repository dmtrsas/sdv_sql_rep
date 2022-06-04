/*DECLARE @WEEKEND DATETIME
SET @WEEKEND = DATEPART(WEEKDAY,EOMONTH(GETDATE(),-1))

DECLARE @ADDING_1DAY DATETIME
SET @ADDING_1DAY = DATEADD(DAY,1,EOMONTH(GETDATE(),-1))

DECLARE @ADDING_3DAYS DATETIME
SET @ADDING_3DAYS = DATEADD(DAY,3,EOMONTH(GETDATE(),-1))

DECLARE @ADDING_2DAYS DATETIME
SET @ADDING_2DAYS = DATEADD(DAY,2,EOMONTH(GETDATE(),-1))

SELECT CASE 
WHEN @WEEKEND BETWEEN 1 AND 5 THEN @ADDING_1DAY
WHEN @WEEKEND = 6 THEN @ADDING_3DAYS
WHEN @WEEKEND = 7 THEN @ADDING_2DAYS
END




DECLARE @ListOWeekDays TABLE(DyNumber INT,DayAbb VARCHAR(40) , WeekName VARCHAR(40))
 
INSERT INTO @ListOWeekDays
VALUES 
(1,'Mon','Monday')  ,
(2,'Tue','Tuesday') ,
(3,'Wed','Wednesday') ,
(4,'Thu','Thursday'),
(5,'Fri','Friday'),
(6,'Sat','Saturday'),
(7,'Sun','Sunday')  
SELECT * FROM @ListOWeekDays


CREATE FUNCTION ufnGetNewPrice (
@price money,
@discount int
)
RETURNS money
AS
BEGIN
RETURN @price - @price * @discount / 100
END;


SELECT Name, dbo.ufnGetNewPrice (StandardCost, 5) AS 'DISCOUNTED AMOUNT', StandardCost
FROM Production.Product
*/

CREATE FUNCTION Sales.ufn_SalesByStore (@storeid int)
RETURNS TABLE
AS
RETURN
(
SELECT P.ProductID, P.NAME, SUM(SD.LINETOTAL) AS 'YTD TOTAL'
FROM Production.Product P
JOIN Sales.SalesOrderDetail SD ON SD.ProductID = P.ProductID
JOIN Sales.SalesOrderHeader SH ON SH.SalesOrderID = SD.SalesOrderID
WHERE SH.CustomerID = @storeid
GROUP BY P.ProductID, P.Name
);

SELECT *
FROM Sales.ufn_SalesByStore(29662)


SELECT OBJECT_ID(N'AdventureWorks2017.Production.WorkOrder') AS 'Object ID';

SELECT DISTINCT OBJECT_SCHEMA_NAME(OBJECT_ID,1) AS SCHEMA_NAME
FROM master.sys.objects


CREATE TABLE Customers_test
(
    Age TINYINT, 
    FirstName NVARCHAR(10),
    LastName NVARCHAR(10)
)

DROP TABLE Customers_test

SELECT * 
FROM Customers_test