USE [pharmacy]
GO
/****** Object:  StoredProcedure [dbo].[getPurchases]    Script Date: 20.05.2018 15:06:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[getPurchases]

AS

         BEGIN

             SELECT Employees.first_name,

                    Employees.last_name,

                    Employees.address,

                    Employees.telephone_number,

                    Employees.city,

					Purchases.purchase_id,

                    Purchases.date,

                    Purchases.price_overall

             FROM Purchases

                  INNER JOIN Employees ON Purchases.employee_pesel = Employees.pesel;

         END;

