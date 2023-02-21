--Targil #8
--Majdal Hindi 300991890

USE trial;
--Procedures--
--Q1
CREATE TABLE Employee_name_300991890(
employee_id int IDENTITY PRIMARY KEY,
employee_name varchar(15),
gender varchar(15),
state varchar(15),
salary float
);

--Q2
SET IDENTITY_INSERT Employee_name_300991890 ON;
CREATE PROCEDURE INSERT_INTO_Employee_name_300991890  @employee_name VARCHAR(15), @gender VARCHAR(15), @state VARCHAR(15), @salary float
AS
INSERT INTO dbo.Employee_name_300991890 VALUES( @employee_name, @gender, @state, @salary);


--Q3
exec INSERT_INTO_Employee_name_300991890 @employee_name = 'JHON Z',@gender = 'M', @state = 'USA',@salary=100000.3;
exec INSERT_INTO_Employee_name_300991890 @employee_name = 'BEN',@gender = 'M', @state = 'USA',@salary=10000.3;
exec INSERT_INTO_Employee_name_300991890 @employee_name = 'RON',@gender = 'M', @state = 'USA',@salary=50000.3;
exec INSERT_INTO_Employee_name_300991890 @employee_name = 'YOSSI',@gender = 'M', @state = 'USA',@salary=80000.3;
exec INSERT_INTO_Employee_name_300991890 @employee_name = 'ROTEM',@gender = 'F', @state = 'USA',@salary=5000.3;
exec INSERT_INTO_Employee_name_300991890 @employee_name = 'ADI',@gender = 'M', @state = 'USA',@salary=90000;

--Q4
SELECT employee_name , gender =
	CASE  gender
		WHEN 'M' THEN 'male'
		WHEN 'F' THEN 'female'
	End
FROM dbo.Employee_name_300991890;

--Q5

CREATE PROCEDURE Update_salary_300991890 @employee_name VARCHAR(15), @salary float
AS
UPDATE dbo.Employee_name_300991890  SET salary = @salary  WHERE employee_name  = @employee_name;


exec Update_salary_300991890 @salary=1000,  @employee_name = 'ADI';

--to check if the salary of ADI is updated
SELECT *
FROM dbo.Employee_name_300991890 en ;

--Variables--
USE trial;
GO
--Q1
DECLARE @Age AS INT
--Q2
DECLARE @Name AS VARCHAR(15)
--Q1
SET @Age = 33
--Q2
SET @Name = (SELECT employee_name 
FROM dbo.Employee_name_300991890 en 
WHERE employee_id =3)
--Q3
SELECT @Age AS Age, @Name AS Name
GO


--Geometry and geography Variables
--Q1
GO
DECLARE @g geometry;
SET @g = geometry::STGeomFromText('LINESTRING (9 7,13 11)', 0)
SELECT @g.STLength() AS Distance; 
GO

--Q2

GO
DECLARE @g geometry = geometry::STGeomFromText('LINESTRING(0 0, 5 5, 0 10)', 0); 
DECLARE @distance float = 0.5; 
SELECT @g.STBuffer(@distance) AS Line;
GO

--Q3

USE CarAccidents;

SELECT (SpatialLocation .STArea() - AREA) AS 'STAREA-AREA'
FROM dbo.Cities c;

--Q4
GO
DECLARE  @p1 geography 
select @p1 = SpatialLocation from dbo.Cities 

select SpatialLocation.STDistance(@p1) AS 'Result', SpatialLocation.ToString() AS 'SpatialLocation'
from dbo.Cities;
GO


--Q5

USE trial;

ALTER TABLE dbo.majdal 
ADD [SpitalLocation] geography;


UPDATE dbo.majdal
SET [SpitalLocation] = geography::STPointFromText('POINT(' + CAST([WGS84 - LONG] AS VARCHAR(20)) + ' ' + 
CAST([WGS84 - LAT] AS VARCHAR(20)) + ')', 4326);
   

SELECT [SpitalLocation].ToString()
FROM dbo.majdal;

--Q6
ALTER TABLE dbo.majdal 
ADD [ID] int not null identity(1,1); 

GO
DECLARE  @p1 geography 
select @p1 = [SpitalLocation]  from dbo.majdal  where [OBJECTID *]  = 93


select COUNT(ID)
from dbo.majdal 
WHERE [SpitalLocation].STDistance(@p1) >(
select [SpitalLocation].STDistance(@p1)
from trial.dbo.majdal 
where [OBJECTID *]  = 93)



