-- PRIMARY KEYS

--Project
ALTER TABLE Project
ADD CONSTRAINT PK_Project PRIMARY KEY (ProjectId);

--Report
ALTER TABLE Report
ADD CONSTRAINT PK_Report PRIMARY KEY (ReportId);

--Employee
ALTER TABLE Employee
ADD CONSTRAINT PK_Employee PRIMARY KEY (EmployeeId);

--TimeLogging
ALTER TABLE TimeLogging
ADD CONSTRAINT PK_TimeLogging PRIMARY KEY (TimeLoggingId);

--ProjectEmployee	
ALTER TABLE ProjectEmployee
ADD CONSTRAINT PK_ProjectEmployee PRIMARY KEY (ProjectEmployeeId);

--EmployeeResource
ALTER TABLE EmployeeResource
ADD CONSTRAINT PK_EmployeeResource PRIMARY KEY (ResourceId);

--UsingResource
ALTER TABLE UsingResource
ADD CONSTRAINT PK_UsingResource PRIMARY KEY (UsingResourceId);


-- FOREIGN KEYS 

--Report
ALTER TABLE Report
ADD CONSTRAINT FK_Report_Project
FOREIGN KEY (FkProjectId) REFERENCES Project(ProjectId);

--TimeLogging
ALTER TABLE TimeLogging
ADD CONSTRAINT FK_TimeLogging_Report
FOREIGN KEY (FkReportId) REFERENCES Report(ReportId);

ALTER TABLE TimeLogging
ADD CONSTRAINT FK_TimeLogging_Employee
FOREIGN KEY (FkEmployeeId) REFERENCES Employee(EmployeeId);

--ProjectEmployee
ALTER TABLE ProjectEmployee
ADD CONSTRAINT FK_ProjectEmployee_Employee
FOREIGN KEY (FkEmployeeId) REFERENCES Employee(EmployeeId);

ALTER TABLE ProjectEmployee
ADD CONSTRAINT FK_ProjectEmployee_Project
FOREIGN KEY (FkProjectId) REFERENCES Project(ProjectId);

--UsingResource
ALTER TABLE UsingResource
ADD CONSTRAINT FK_UsingResource_EmployeeResource
FOREIGN KEY (FkEmployeeResourceId) REFERENCES EmployeeResource(ResourceId);

ALTER TABLE UsingResource
ADD CONSTRAINT FK_UsingResource_Employee
FOREIGN KEY (FkEmployeeId) REFERENCES Employee(EmployeeId);