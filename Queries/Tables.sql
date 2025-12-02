USE DataNautDB;
GO

-- Skapa tabeller

-- Project
CREATE TABLE Project (
ProjectId INT NOT NULL,
ProjectName NVARCHAR(50) NOT NULL,
Budget DECIMAL(16,2) NOT NULL,
ProjectStartDate DATE NOT NULL,
ProjectEndDate DATE NOT NULL,
ProjectStatus NVARCHAR(50) NOT NULL
);

-- Report
CREATE TABLE Report (
ReportId INT NOT NULL,
FkProjectId INT NOT NULL,
ReportTitle NVARCHAR(50) NOT NULL,
Content NVARCHAR(4000) NOT NULL,
ReportStartDate DATE NOT NULL,
ReportEndDate DATE NOT NULL
);

-- Employee
CREATE TABLE Employee (
EmployeeId INT NOT NULL,
FullName NVARCHAR(50) NOT NULL,
EmployeeRole NVARCHAR(50) NOT NULL,
Competence NVARCHAR(50) NOT NULL
);

-- TimeLogging
CREATE TABLE TimeLogging (
TimeLoggingId INT NOT NULL,
FkReportId INT NOT NULL,
FkEmployeeId INT NOT NULL,
TotalTimeInHours DECIMAL(4,1) NOT NULL
);

-- ProjectEmployee
CREATE TABLE ProjectEmployee (
ProjectEmployeeId INT NOT NULL,
FkEmployeeId INT NOT NULL,
FkProjectId INT NOT NULL
);

-- Resource
CREATE TABLE EmployeeResource (
ResourceId INT NOT NULL,
Equipment NVARCHAR(50),
Software NVARCHAR(50)
);

-- UsingResource
CREATE TABLE UsingResource (
UsingResourceId INT NOT NULL,
FkEmployeeResourceId INT NOT NULL,
FkEmployeeId INT NOT NULL
);