USE [DataNautDb]
GO

/****** Object:  Table [dbo].[Project]    Script Date: 2025-12-02 15:21:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Project](
	[ProjectId] [int] NOT NULL,
	[ProjectName] [nvarchar](50) NOT NULL,
	[Budget] [decimal](16, 2) NOT NULL,
	[ProjectStartDate] [date] NOT NULL,
	[ProjectEndDate] [date] NOT NULL,
	[ProjectStatus] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


