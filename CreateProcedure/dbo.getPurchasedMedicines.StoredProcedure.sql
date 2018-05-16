USE [Pharmacy]
GO
/****** Object:  StoredProcedure [dbo].[getPurchasedMedicines]    Script Date: 16.05.2018 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getPurchasedMedicines]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[getPurchasedMedicines] AS' 
END
GO

ALTER PROCEDURE [dbo].[getPurchasedMedicines]  (
								   @purchase_id int
								   ) 
AS
         BEGIN
             SELECT PurchasedMedicines.purchase_id,
                    PurchasedMedicines.medicine_id,
                    PurchasedMedicines.amount,
                    PurchasedMedicines.price_sum,
                    Medicines.description AS medicine_description,
                    Medicines.unit_price AS unit_price,
                    Medicines.name AS medicine_name,
                    Medicines.unit_price_change_date AS unit_price_change_date
             FROM PurchasedMedicines
                  INNER JOIN Medicines ON PurchasedMedicines.medicine_id = Medicines.medicine_id
		   WHERE PurchasedMedicines.purchase_id = @purchase_id;
         END;
GO
