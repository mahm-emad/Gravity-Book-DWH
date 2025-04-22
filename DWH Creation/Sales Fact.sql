USE [Gravity_Book_DWH]
GO

/****** Object:  Table [dbo].[PriceFact] ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PriceFact](
	[sales_id_SK] [int] IDENTITY(1,1) NOT NULL,
	[order_date] [date] NULL,
	[line_id] [int] NULL,
	[order_id] [int] NULL,
	[customer_id_FK] [int] NULL,
	[Date_FK] [int] NULL,
	[book_FK] [int] NULL,
	[price] [decimal](5, 2) NULL,
 CONSTRAINT [PK_PriceFact] PRIMARY KEY CLUSTERED 
(
	[sales_id_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PriceFact]  WITH CHECK ADD  CONSTRAINT [FK_PriceFact_DimBook] FOREIGN KEY([book_FK])
REFERENCES [dbo].[DimBook] ([book_id_SK])
GO

ALTER TABLE [dbo].[PriceFact] CHECK CONSTRAINT [FK_PriceFact_DimBook]
GO

ALTER TABLE [dbo].[PriceFact]  WITH CHECK ADD  CONSTRAINT [FK_PriceFact_DimCustomer1] FOREIGN KEY([customer_id_FK])
REFERENCES [dbo].[DimCustomer] ([customer_id_SK])
GO

ALTER TABLE [dbo].[PriceFact] CHECK CONSTRAINT [FK_PriceFact_DimCustomer1]
GO

ALTER TABLE [dbo].[PriceFact]  WITH CHECK ADD  CONSTRAINT [FK_PriceFact_DimDate1] FOREIGN KEY([Date_FK])
REFERENCES [dbo].[DimDate] ([DateSK])
GO

ALTER TABLE [dbo].[PriceFact] CHECK CONSTRAINT [FK_PriceFact_DimDate1]
GO


