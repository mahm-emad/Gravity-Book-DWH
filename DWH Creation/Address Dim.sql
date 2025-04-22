USE [Gravity_Book_DWH]
GO

/****** Object:  Table [dbo].[DimAddress]   ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimAddress](
	[address_id_SK] [int] IDENTITY(1,1) NOT NULL,
	[address_id_BK] [int] NOT NULL,
	[street_number] [varchar](10) NULL,
	[street_name] [varchar](200) NULL,
	[city] [varchar](100) NULL,
	[country_id_BK] [int] NOT NULL,
	[country_name] [varchar](200) NULL,
	[SSC] [int] NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[is_current] [tinyint] NULL,
 CONSTRAINT [PK_DimAddress] PRIMARY KEY CLUSTERED 
(
	[address_id_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DimAddress] ADD  CONSTRAINT [DF_DimAddress_start_date]  DEFAULT (getdate()) FOR [start_date]
GO

ALTER TABLE [dbo].[DimAddress] ADD  CONSTRAINT [DF_DimAddress_is_current]  DEFAULT ((1)) FOR [is_current]
GO


