CREATE TABLE pvt (VendorID INT, Emp1 INT, Emp2 INT,  
    Emp3 INT, Emp4 INT, Emp5 INT);  
GO  
INSERT INTO pvt VALUES (1,4,3,5,4,4);  
INSERT INTO pvt VALUES (2,4,1,5,5,5);  
INSERT INTO pvt VALUES (3,4,3,5,4,4);  
INSERT INTO pvt VALUES (4,4,2,5,5,4);  
INSERT INTO pvt VALUES (5,5,1,5,5,5);  
GO  


SELECT 'AverageCost' AS Cost_Sorted_By_Production_Days, -- НАЗВАНИЯ СТОЛБЦОВ ТРАНСПОНИРОВАННОЙ ТАБЛИЦЫ  
[0], [1], [2], [3], [4]  

FROM  
(SELECT DaysToManufacture, StandardCost   
    FROM Production.Product) AS SourceTable  -- ИСТОЧНИК ДАННЫХ
PIVOT									     -- ТРАНСПОНИРУЕМ
(  
AVG(StandardCost)  -- НАХОДИМ СРЕДНИЙ СТАНДАРТНЫЙ КОСТ 
FOR DaysToManufacture IN ([0], [1], [2], [3], [4])  -- ДЛЯ СТОЛБЦОВ СО ЗНАЧЕНИЯМИ, КОТОРЫЕ ПРОПИСАЛИ ИЗНАЧАЛЬНО (ЗНАЧЕНИЕ ПЕРВОГО СТОЛБЦА ЗАДАНО В ПЕРВОЙ СТРОКЕ
) AS PivotTable; 


/*select avg(StandardCost), DaysToManufacture
from production.Product
group by DaysToManufacture

select 'average cost' as daystomanufacture, [0],[1],[2],[3],[4]
from 
(
select StandardCost, DaysToManufacture
from production.Product
) as sourcetable
pivot
(
avg(StandardCost) 
for DaysToManufacture 
	in ([0],[1],[2],[3],[4])
) as pivotedtable

select *
from Production.WorkOrder
group by year(ModifiedDate), Datename(month,ModifiedDate)

GO

select year(ModifiedDate) as Years,  -- Datename(month, ModifiedDate) as months 
from (select ModifiedDate,OrderQty
from Production.WorkOrder) c
pivot
(
sum(orderqty)
for ModifiedDate in (['January'],['February'],['March'],['April'],['May'],['June'],['July'],['August'],['September'],['October'],['November'],['December'])
) AS x
*/


select years, [January], [February], [December] -- такое обозначение столбцов - это синтаксис оператора PIVOT
from (select year(ModifiedDate) as years, datename(MONTH,ModifiedDate) as months, OrderQty from Production.WorkOrder) src -- в источних данных задаём то, что пойдёт на выход
pivot
(
sum(orderqty) for months in ( [January], [February], [December]) -- условие, что данные из источника включаются в слобцы IN (...) с учётом группировки агрегатом
) as pvttable