USE [Pharmacy]
GO
/****** Object:  Table [dbo].[PurchasedMedicines]    Script Date: 21.05.2018 21:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchasedMedicines](
	[purchase_id] [int] NOT NULL,
	[medicine_id] [int] NOT NULL,
	[amount] [int] NOT NULL,
	[price_sum] [money] NOT NULL,
 CONSTRAINT [PK_purchases_medicines] PRIMARY KEY CLUSTERED 
(
	[purchase_id] ASC,
	[medicine_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[PurchasedMedicines]  WITH CHECK ADD  CONSTRAINT [FK_purchases_medicines_Medicines] FOREIGN KEY([medicine_id])
REFERENCES [dbo].[Medicines] ([medicine_id])
GO
ALTER TABLE [dbo].[PurchasedMedicines] CHECK CONSTRAINT [FK_purchases_medicines_Medicines]
GO
ALTER TABLE [dbo].[PurchasedMedicines]  WITH CHECK ADD  CONSTRAINT [FK_purchases_medicines_Purchases] FOREIGN KEY([purchase_id])
REFERENCES [dbo].[Purchases] ([purchase_id])
GO
ALTER TABLE [dbo].[PurchasedMedicines] CHECK CONSTRAINT [FK_purchases_medicines_Purchases]
GO
