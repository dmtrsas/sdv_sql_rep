--Create a copy of the Sales.SalesOrderHeader table into a temp table called #Sales and populate it with data in one step. 
--Include only the SalesOrderID, OrderDate, TotalDue, and CustomerID columns.
/*
select SalesOrderID, OrderDate, TotalDue, CustomerID
into #Sales
from Sales.SalesOrderHeader

select *
from #Sales


Create a temp table called #Customers. It must have a CustomerID. It must also have a FirstName and LastName column. 
Figure out which data types are needed by looking at the Person.Person and Sales.Customer tables. Make the CustomerID a primary key.


CREATE TABLE #Customers (
CustomerID int IDENTITY PRIMARY KEY,
Firstname nvarchar(50),
Lastname nvarchar(50),
)


--Move the outer query from 2.2 to a CTE called ProductSales. 
--In the new outer query, create a list of categories with the total sales for each.
--Name the expression SUM(ProductTotal) “CategoryTotal”.
*/

WITH Products
AS (
	select p.ProductID productid, p.Name productname, ps.Name prod_subcat_name, pc.Name prod_cat_name
	from Production.Product p
	join Production.ProductSubcategory ps on p.ProductSubcategoryID = ps.ProductSubcategoryID
	join Production.ProductCategory pc on pc.ProductCategoryID = ps.ProductCategoryID
)
select sod.ProductID, productname, prod_cat_name, prod_subcat_name, convert(int,round(SUM(LineTotal),0)) 'Cat_total'
from Products
join Sales.SalesOrderDetail SOD on SOD.ProductID = Products.productid
group by sod.ProductID, productname, prod_cat_name, prod_subcat_name