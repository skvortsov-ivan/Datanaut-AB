USE [DatanautDB]
GO

/****** Object:  Table [dbo].[Project_AuditLog]    Script Date: 2025-12-02 15:45:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Project_AuditLog]') AND type in (N'U'))
DROP TABLE [dbo].[Project_AuditLog]
GO

/****** Object:  Table [dbo].[Project_AuditLog]    Script Date: 2025-12-02 15:45:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Project_AuditLog](
	[ProjectId] [int] NOT NULL,
	[ChangeType] [nvarchar](10) NOT NULL,
	[OldValue] [nvarchar](50) NOT NULL,
	[ChangeBy] [nvarchar](50) NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[NewValue] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO


