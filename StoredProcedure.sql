CREATE PROCEDURE SP_AddNewCategory
(
@CategoryName varchar(200)
)
AS
  BEGIN
    BEGIN TRY
	  insert into Category
	   values (@CategoryName)
	END TRY

	BEGIN CATCH
	  --INSERT INTO ErrorLog
	  --VALUES('ERROR_MESSAGE()','sp_GetAllData'
	   PRINT('Error Occured')
	END CATCH
 END
GO


Create PROCEDURE SP_GetAllCategories

AS
  BEGIN 
     BEGIN TRY
	  SELECT * from Category
	  END TRY
	 BEGIN CATCH
	     --INSERT INTO ErrorLog
	  --VALUES('ERROR_MESSAGE()','sp_GetAllData'
	   PRINT('Error Occured')
	   END CATCH
   END
GO


Create PROCEDURE SP_AddNewProduct
(
  @ProductName varchar(300),
   @ProductDescription varchar(1000),
   @ProductPrice varchar(100),
   @ProductImage varchar(500),
    @CategoryID int ,
   @ProductQuantity int
  
)
AS
  BEGIN 
     BEGIN TRY

	  Insert into Products values
	     (
		    @ProductName ,
			@ProductDescription ,
            @ProductPrice ,
            @ProductImage , 
			@CategoryID ,        
			@ProductQuantity           
	      )

	  END TRY
	 BEGIN CATCH
	     --INSERT INTO ErrorLog
	  --VALUES('ERROR_MESSAGE()','sp_GetAllData'
	   PRINT('Error Occured')
	   END CATCH
   END
GO


Use[ShoppingCartDB]
GO
/** Obeject:Stored Procedure:[dbo].[SP_GetAllProducts] Script Date:04-09-15 07:41:21  *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE SP_GetAllProducts(@CategoryID INT)
AS
  BEGIN
    BEGIN TRY
	   IF(@CategoryID <> 0)
	     BEGIN
		   --Select * from Products Where CategoryID=@CategoryID 

		   SELECT * FROM(SELECT P.CategoryID,
		                        P.ProductID,
								P.Name,
								P.Price,
								P.ImageUrl,
								C.CategoryName,
								P.ProductQuantity,
								Isnull(Sum(CP.TotalProduct),0)                            AS  ProductSold,
								(P.ProductQuantity -  Isnull(Sum(CP.TotalProduct),0) )    AS  AvailableStock
						FROM Products P 
						     INNER JOIN Category C
							       ON C.CategoryID=P.CategoryID
						     LEFT JOIN CustomerProducts CP
							       ON CP.ProductID=P.ProductID
						GROUP BY P.ProductID,
								 P.Name,
								 P.Price,
								 P.ImageUrl,
								 C.CategoryName,
								 P.ProductQuantity,
								 P.CategoryID) StockTable
					    WHERE AvailableStock >0
						      AND CategoryID=@CategoryID
		    END
    	ELSE
	      BEGIN
		   --Select * from Products Where CategoryID=@CategoryID 

		   SELECT * FROM(SELECT P.CategoryID,
		                        P.ProductID,
								P.Name,
								P.Price,
								P.ImageUrl,
								C.CategoryName,
								P.ProductQuantity,
								Isnull(Sum(CP.TotalProduct),0)                            AS  ProductSold,
								(P.ProductQuantity -  Isnull(Sum(CP.TotalProduct),0) )    AS  AvailableStock
						FROM Products P 
						     INNER JOIN Category C
							       ON C.CategoryID=P.CategoryID
						     LEFT JOIN CustomerProducts CP
							       ON CP.ProductID=P.ProductID
						GROUP BY P.ProductID,
								 P.Name,
								 P.Price,
								 P.ImageUrl,
								 C.CategoryName,
								 P.ProductQuantity,
								 P.CategoryID) StockTable
					    WHERE AvailableStock >0
		    END  
	END TRY
	 BEGIN CATCH
	     --INSERT INTO ErrorLog
	  --VALUES('ERROR_MESSAGE()','SP_GetAllProducts'
	   PRINT('Error Occured')
	   END CATCH
 END 


 CREATE PROCEDURE SP_SaveCustomerDetails
 (
   @CustomerName varchar(100),
   @CustomerEmailID varchar(100),
   @CustomerPhoneNo varchar(10),
   @CustomerAddress varchar(500),
   @TotalProducts int,
   @TotalPrice int,
   @PaymentMethod varchar(100)
 )
 AS
   BEGIN
     BEGIN TRY
	   Insert into CutomerDetails(CustomerName,CustomerEmailID,CustomerPhoneNo,CustomerAddress,TotalProducts,TotalPrice,PaymentMethod) 
	   values (@CustomerName,@CustomerEmailID,@CustomerPhoneNo,@CustomerAddress,@TotalProducts,@TotalPrice,@PaymentMethod)

	   --select id as CutomerID from Cutomer Details
	   --where CutomerName=@CustomerName and CutomerEmailID=@CustomerEmailID

	   select @@IDENTITY as CutomerID
	END TRY
	BEGIN CATCH
	 PRINT('Error Occured')
	END CATCH
  END



   CREATE PROCEDURE SP_SaveCustomerProducts
 (
   @CustomerID int,
   @ProductID int,
   @TotalProduct int
 )
 AS
   BEGIN
     BEGIN TRY
	   Insert into CustomerProducts(CustomerID,ProductID,TotalProduct) 
	   values (@CustomerID,@ProductID, @TotalProduct)
	END TRY
	BEGIN CATCH
	   PRINT('Error Occured')
	END CATCH
  END


  CREATE PROCEDURE SP_GetOrdersList
  (
    @Flag int
   )
   AS 
     BEGIN
	   BEGIN TRY
	     if(@Flag<>0)
		   Begin
		      Select * from CutomerDetails where ID=@Flag
		   End
		 else
		   Begin
		     Select * from CutomerDetails
		   End
	  END TRY
	  BEGIN CATCH
	    --Insert INTO db,.ErrorLog
		--VALUES(ERROR_MESSAGE(),'sp_GetAllData')
		Print('Error occured')
	 END CATCH
  END


  CREATE PROCEDURE SP_GetAvailableStock(@StockType INT,@CategoryID INT)
  AS
    BEGIN
	  BEGIN TRY
	    DECLARE @StartRange INT
		DECLARE @EndRange INT
        if(@StockType=0)
		   BEGIN
		     SET @StartRange=0
			 SET @EndRange=0
		   END 
		if(@StockType=1)
		   BEGIN
		      SET @StartRange=1
			  SET @EndRange=10
		   END
		if(@StockType=2)
		   BEGIN
		      SET @StartRange=11
			  SET @EndRange=1000
		   END
		if(@CategoryID=0)
		   BEGIN
		         SELECT * FROM(SELECT P.CategoryID,
		                        P.ProductID,
								P.Name,
								P.Price,
								P.ImageUrl,
								C.CategoryName,
								P.ProductQuantity,
								Isnull(Sum(CP.TotalProduct),0)                            AS  ProductSold,
								(P.ProductQuantity -  Isnull(Sum(CP.TotalProduct),0) )    AS  AvailableStock
						FROM Products P 
						     INNER JOIN Category C
							       ON C.CategoryID=P.CategoryID
						     LEFT JOIN CustomerProducts CP
							       ON CP.ProductID=P.ProductID
						GROUP BY P.ProductID,
								 P.Name,
								 P.Price,
								 P.ImageUrl,
								 C.CategoryName,
								 P.ProductQuantity,
								 P.CategoryID) StockTable
					    WHERE AvailableStock BETWEEN @StartRange AND @EndRange
		    END
		ELSE
		    BEGIN
			  SELECT * FROM(SELECT P.CategoryID,
		                        P.ProductID,
								P.Name,
								P.Price,
								P.ImageUrl,
								C.CategoryName,
								P.ProductQuantity,
								Isnull(Sum(CP.TotalProduct),0)                            AS  ProductSold,
								(P.ProductQuantity -  Isnull(Sum(CP.TotalProduct),0) )    AS  AvailableStock
						FROM Products P 
						     INNER JOIN Category C
							       ON C.CategoryID=P.CategoryID
						     LEFT JOIN CustomerProducts CP
							       ON CP.ProductID=P.ProductID
						WHERE C.CategoryID=@CategoryID
						GROUP BY P.ProductID,
								 P.Name,
								 P.Price,
								 P.ImageUrl,
								 C.CategoryName,
								 P.ProductQuantity,
								 P.CategoryID) StockTable
					    WHERE  AvailableStock BETWEEN @StartRange AND @EndRange
			END
      END TRY

	  BEGIN CATCH
	     PRINT('Error Occured')
	  END CATCH
   END