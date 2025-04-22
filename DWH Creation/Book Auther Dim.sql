USE [Gravity_Book_DWH]
GO

/****** Object:  Table [dbo].[Dim_Book_Author] ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim_Book_Author](
	[BookAuthor_SK] [int] IDENTITY(1,1) NOT NULL,
	[book_id_FK_BK] [int] NULL,
	[author_id_FK_BK] [int] NULL,
	[SSC] [int] NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[is_current] [tinyint] NULL,
 CONSTRAINT [PK_Dim_Book_Author] PRIMARY KEY CLUSTERED 
(
	[BookAuthor_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Dim_Book_Author] ADD  CONSTRAINT [DF_Dim_Book_Author_start_date]  DEFAULT (getdate()) FOR [start_date]
GO

ALTER TABLE [dbo].[Dim_Book_Author] ADD  CONSTRAINT [DF_Dim_Book_Author_is_current]  DEFAULT ((1)) FOR [is_current]
GO

ALTER TABLE [dbo].[Dim_Book_Author]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Book_Author_DimAuthor] FOREIGN KEY([author_id_FK_BK])
REFERENCES [dbo].[DimAuthor] ([author_id_SK])
GO

ALTER TABLE [dbo].[Dim_Book_Author] CHECK CONSTRAINT [FK_Dim_Book_Author_DimAuthor]
GO

ALTER TABLE [dbo].[Dim_Book_Author]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Book_Author_DimBook] FOREIGN KEY([book_id_FK_BK])
REFERENCES [dbo].[DimBook] ([book_id_SK])
GO

ALTER TABLE [dbo].[Dim_Book_Author] CHECK CONSTRAINT [FK_Dim_Book_Author_DimBook]
GO


