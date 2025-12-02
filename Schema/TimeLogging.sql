USE [DataNautDb]
GO

/****** Object:  Table [dbo].[TimeLogging]    Script Date: 2025-12-02 15:28:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TimeLogging](
	[TimeLoggingId] [int] NOT NULL,
	[FkReportId] [int] NOT NULL,
	[FkEmployeeId] [int] NOT NULL,
	[TotalTimeInHours] [decimal](4, 1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TimeLoggingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TimeLogging]  WITH CHECK ADD  CONSTRAINT [FK_TimeLogging_Employee] FOREIGN KEY([FkEmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO

ALTER TABLE [dbo].[TimeLogging] CHECK CONSTRAINT [FK_TimeLogging_Employee]
GO

ALTER TABLE [dbo].[TimeLogging]  WITH CHECK ADD  CONSTRAINT [FK_TimeLogging_Report] FOREIGN KEY([FkReportId])
REFERENCES [dbo].[Report] ([ReportId])
GO

ALTER TABLE [dbo].[TimeLogging] CHECK CONSTRAINT [FK_TimeLogging_Report]
GO


