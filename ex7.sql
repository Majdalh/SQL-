-- Targil #7 
-- Majdal Hindi 300991890

USE AdventureWorks

--Q1
SELECT *
FROM Sales.SalesOrderHeader soh
WHERE TotalDue > ( SELECT AVG(TotalDue)
					FROM Sales.SalesOrderHeader 
					WHERE TotalDue != 0);


--Q2
SELECT Name AS 'ProductName'
FROM Production.Product p 
WHERE ListPrice = ( SELECT ListPrice 
					FROM Production.Product 
					WHERE Name = 'Chainring Bolts');
				
--Q3
SELECT Name AS 'StoreName'
FROM Sales.Store s 
WHERE BusinessEntityID  NOT IN (SELECT s.BusinessEntityID 
							FROM Sales.Customer c
							JOIN Sales.Store s
							ON c.StoreID = s.BusinessEntityID 
							WHERE c.TerritoryID = 5);


--Q4
SELECT p.FirstName , p.LastName 
FROM Person.Person p
JOIN HumanResources.Employee e 
ON p.BusinessEntityID =e.BusinessEntityID
JOIN Sales.SalesPerson sp 
ON p.BusinessEntityID =sp.BusinessEntityID;


--Q5
WITH temp  AS
    (SELECT SalesPersonID AS ID ,YEAR(OrderDate) AS OrderYear
     FROM Sales.SalesOrderHeader 
     WHERE SalesPersonID  IS NOT NULL)
	 
		SELECT ID ,OrderYear, COUNT(*) AS TotalSales
		FROM  temp
		GROUP BY ID, OrderYear
		ORDER BY ID, OrderYear;
		
--Q6

SELECT SalesOrderID ,TerritoryID ,TotalDue , COUNT(*) OVER (PARTITION BY TerritoryID) AS 'COUNT', MAX(SubTotal) OVER (PARTITION BY TerritoryID) AS 'MAX',
RANK () OVER (PARTITION BY TerritoryID ORDER BY SubTotal) AS 'RANK', PERCENT_RANK() OVER (PARTITION BY TerritoryID ORDER BY SubTotal) AS 'PERCENT' 
FROM Sales.SalesOrderHeader soh
ORDER BY TerritoryID DESC, OrderDate;

