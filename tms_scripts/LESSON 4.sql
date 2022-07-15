/*INSERT INTO Sales.Currency (CurrencyCode,Name,ModifiedDate)
VALUES 
('ETH','Ethereum',GETDATE()),
('LTC','Litecoin',GETDATE()),
('XRP','Ripple',GETDATE()),
('XMR','Monero',GETDATE())
*/

SELECT DISTINCT DAY(ModifiedDate), MONTH(MODIFIEDDATE), EOMONTH(MODIFIEDDATE)
FROM Sales.Currency

--UPDATE Sales.Currency SET ModifiedDate = '2016-07-01' WHERE CurrencyCode = 'BYN' 

SELECT CONCAT(CURRENCYCODE + ' ', [Name] + ' ') NAMEOFCUR, ModifiedDate
FROM Sales.Currency
WHERE ModifiedDate >= '2021-01-01'



SELECT [Name], Size, Color, AVG([StandardCost]) OVER (PARTITION BY Color)
FROM [Production].[Product] --504