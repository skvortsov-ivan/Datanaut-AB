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

-- Insert Into Project
INSERT INTO Project (ProjectId, ProjectName, Budget, ProjectStartDate, ProjectEndDate, ProjectStatus)
VALUES
(1, 'Apollo AI System', 1500000, '2024-01-10', '2024-12-15', 'Completed'),
(2, 'Nebula Cloud Migration', 800000, '2023-09-01', '2024-03-30', 'Completed'),
(3, 'Quantum Analytics Tool', 1200000, '2024-05-05', '2025-02-01', 'Completed'),
(4, 'DART Mission', 6200000, '2024-05-05', '2026-06-25', 'In Progress');


-- Insert Into Report
INSERT INTO Report (ReportId, FkProjectId, ReportTitle, Content, ReportStartDate, ReportEndDate)
VALUES
(1, 1, 'Weekly Progress – Apollo', 'Completed backend module + bug fixes', '2024-02-01', '2024-02-07'),
(2, 2, 'Migration Summary', 'Final cloud migration testing completed successfully.', '2024-03-01', '2024-03-07'),
(3, 3, 'Initial Planning – Quantum Tool', 'Outlined scope and milestones.', '2024-05-10', '2024-05-20'),
(4, 4, 'Plume spread analysis', 'Eccentricity of the new orbit.', '2020-05-10', '2021-05-20');

-- Insert Into Employee
INSERT INTO Employee (EmployeeId, FullName, EmployeeRole, Competence)
VALUES
(1, 'Anna Berg', 'Project Manager', 'Leadership'),
(2, 'Johan Nilsson', 'Software Engineer', 'C# / .NET'),
(3, 'Maria Svensson', 'Data Scientist', 'Machine Learning'),
(4, 'Erik Lund', 'DevOps Engineer', 'Azure / Cloud'),
(5, 'Dimitri Alexander Theo Lindqvist', 'UI/UX Designer', 'Figma / Prototyping');

-- Insert Into Time Logging
INSERT INTO TimeLogging (TimeLoggingId, FkReportId, FkEmployeeId, TotalTimeInHours)
VALUES
(1, 1, 2, 12.5),
(2, 1, 3, 9.0),
(3, 2, 4, 15.5),
(4, 3, 1, 5.5),
(5, 4, 5, 7.5);

-- Insert Into Project Employee
INSERT INTO ProjectEmployee (ProjectEmployeeId, FkEmployeeId, FkProjectId)
VALUES
(1, 1, 1),
(2, 2, 1),
(3, 5, 4),
(4, 4, 2),
(5, 5, 3);

-- Insert Into Employee Resource
INSERT INTO EmployeeResource (ResourceId, Equipment, Software)
VALUES
(1, 'Dell XPS 15', 'Visual Studio 2022'),
(2, 'MacBook Pro', 'Figma'),
(3, 'HP EliteBook', 'Azure DevOps'),
(4, 'Custom Workstation', 'Python & TensorFlow'),
(5, 'Tzatziki', 'Köttbullar');

-- Insert Into Using Resource
INSERT INTO UsingResource (UsingResourceId, FkResourceId, FkEmployeeId)
VALUES
(1, 1, 2),
(2, 2, 5),
(3, 3, 4),
(4, 4, 3);