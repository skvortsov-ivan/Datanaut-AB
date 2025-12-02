USE [DataNautDb]
GO

/****** Object:  Table [dbo].[UsingResource]    Script Date: 2025-12-02 15:32:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UsingResource](
	[UsingResourceId] [int] NOT NULL,
	[FkEmployeeResourceId] [int] NOT NULL,
	[FkEmployeeId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UsingResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[UsingResource]  WITH CHECK ADD  CONSTRAINT [FK_UsingResource_Employee] FOREIGN KEY([FkEmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO

ALTER TABLE [dbo].[UsingResource] CHECK CONSTRAINT [FK_UsingResource_Employee]
GO

ALTER TABLE [dbo].[UsingResource]  WITH CHECK ADD  CONSTRAINT [FK_UsingResource_EmployeeResource] FOREIGN KEY([FkEmployeeResourceId])
REFERENCES [dbo].[EmployeeResource] ([ResourceId])
GO

ALTER TABLE [dbo].[UsingResource] CHECK CONSTRAINT [FK_UsingResource_EmployeeResource]
GO


