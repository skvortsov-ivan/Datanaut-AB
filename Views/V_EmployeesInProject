USE [DataNautDB]
GO

/****** Object:  View [dbo].[V_EmployeesInProject]    Script Date: 12/2/2025 1:46:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dbo].[V_EmployeesInProject] AS
SELECT p.ProjectId, p.ProjectName AS 'Project Name', e.EmployeeId, e.FullName AS 'Full Name', e.EmployeeRole AS 'Employee Role'
FROM Project p 
JOIN ProjectEmployee pe ON p.ProjectId=pe.FkProjectId
JOIN Employee e ON pe.FkEmployeeId=e.EmployeeId;
GO


