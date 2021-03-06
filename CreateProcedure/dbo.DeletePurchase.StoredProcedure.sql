USE [Pharmacy]
GO
/****** Object:  StoredProcedure [dbo].[DeletePurchase]    Script Date: 21.05.2018 21:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeletePurchase]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[DeletePurchase] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[DeletePurchase]
	@purchase_id int
AS
BEGIN
    DELETE FROM PurchasedMedicines
    WHERE purchase_id = @purchase_id;
    
    DELETE FROM Purchases
    WHERE purchase_id = @purchase_id;   	
END

GO
