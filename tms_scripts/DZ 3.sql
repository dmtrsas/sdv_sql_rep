SELECT TOP 3 WITH TIES * 
FROM Sales.SpecialOffer
WHERE StartDate >= '01.01.2013' AND EndDate <= '01.01.2014'
ORDER BY DISCOUNTPCT DESC

SELECT DATEDIFF(DAY,GETDATE(),'1995-12-30')


SELECT DISTINCT P.ProductID, V.BusinessEntityID
FROM Purchasing.ProductVendor P JOIN Purchasing.Vendor V ON P.BusinessEntityID = V.BusinessEntityID
WHERE P.StandardPrice > 10
AND (V.[Name] LIKE 'N%' OR V.[Name] LIKE '%X%')



SELECT V.[Name], COUNT(P.OnOrderQty) 'SOLD'
FROM Purchasing.ProductVendor P LEFT JOIN Purchasing.Vendor V ON P.BusinessEntityID = V.BusinessEntityID
GROUP BY V.[Name]
HAVING COUNT(P.OnOrderQty) = 0

