/* 
CREATE TABLE Person.Patients_prod (
ID int IDENTITY (1,1) PRIMARY KEY NOT NULL,
FirstName varchar(255),
LastName varchar(255),
SSN varchar(50),
Temperature decimal(3,1),
CreatedDate datetime
);


ALTER TABLE Person.Patients
ALTER COLUMN Email nvarchar(50)


ALTER SCHEMA Person
TRANSFER dbo.Patients


INSERT INTO Person.Patients
VALUES 
('Alex'	, 'Luka'	,newid() ,45.8, getdate()  )
--('Ivan'		, 'Ivanov'		,newid() ,37.5, getdate()  ),
--('Petr'		, 'Petrov'		,newid() ,39.9, getdate()  ),
--('Vladimir'	, 'Sosnitskiy'	,newid() ,36.7, getdate()  ),
--('Dmitriy'	, 'Sosnitskiy'	,newid() ,36.7, getdate()  )



SELECT CONCAT(
UPPER(SUBSTRING(FIRSTNAME,1,1)), 
LOWER(SUBSTRING(LASTNAME,1,3)),
'@','mail.com')
FROM Person.Patients


--alter table person.patients drop column email

ALTER TABLE Person.Patients ADD 
Email AS (CONCAT(UPPER(SUBSTRING(FIRSTNAME,1,1)), LOWER(SUBSTRING(LASTNAME,1,3)),'@','mail.com'))


ALTER TABLE Person.Patients ADD CONSTRAINT MAX_TEMPERATURE CHECK (TEMPERATURE <= 45)




ALTER TABLE [Person].[Patients]
ADD IS_OKAY AS 
(
CASE 
WHEN TEMPERATURE BETWEEN 36 AND 36.9 THEN 'OKAY'
WHEN TEMPERATURE <= 36 THEN 'TOO LOW'
WHEN TEMPERATURE >= 37 THEN 'TOO HIGH'
END
)
*/


USE AdventureWorks2017
GO

CREATE VIEW Patients_v AS
SELECT CONCAT (FirstName,' ',LastName) AS 'PATIENT', Temperature AS 'TEMPERATURE CELSIUS', ROUND((Temperature*9/5)+32,2) AS 'TEMPERATURE FAHRENHEIT'
FROM Person.Patients