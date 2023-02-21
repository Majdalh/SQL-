--- Ex2: Majdal Hindi 300991890 

---Q1---
SELECT 'AL-Hijra'

---Q2---
SELECT 234*39

---Q3---
SELECT 35*(79-13)

---Q4---
SELECT 'best day ever!',872*332

---Q5---
USE AdventureWorks

SELECT NationalIDNumber 
FROM HumanResources.Employee 

---Q6---
SELECT NationalIDNumber,JobTitle
FROM HumanResources.Employee 

---Q7---
SELECT TOP 20 PERCENT NationalIDNumber AS SSN, JobTitle AS Title, BirthDate
FROM HumanResources.Employee 

---Q8---
SELECT *
FROM Sales.SalesOrderHeader 

---Q9---
SELECT TOP 50 PERCENT *
FROM Sales.Customer 

---Q10---
SELECT Name AS Product_Name
FROM Production.vProductAndDescription 

---Q11---
SELECT TOP 200 *
FROM HumanResources.Department --- it has only 16 records 

---Q12---
SELECT *
FROM Production.BillOfMaterials 

---Q13---
SELECT TOP 1205 *
FROM Sales.vPersonDemographics 