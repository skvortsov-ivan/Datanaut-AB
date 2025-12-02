USE [DataNautDB]
GO

/****** Object:  View [dbo].[V_ReportsInProject]    Script Date: 12/2/2025 1:59:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dbo].[V_ReportsInProject] AS
SELECT p.ProjectId, p.ProjectName AS 'Project Name', r.ReportId, r.ReportTitle AS 'Title', r.ReportEndDate AS 'Issued Date', r.Content, t.TimeLoggingId, t.TotalTimeInHours AS 'Total Time', e.EmployeeId, e.FullName AS 'Full Name', e.EmployeeRole AS 'Employee Role'
FROM Project p
JOIN Report r ON p.ProjectId = r.FkProjectId
JOIN TimeLogging t ON r.ReportId = t.FkReportId
JOIN Employee e ON t.FkEmployeeId = e.EmployeeId;
GO


