USE [DataNautDB]
GO

/****** Object:  View [dbo].[V_ResourcesPerEmployee]    Script Date: 12/2/2025 2:11:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dbo].[V_ResourcesPerEmployee] AS
SELECT e.EmployeeId, e.FullName AS 'Full Name', e.EmployeeRole AS 'Role', er.ResourceId, er.Equipment, er.Software
FROM Employee e
JOIN UsingResource ur ON e.EmployeeId = ur.FkEmployeeId
JOIN EmployeeResource er ON ur.FkResourceId = er.ResourceId;
GO


