USE [Gravity_Book_DWH]
GO

/****** Object:  Table [dbo].[DimCustomerAddress]  ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimCustomerAddress](
	[customerAdd_id_SK] [int] IDENTITY(1,1) NOT NULL,
	[customer_id_FK_BK] [int] NULL,
	[address_id_FK_BK] [int] NULL,
	[address_status] [varchar](30) NULL,
	[status_id_BK] [int] NOT NULL,
	[SSC] [int] NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[is_current] [tinyint] NULL,
 CONSTRAINT [PK_DimCustomerAddress] PRIMARY KEY CLUSTERED 
(
	[customerAdd_id_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DimCustomerAddress] ADD  CONSTRAINT [DF_DimCustomerAddress_start_date]  DEFAULT (getdate()) FOR [start_date]
GO

ALTER TABLE [dbo].[DimCustomerAddress] ADD  CONSTRAINT [DF_DimCustomerAddress_is_current]  DEFAULT ((1)) FOR [is_current]
GO

ALTER TABLE [dbo].[DimCustomerAddress]  WITH CHECK ADD  CONSTRAINT [FK_DimCustomerAddress_DimAddress] FOREIGN KEY([address_id_FK_BK])
REFERENCES [dbo].[DimAddress] ([address_id_SK])
GO

ALTER TABLE [dbo].[DimCustomerAddress] CHECK CONSTRAINT [FK_DimCustomerAddress_DimAddress]
GO

ALTER TABLE [dbo].[DimCustomerAddress]  WITH CHECK ADD  CONSTRAINT [FK_DimCustomerAddress_DimCustomer] FOREIGN KEY([customer_id_FK_BK])
REFERENCES [dbo].[DimCustomer] ([customer_id_SK])
GO

ALTER TABLE [dbo].[DimCustomerAddress] CHECK CONSTRAINT [FK_DimCustomerAddress_DimCustomer]
GO


