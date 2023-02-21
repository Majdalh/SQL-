--- Targil#3
--- Majdal Hindi 300991890

USE AdventureWorks

--Q1
SELECT FirstName ,LastName 
FROM Person.Person p 
WHERE FirstName = 'Mark';

--Q2
SELECT TOP 72 *
FROM Production.Product p 
WHERE ListPrice <> 0;

--Q3
SELECT FirstName AS Customer_First_Name, LastName AS Customer_Last_Name
FROM Sales.vIndividualCustomer vic 
WHERE LastName ='Smith';

--Q4
SELECT * 
FROM Sales.vIndividualCustomer vic 
WHERE (CountryRegionName ='Australia') OR 
(PhoneNumberType ='Cell' AND EmailPromotion =0);

--Q5
SELECT SalesPersonID ,TotalDue 
FROM Sales.SalesOrderHeader soh 
WHERE SalesPersonID  IS NOT NULL AND TotalDue > 55000;

--Q6
SELECT *
FROM HumanResources.vEmployeeDepartment ved 
WHERE Department IN ('Executive','Tool Design','Engineering');

SELECT *
FROM HumanResources.vEmployeeDepartment ved 
WHERE Department = 'Executive' OR 
Department ='Tool Design' OR
Department='Engineering';

--Q7
SElECT *
FROM HumanResources.vEmployee ve 
WHERE LastName LIKE 'M%';

--Q8
SELECT *
FROM Person.StateProvince sp 
WHERE CountryRegionCode ='MA';

--Q9
SELECT *
FROM HumanResources.vEmployeeDepartment ved 
WHERE StartDate BETWEEN '2010-05-01' AND '2012-06-30';

SELECT *
FROM HumanResources.vEmployeeDepartment ved 
WHERE StartDate >='2010-05-01' AND StartDate <='2012-06-30';

--Q10
SELECT *
FROM Sales.vIndividualCustomer vic 
WHERE LastName LIKE 'S%';

--Q11
SELECT *
FROM Sales.vIndividualCustomer vic 
WHERE LastName LIKE '%r';

--Q12
SELECT *
FROM Sales.vIndividualCustomer vic 
WHERE LastName IN ('lopez','Martin','Wood') AND 
FirstName LIKE '[C-L]%';

--Q13
SELECT *
FROM Sales.SalesOrderHeader soh 
WHERE  SalesPersonID IS NOT NULL;



