USE DataNautDB;
GO

--Skapa tabeller

--Project
CREATE TABLE Project (
  ProjectId INT PRIMARY KEY,
  ProjectName NVARCHAR(50) NOT NULL,
  Budget DECIMAL NOT NULL,
  ProjectStartDate DATE NOT NULL,
  ProjectEndDate DATE NOT NULL,
  ProjectStatus NVARCHAR(50) NOT NULL
);

--Report
CREATE TABLE Report (
  ReportId INT PRIMARY KEY,
  FkProjectId INT NOT NULL,
  ReportTitle NVARCHAR(50) NOT NULL,
  Content NVARCHAR(4000) NOT NULL,
  ReportStartDate DATE NOT NULL,
  ReportEndDate DATE NOT NULL,
  CONSTRAINT FK_Report_Project FOREIGN KEY(FkProjectId) REFERENCES Project(ProjectId)

);

--Employee
CREATE TABLE Employee (
EmployeeId INT PRIMARY KEY,
FullName NVARCHAR(50) NOT NULL,
EmployeeRole NVARCHAR(50) NOT NULL,
Competence NVARCHAR(50) NOT NULL
);

--Time Logging
CREATE TABLE TimeLogging (
  TimeLoggingId INT PRIMARY KEY,
  FkReportId INT NOT NULL,
  FkEmployeeId INT NOT NULL,
  TotalTimeInHours DECIMAL NOT NULL,
  CONSTRAINT FK_TimeLogging_Report FOREIGN KEY(FkReportId) REFERENCES Report(ReportId),
  CONSTRAINT FK_TimeLogging_Employee FOREIGN KEY(FkEmployeeId) REFERENCES Employee(EmployeeId)
);

--Project Employee
CREATE TABLE ProjectEmployee (
ProjectEmployeeId INT PRIMARY KEY,
FkEmployeeId INT NOT NULL,
FkProjectId INT NOT NULL,
CONSTRAINT FK_ProjectEmployee_Employee FOREIGN KEY(FkEmployeeId) REFERENCES Employee(EmployeeId),
CONSTRAINT FK_ProjectEmployee_Project FOREIGN KEY(FkProjectId) REFERENCES Project(ProjectId)
);

--Resource
CREATE TABLE EmployeeResource(
ResourceId INT PRIMARY KEY,
Equipment NVARCHAR(50),
Software NVARCHAR(50)
);

--Using Resource
CREATE TABLE UsingResource(
UsingResourceId INT PRIMARY KEY,
FkResourceId INT NOT NULL,
FkEmployeeId INT NOT NULL,
CONSTRAINT FK_UsingResource_EmployeeResource FOREIGN KEY(FkResourceId) REFERENCES EmployeeResource(ResourceId),
CONSTRAINT FK_UsingResource_Employee FOREIGN KEY(FkEmployeeId) REFERENCES Employee(EmployeeId)
);
