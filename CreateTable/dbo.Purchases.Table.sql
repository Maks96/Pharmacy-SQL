USE [Pharmacy]
GO
/****** Object:  Table [dbo].[Purchases]    Script Date: 21.05.2018 21:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchases](
	[purchase_id] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[employee_pesel] [varchar](11) NOT NULL,
 CONSTRAINT [PK_Purchases] PRIMARY KEY CLUSTERED 
(
	[purchase_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Purchases]  WITH CHECK ADD  CONSTRAINT [FK_Purchases_Employees] FOREIGN KEY([employee_pesel])
REFERENCES [dbo].[Employees] ([pesel])
GO
ALTER TABLE [dbo].[Purchases] CHECK CONSTRAINT [FK_Purchases_Employees]
GO
