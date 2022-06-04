select top 100 BusinessEntityID, BirthDate, (datediff(day,BirthDate,getdate())/365)
from HumanResources.Employee


select max(StandardCost)
,Color
from Production.Product p
group by Color

select *
from Production.Product


WITH cte_numbers
AS (
	SELECT 0 as m
	union
	SELECT 0 as n
	)
SELECT *
FROM cte_numbers;


SELECT SUSER_NAME(), USER_NAME()

CREATE SCHEMA Test1;


CREATE TABLE Test1.TestTable1 (TableID int);
CREATE TABLE Test1.TestTable2 (TableID int);

CREATE ROLE TestRole1;
GO 
CREATE USER TestUser1 WITHOUT LOGIN;
GO 
EXEC sp_addrolemember @rolename = 'TestRole1', @membername = 'TestUser1';
GO

GRANT SELECT ON OBJECT::Test1.TestTable1 TO TestRole1;

EXECUTE AS USER = 'TestUser1';
GO 
SELECT SUSER_NAME(), USER_NAME();   
GO 
SELECT * FROM Test1.TestTable1;
GO 
SELECT * FROM Test1.TestTable2;
GO 
REVERT