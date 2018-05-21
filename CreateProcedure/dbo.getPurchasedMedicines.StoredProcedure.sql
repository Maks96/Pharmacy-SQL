USE [pharmacy]
GO
/****** Object:  StoredProcedure [dbo].[getPurchasedMedicines]    Script Date: 20.05.2018 14:37:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[getPurchasedMedicines]  (

								   @purchase_id int

								   ) 

AS

         BEGIN

             SELECT PurchasedMedicines.amount,

                    PurchasedMedicines.price_sum,

                    Medicines.description AS medicine_description,

                    Medicines.unit_price AS unit_price,

                    Medicines.name AS medicine_name,

                    Medicines.unit_price_change_date AS unit_price_change_date

             FROM PurchasedMedicines

                  INNER JOIN Medicines ON PurchasedMedicines.medicine_id = Medicines.medicine_id

		   WHERE PurchasedMedicines.purchase_id = @purchase_id;

         END;

