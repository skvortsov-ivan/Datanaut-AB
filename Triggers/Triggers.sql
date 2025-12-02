
--PROJECT TRIGGERS--
USE [DataNautDB]
GO

/****** Object:  Trigger [dbo].[TR_Changes_Project]    Script Date: 2025-12-02 15:48:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER TRIGGER [dbo].[TR_Changes_Project]
ON [dbo].[Project]
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @CurrentTime DATETIME = GETDATE();
    DECLARE @UserName NVARCHAR(128) = SYSTEM_USER;

    IF EXISTS (SELECT 1 FROM deleted) AND NOT EXISTS (SELECT 1 FROM inserted)
    BEGIN
        INSERT INTO Project_AuditLog (
            ProjectID, ChangeType, OldValue, ChangeBy, ChangeDate
        )
        SELECT
            d.ProjectID,
            'DELETE',
            (SELECT d.* FOR JSON PATH, WITHOUT_ARRAY_WRAPPER),
            @UserName,
            @CurrentTime
        FROM deleted d;
    END

    ELSE IF EXISTS (SELECT 1 FROM inserted) AND NOT EXISTS (SELECT 1 FROM deleted)
    BEGIN
        INSERT INTO Project_AuditLog (
            ProjectID, ChangeType, NewValue, ChangeBy, ChangeDate
        )
        SELECT
            i.ProjectID,
            'INSERT',
            (SELECT i.* FOR JSON PATH, WITHOUT_ARRAY_WRAPPER),
            @UserName,
            @CurrentTime
        FROM inserted i;
    END

    ELSE IF EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted)
    BEGIN
        INSERT INTO Project_AuditLog (
            ProjectID, ChangeType, OldValue, NewValue, ChangeBy, ChangeDate
        )
        SELECT
            i.ProjectID,
            'UPDATE',
            (SELECT d.* FOR JSON PATH, WITHOUT_ARRAY_WRAPPER),
            (SELECT i.* FOR JSON PATH, WITHOUT_ARRAY_WRAPPER),
            @UserName,
            @CurrentTime
        FROM inserted i
        INNER JOIN deleted d ON i.ProjectID = d.ProjectID;
    END
END;
GO

ALTER TABLE [dbo].[Project] ENABLE TRIGGER [TR_Changes_Project]
GO


--


USE [DataNautDB]
GO

/****** Object:  Trigger [dbo].[TR_Project_ArchiveStatus]    Script Date: 2025-12-02 15:49:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER TRIGGER [dbo].[TR_Project_ArchiveStatus]
ON [dbo].[Project]
AFTER UPDATE
AS
BEGIN
    IF UPDATE(ProjectStatus)
    BEGIN
        UPDATE P
        SET P.ProjectEndDate = GETDATE()
        FROM Project P
        INNER JOIN inserted i ON P.ProjectId = i.ProjectId
        INNER JOIN deleted d ON P.ProjectId = d.ProjectId
        WHERE 
            i.ProjectStatus = 'Archived'
        AND 
            d.ProjectStatus <> 'Archived'
        AND 
            i.ProjectEndDate IS NULL;
    END
END;
GO

ALTER TABLE [dbo].[Project] ENABLE TRIGGER [TR_Project_ArchiveStatus]
GO


--

USE [DataNautDB]
GO

/****** Object:  Trigger [dbo].[TR_Project_BudgetValidation]    Script Date: 2025-12-02 15:49:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER TRIGGER [dbo].[TR_Project_BudgetValidation]
ON [dbo].[Project]
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE i.Budget < 0
    )
    BEGIN
        ROLLBACK TRANSACTION;

        RAISERROR('Project Budget cannot be negative.', 16, 1);

        RETURN;
    END;
END;
GO

ALTER TABLE [dbo].[Project] ENABLE TRIGGER [TR_Project_BudgetValidation]
GO


--
USE [DataNautDB]
GO

/****** Object:  Trigger [dbo].[TR_Project_DateValidation]    Script Date: 2025-12-02 15:49:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER TRIGGER [dbo].[TR_Project_DateValidation]
ON [dbo].[Project]
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE i.ProjectEndDate < i.ProjectStartDate
    )
    BEGIN
        ROLLBACK TRANSACTION;
        
        RAISERROR('Project End Date cannot be earlier than the Project Start Date.', 16, 1);
        
        RETURN; -- Exit the trigger
    END
END;
GO

ALTER TABLE [dbo].[Project] ENABLE TRIGGER [TR_Project_DateValidation]
GO


--TIMELOGGING TRIGGERS--

USE [DataNautDB]
GO

/****** Object:  Trigger [dbo].[TR_TimeLogging_ProjectStatus]    Script Date: 2025-12-02 15:49:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER TRIGGER [dbo].[TR_TimeLogging_ProjectStatus]
ON [dbo].[TimeLogging]
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        INNER JOIN Report R ON i.FkReportId = R.ReportID 
        INNER JOIN Project P ON R.FkProjectID = P.ProjectID 
        
        WHERE 
            P.ProjectStatus IN ('Completed', 'Archived')
    )
    BEGIN
        ROLLBACK TRANSACTION;
        
        RAISERROR('Cannot log time to a project that is marked as Completed or Archived.', 16, 1);
        
        RETURN;
    END
END;
GO

ALTER TABLE [dbo].[TimeLogging] ENABLE TRIGGER [TR_TimeLogging_ProjectStatus]
GO


--USINGRESOURCE TRIGGERS--

USE [DataNautDB]
GO

/****** Object:  Trigger [dbo].[TR_UsingResourceAllocation_ProjectStatus]    Script Date: 2025-12-02 15:50:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER TRIGGER [dbo].[TR_UsingResourceAllocation_ProjectStatus]
ON [dbo].[UsingResource]
AFTER INSERT
AS
BEGIN
    IF EXISTS(
    SELECT 1
    FROM inserted i
    INNER JOIN Employee E ON i.FkEmployeeId = E.EmployeeId
    INNER JOIN ProjectEmployee PE ON E.EmployeeId = PE.FkEmployeeId
    INNER JOIN Project P ON PE.FkProjectId = P.ProjectId

    WHERE
        P.ProjectStatus IN ('Completed', 'Archived')
    )
    BEGIN

        ROLLBACK TRANSACTION
    
        RAISERROR('Cannot allocate Resource to a project that is marked as Completed or Archived.', 16, 1);

        RETURN
    END
END;
GO

ALTER TABLE [dbo].[UsingResource] ENABLE TRIGGER [TR_UsingResourceAllocation_ProjectStatus]
GO
