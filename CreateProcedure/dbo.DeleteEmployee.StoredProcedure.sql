USE [Pharmacy]
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployee]    Script Date: 06.06.2018 19:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteEmployee]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[DeleteEmployee] AS' 
END
GO
ALTER PROCEDURE [dbo].[DeleteEmployee] @pesel VARCHAR(11)
AS
     DECLARE @succeed INT= 1, @failure INT= 0;
         BEGIN
             BEGIN TRAN tran_DeleteEmployee;
             BEGIN TRY
                 DELETE FROM PurchasedMedicines
                 WHERE purchase_id IN
							 (
								SELECT purchase_id
								FROM Purchases
								WHERE employee_pesel = @pesel
							 );
                 DELETE FROM Purchases
                 WHERE employee_pesel = @pesel;

                 DELETE FROM Employees
                 WHERE pesel = @pesel;

                 IF(@@ROWCOUNT > 0)
                     BEGIN
                         SELECT @succeed;
                     END;
                     ELSE
                     BEGIN
                         SELECT @failure;
                     END;
                 COMMIT TRAN tran_DeleteEmployee;
             END TRY
             BEGIN CATCH
                 ROLLBACK TRAN tran_DeleteEmployee;
                 SELECT @failure;
             END CATCH;
         END;

GO
