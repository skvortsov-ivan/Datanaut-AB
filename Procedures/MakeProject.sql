USE [DataNautDB]
GO

/****** Object:  StoredProcedure [dbo].[MakeProject]    Script Date: 2025-12-09 14:45:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Stored Procedure to insert a new Project record
CREATE OR ALTER PROCEDURE [dbo].[MakeProject]
    @ProjectId INT,
    @ProjectName NVARCHAR(50),
    @Budget DECIMAL(16, 2), -- Matching the column definition in Project table
    @ProjectStartDate DATE,
    @ProjectEndDate DATE,
    @ProjectStatus NVARCHAR(50)
AS
BEGIN
    -- Insert the new project data into the Project table
    INSERT INTO Project (ProjectId, ProjectName, Budget, ProjectStartDate, ProjectEndDate, ProjectStatus)
    VALUES (@ProjectId, @ProjectName, @Budget, @ProjectStartDate, @ProjectEndDate, @ProjectStatus)
END;
GO
