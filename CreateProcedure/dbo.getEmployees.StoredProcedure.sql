USE [Pharmacy]
GO
/****** Object:  StoredProcedure [dbo].[getEmployees]    Script Date: 16.05.2018 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getEmployees]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[getEmployees] AS' 
END
GO
ALTER PROCEDURE [dbo].[getEmployees]
AS
  BEGIN
    SELECT
      pesel,
      first_name,
      last_name,
      address,
      telephone_number,
      city
    FROM Employees
  END
GO
