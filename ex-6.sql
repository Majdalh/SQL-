--Targil #6
--Majdal Hindi 300991890

USE trial


--Q1

CREATE TABLE dbo.SalesDetails_300991890(
	SaleID int NOT NULL PRIMARY KEY,
    SalePrice float,
    Discount float,
    date date CHECK (Date <= cast(sysdatetime() as date))
    );

-- to check if the date column accept future date
INSERT INTO dbo.SalesDetails_300991890 
values
(0,250,0,'2022-12-20');
   
   
INSERT INTO dbo.SalesDetails_300991890
VALUES 
(1,	250,	0,	    '2021-12-20'),
(2,	200,	0,		'2021-01-15'),
(3,	340,	0,		'2019-05-14'),
(4,	200,	0.1,	'2021-06-13'),
(5,	234,	0.1,	'2020-08-17'),
(6,	1400,	0.15,	'2021-04-16'),
(7,	500,	0.15,	'2020-04-17'),
(8,	350,	0.2,	'2021-07-16'),
(9,	670,	0.2,	'2020-02-10'),
(10, 330,	0.2,	'2020-02-10'),
(11, 450,	0.2,	'2022-02-10');
   
CREATE TABLE dbo.Customer_300991890 (
    CustomerID int  NOT NULL PRIMARY KEY,
    Name varchar (15),
    City varchar (15),
    State varchar (15)
    );
   
INSERT INTO dbo.Customer_300991890
values
(1,		'ben gan',	'rome',		'italy'),
(2, 	'korin',	'new york',	'us'),
(3,		'moshe',	'tel aviv',	'isreal'),
(4,		'shira',	'jerusalem','isreal'),
(5,		'shlomit',	'haifa',	'isreal'),
(15,	'haim',		'venice',	'italy'),
(9,		'hallel',	'rome',		'italy'),
(8,		'uriya',	'tel aviv',	'isreal');
   
    
CREATE TABLE dbo.Store_300991890 (
	StoreID int NOT NULL PRIMARY KEY,
	Name varchar(15),
    Category varchar (15),	
	StoreLocation  varchar (15),
    StoreState  varchar (15)
	);

INSERT INTO dbo.Store_300991890
values
(1,'mama',	'clothes','tel aviv',	'israel'),
(2,'mama',	'clothes','jerusalem',	'israel'),
(3,'mama',	'clothes','jerusalem',	'israel'),
(4,'mama',	'clothes','beer sheva',	'israel'),
(5,'norma',	'food','haifa',		'israel'),
(7,'sima',	'accessories','bat galim',	'israel'),
(8,'sima',	'accessories','haifa',		'israel'),
(9,'sima',	'accessories','new york',	'US');


CREATE TABLE dbo.Sales_300991890(
	ID int IDENTITY PRIMARY KEY,
	SaleID int FOREIGN KEY REFERENCES dbo.SalesDetails_300991890(SaleID),
    CustomerID int FOREIGN KEY REFERENCES dbo.Customer_300991890(CustomerID),
    StoreID int FOREIGN KEY REFERENCES dbo.Store_300991890(StoreID)
	);


INSERT INTO  dbo.Sales_300991890
values
(1,	1,	1),
(2,	2,	2),
(3,	2,	3),
(4,	3,	4),
(5,	4,	5),
(6,	5,	5),
(7,	15,	7),
(8,	15,	8),
(9,	9,	9),
(10,8,	9),
(11,9,	9);


-- Q2

SELECT s.SaleID AS 'SaleID' , s2.StoreID AS 'StoreID' ,
sd.[date] AS 'Date' , s2.Name AS 'StoreName' ,s2.Category AS 'StoreCategory' ,
s2.StoreLocation AS 'StoreLocation' ,s2.StoreState AS 'StoreState' ,
sd.SalePrice AS 'SalePrice', sd.Discount AS 'Discount', c.*
FROM dbo.Sales_300991890 s 
JOIN dbo.Store_300991890 s2 
ON s.StoreID = s2.StoreID
JOIN dbo.Customer_300991890 c 
ON s.CustomerID =c.CustomerID 
JOIN dbo.SalesDetails_300991890 sd 
ON s.SaleID = sd.SaleID;

--Q3

UPDATE dbo.Store_300991890 
SET Category  = 'clothes'
WHERE Name  = 'norma' and StoreLocation = 'haifa';


