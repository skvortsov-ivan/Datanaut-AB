USE [DataNautDb]
GO

/****** Object:  Table [dbo].[Employee]    Script Date: 2025-12-02 15:13:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[EmployeeRole] [nvarchar](50) NOT NULL,
	[Competence] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



