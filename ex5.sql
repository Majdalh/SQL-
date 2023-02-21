--Targil #5
--Majdal Hindi 300991890


--Q1

USE AdventureWorks

SELECT sp.BusinessEntityID , st.SalesYTD ,st.Name AS Territory_Name
FROM Sales.SalesPerson sp 
LEFT JOIN Sales.SalesTerritory st 
ON sp.TerritoryID =st.TerritoryID;

--Q2

SELECT sp.BusinessEntityID , st.SalesYTD ,st.Name AS Territory_Name,(p.FirstName +' '+ p.LastName) AS FullName
FROM Sales.SalesPerson sp 
LEFT JOIN Sales.SalesTerritory st 
ON sp.TerritoryID =st.TerritoryID
LEFT JOIN Person.Person p 
On sp.BusinessEntityID  =p.BusinessEntityID 
WHERE st.Name IN ('Northeast','Central');

--Q3
SELECT p.Name AS ProductName ,p.ListPrice ,ps.Name AS ProductSubcategoryName 
FROM Production.Product p 
LEFT JOIN Production.ProductSubcategory ps 
ON p.ProductSubcategoryID = ps.ProductSubcategoryID
ORDER BY ProductName DESC, ProductSubcategoryName ASC;

--Q4
SELECT pc.Name ,COUNT(ps.Name) AS Products_per_Category
FROM Production.ProductSubcategory ps 
JOIN Production.ProductCategory pc 
ON ps.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name ;

--Q5

SELECT COUNT(*) AS Seniors
FROM HumanResources.Department d 
CROSS JOIN Person.ContactType ct ;
