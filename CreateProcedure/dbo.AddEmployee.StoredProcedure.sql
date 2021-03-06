USE [Pharmacy];
GO

/****** Object:  StoredProcedure [dbo].[AddEmployee]    Script Date: 21.05.2018 21:13:32 ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[AddEmployee]')
          AND type IN(N'P', N'PC')
)
    BEGIN
        EXEC dbo.sp_executesql
             @statement = N'CREATE PROCEDURE [dbo].[AddEmployee] AS';
    END;
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[AddEmployee]
	-- Add the parameters for the stored procedure here
@pesel            VARCHAR(11),
@first_name       VARCHAR(128),
@last_name        VARCHAR(128),
@address          VARCHAR(256),
@telephone_number VARCHAR(16),
@city             VARCHAR(64)
AS
     DECLARE @succeed INT= 1, @failure INT= 0;
         BEGIN
             BEGIN TRAN tran_AddEmployee;
             BEGIN TRY
                 INSERT INTO Employees
				(pesel,
				 first_name,
				 last_name,
				 address,
				 telephone_number,
				 city
				)
                 VALUES
				(@pesel,
				 @first_name,
				 @last_name,
				 @address,
				 @telephone_number,
				 @city
				);
                 COMMIT TRAN tran_AddEmployee;
                 SELECT @succeed;
             END TRY
             BEGIN CATCH
                 ROLLBACK TRAN tran_AddEmployee;
                 SELECT @failure;
             END CATCH;
         END;
GO
