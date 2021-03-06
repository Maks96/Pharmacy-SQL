USE [Pharmacy]
GO
/****** Object:  StoredProcedure [dbo].[getPurchases]    Script Date: 21.05.2018 21:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getPurchases]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[getPurchases] AS' 
END
GO

ALTER PROCEDURE [dbo].[getPurchases]
AS
         BEGIN
             SELECT Employees.pesel,
					Employees.first_name,
                    Employees.last_name,
                    Employees.address,
                    Employees.telephone_number,
                    Employees.city,
                    Purchases.purchase_id,
                    convert(varchar, Purchases.date, 121) as date
             FROM Purchases
                  INNER JOIN Employees ON Purchases.employee_pesel = Employees.pesel;
         END;
GO
