USE [Gravity_Book_DWH]
GO

/****** Object:  Table [dbo].[DimAuthor]   ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimAuthor](
	[author_id_SK] [int] IDENTITY(1,1) NOT NULL,
	[author_id_BK] [int] NOT NULL,
	[author_name] [varchar](400) NULL,
	[SSC] [int] NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[is_current] [tinyint] NULL,
 CONSTRAINT [PK_DimAuthor] PRIMARY KEY CLUSTERED 
(
	[author_id_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DimAuthor] ADD  CONSTRAINT [DF_DimAuthor_start_date]  DEFAULT (getdate()) FOR [start_date]
GO

ALTER TABLE [dbo].[DimAuthor] ADD  CONSTRAINT [DF_DimAuthor_is_current]  DEFAULT ((1)) FOR [is_current]
GO


