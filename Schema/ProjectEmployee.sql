USE [DataNautDb]
GO

/****** Object:  Table [dbo].[ProjectEmployee]    Script Date: 2025-12-02 15:23:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ProjectEmployee](
	[ProjectEmployeeId] [int] NOT NULL,
	[FkEmployeeId] [int] NOT NULL,
	[FkProjectId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProjectEmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ProjectEmployee]  WITH CHECK ADD  CONSTRAINT [FK_ProjectEmployee_Employee] FOREIGN KEY([FkEmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO

ALTER TABLE [dbo].[ProjectEmployee] CHECK CONSTRAINT [FK_ProjectEmployee_Employee]
GO

ALTER TABLE [dbo].[ProjectEmployee]  WITH CHECK ADD  CONSTRAINT [FK_ProjectEmployee_Project] FOREIGN KEY([FkProjectId])
REFERENCES [dbo].[Project] ([ProjectId])
GO

ALTER TABLE [dbo].[ProjectEmployee] CHECK CONSTRAINT [FK_ProjectEmployee_Project]
GO


