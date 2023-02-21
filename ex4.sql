-- Targil #
-- Majdal Hindi 300991890


--Q1

USE AdventureWorks

SELECT TOP 1 ct.Name--,COUNT(ct.Name) AS num
FROM Person.BusinessEntityContact bec 
INNER JOIN Person.ContactType ct
ON bec.ContactTypeID = ct.ContactTypeID
GROUP BY ct.Name
ORDER BY COUNT(ct.Name) DESC;


--Q2

SELECT TOP 1 pp.PhoneNumber ,COUNT(pp.PhoneNumber) AS Count_PhoneNumber
FROM Person.Person p 
INNER JOIN Person.PersonPhone pp 
ON p.BusinessEntityID =pp.BusinessEntityID
GROUP BY pp.PhoneNumber 
ORDER BY Count_PhoneNumber DESC;


--Q3

SELECT TOP 1 st.Name --, COUNT(c.CustomerID) AS num
FROM Sales.Customer c
INNER JOIN Sales.SalesTerritory st 
ON c.TerritoryID =st.TerritoryID
GROUP BY st.Name
ORDER BY COUNT(c.CustomerID) DESC;


--Q4

SELECT MAX(so.DiscountPct) AS Max_Discount
FROM Sales.SalesOrderDetail sod
INNER JOIN Sales.SpecialOffer so
ON sod.SpecialOfferID =so.SpecialOfferID;

--Q5

SELECT COUNT(*) AS Num_of_Max_Discount
FROM Sales.SalesOrderDetail sod
INNER JOIN Sales.SpecialOffer so
ON sod.SpecialOfferID =so.SpecialOfferID
WHERE so.DiscountPct = (SELECT MAX(so.DiscountPct) AS Max_Discount
						FROM Sales.SalesOrderDetail sod
						INNER JOIN Sales.SpecialOffer so
						ON sod.SpecialOfferID =so.SpecialOfferID);


--Q6
					
SELECT AVG(so.DiscountPct) AS Avg_Discount
FROM Sales.SalesOrderDetail sod
INNER JOIN Sales.SpecialOffer so
ON sod.SpecialOfferID =so.SpecialOfferID;


--Q7

SELECT st.Name,SUM(soh.SubTotal) AS Total_Per_Territory
FROM Sales.SalesOrderDetail sod 
INNER JOIN Sales.SalesOrderHeader soh 
ON sod.SalesOrderID =soh.SalesOrderID 
INNER JOIN Sales.SalesTerritory st 
ON soh.TerritoryID = st.TerritoryID
GROUP BY st.Name;