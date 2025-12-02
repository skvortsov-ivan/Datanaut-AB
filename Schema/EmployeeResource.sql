USE [DataNautDb]
GO

/****** Object:  Table [dbo].[EmployeeResource]    Script Date: 2025-12-02 15:20:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EmployeeResource](
	[ResourceId] [int] NOT NULL,
	[Equipment] [nvarchar](50) NULL,
	[Software] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


