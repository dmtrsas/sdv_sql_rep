SELECT DISTINCT PersonType
FROM Person.Person
WHERE 
LastName LIKE 'M%'
OR EmailPromotion <> 1


SELECT TOP 3 * 
FROM Sales.SpecialOffer
WHERE StartDate BETWEEN '01.01.2013' AND '01.01.2014'


SELECT MIN(Weight) 'MINIMUM WEIGHT', MAX(Size) 'MAXIMUM SIZE'
FROM Production.Product


SELECT MIN(Weight) 'MINIMUM WEIGHT', MAX(Size) 'MAXIMUM SIZE', ProductSubcategoryID
FROM Production.Product
GROUP BY ProductSubcategoryID


SELECT MIN(Weight) 'MINIMUM WEIGHT', MAX(Size) 'MAXIMUM SIZE', ProductSubcategoryID
FROM Production.Product
WHERE Color = 'Black'
GROUP BY ProductSubcategoryID


SELECT MIN(WEIGHT) 'MINIMUM WEIGHT', ProductSubcategoryID
FROM Production.Product
GROUP BY ProductSubcategoryID
HAVING MIN (WEIGHT) > 50


SELECT MIN(WEIGHT) 'MINIMUM WEIGHT', ProductSubcategoryID
FROM Production.Product
WHERE Color = 'Black'
GROUP BY ProductSubcategoryID
HAVING MIN (WEIGHT) > 50


SELECT TaxType, MIN(TaxRate) 'MINIMUM TAXRATE'
FROM Sales.SalesTaxRate
GROUP BY TaxType
HAVING MIN (TAXRATE) < 7