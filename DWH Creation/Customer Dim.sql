USE [Gravity_Book_DWH]
GO

/****** Object:  Table [dbo].[DimCustomer]    ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimCustomer](
	[customer_id_SK] [int] IDENTITY(1,1) NOT NULL,
	[customer_id_BK] [int] NOT NULL,
	[full_name] [varchar](400) NULL,
	[email] [varchar](350) NULL,
	[SSC] [int] NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[is_current] [tinyint] NULL,
 CONSTRAINT [PK_DimCustomer] PRIMARY KEY CLUSTERED 
(
	[customer_id_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DimCustomer] ADD  CONSTRAINT [DF_DimCustomer_start_date]  DEFAULT (getdate()) FOR [start_date]
GO

ALTER TABLE [dbo].[DimCustomer] ADD  CONSTRAINT [DF_DimCustomer_is_current]  DEFAULT ((1)) FOR [is_current]
GO


