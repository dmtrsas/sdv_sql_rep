USE AdventureWorks2017;
GO
/*
DECLARE @NationalID nvarchar(30)
SET @NationalID = '879341111'

DECLARE @BusinessEntity int
SET @BusinessEntity = 15

GO 
*/

CREATE PROCEDURE dbo.uspNationalIDNumberUpdate
	@BusinessEntity int,
	@NationalID nvarchar(20)
	AS
	BEGIN
	UPDATE HumanResources.Employee 
	SET NationalIDNumber = @NationalID
	WHERE BusinessEntityID = @BusinessEntity
	END;

GO

EXECUTE dbo.uspNationalIDNumberUpdate 15,'879341111'





/*
CREATE PROCEDURE uspChangeNationID
@businessID int,
@NationalID nvarchar(15)
AS
UPDATE [HumanResources].[Employee]
SET [NationalIDNumber] = @NationalID
WHERE BusinessEntityID= @businessID;

EXEC uspChangeNationID 15, '879341111';

*/