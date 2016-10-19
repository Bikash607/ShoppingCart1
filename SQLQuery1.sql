CREATE TABLE Products
(
ProductID int Primary Key identity (101,1),
Name varchar(500),
Description varchar(1000),
price varchar(50),
ImageUrl varchar(500),
CategoryID int
)

CREATE TABLE Category
(
CategoryID int Primary Key identity (1,1),
CategoryName varchar(200)
)
 


 CREATE TABLE CustomerProducts
 (
   CustomerID INT,
   ProductID INT,
   TotalProduct INT
 )

Select * from Products


Select * from Category

Select * from CustomerProducts

CREATE TABLE CutomerDetails
 (
   ID int  identity(1,1) primary key,
   CustomerName varchar(100),
   CustomerEmailID varchar(100),
   CustomerPhoneNo varchar(10),
   CustomerAddress varchar(500),
   TotalProducts int,
   TotalPrice int,
   OrderDateTime datetime default getdate(),
   PaymentMethod varchar(100)
 )
 
 SELECT * FROM CutomerDetails

