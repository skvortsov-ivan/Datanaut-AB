USE [DataNautDb]
GO

/****** Object:  Table [dbo].[Report]    Script Date: 2025-12-02 15:24:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Report](
	[ReportId] [int] NOT NULL,
	[FkProjectId] [int] NOT NULL,
	[ReportTitle] [nvarchar](50) NOT NULL,
	[Content] [nvarchar](4000) NOT NULL,
	[ReportStartDate] [date] NOT NULL,
	[ReportEndDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_Project] FOREIGN KEY([FkProjectId])
REFERENCES [dbo].[Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_Project]
GO


