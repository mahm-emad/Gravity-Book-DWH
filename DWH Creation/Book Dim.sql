USE [Gravity_Book_DWH]
GO

/****** Object:  Table [dbo].[DimBook]   ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimBook](
	[book_id_SK] [int] IDENTITY(1,1) NOT NULL,
	[book_id_Bk] [int] NOT NULL,
	[publication_date] [date] NULL,
	[title] [varchar](400) NULL,
	[isbn13] [varchar](13) NULL,
	[num_pages] [int] NULL,
	[publisher_id_BK] [int] NOT NULL,
	[publisher_name] [nvarchar](1000) NULL,
	[language_id_BK] [int] NOT NULL,
	[language_code] [varchar](8) NULL,
	[language_name] [varchar](50) NULL,
	[SSC] [int] NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[is_current] [tinyint] NULL,
 CONSTRAINT [PK_DimBook] PRIMARY KEY CLUSTERED 
(
	[book_id_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DimBook] ADD  CONSTRAINT [DF_DimBook_start_date]  DEFAULT (getdate()) FOR [start_date]
GO

ALTER TABLE [dbo].[DimBook] ADD  CONSTRAINT [DF_DimBook_is_current]  DEFAULT ((1)) FOR [is_current]
GO


