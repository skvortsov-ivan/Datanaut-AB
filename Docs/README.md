
# 🚀 DataNaut

> **DataNaut** is a .NET 8 + SQL Server project management database solution built with Entity Framework Core. It models projects, employees, reports, time logging, resources, and enforces business rules using **constraints, triggers, views, and stored procedures**.

---

## ✨ Key Features

* 📊 **Project Management** – projects with budgets, timelines, statuses, and audit history
* 👥 **Employee & Resource Tracking** – employees, assigned resources, and roles
* ⏱️ **Time Logging** – log work per report and employee with validation
* 🧾 **Reporting** – reports per project with aggregated time data
* 🔒 **Data Integrity** – enforced using SQL constraints & triggers
* 🕵️ **Audit Trail** – automatic logging of all project changes

---

## 🧱 Tech Stack

* **.NET 8** (Console Application)
* **Entity Framework Core 8**
* **SQL Server**
* **T-SQL** (Schemas, Views, Triggers, Procedures)

---

## 🗂️ Project Structure

```
Data/
  TestData.sql            # Sample data for local testing

DataNaut/
  Models/                 # EF Core domain models & database views
  Program.cs              # Application entry point
  DataNautDbContext.cs    # EF Core DbContext

Schema/
  DomainModels/           # Table definitions
  JunctionTables/         # Many-to-many relations

Views/                    # Database views
Triggers/                 # Business-rule triggers
Procedures/               # Stored procedures
Queries/                  # DB setup scripts

Docs/                     # Documentation & reflections
```

---

## 🧩 Database Design Overview

### Core Entities

* **Project** – name, budget, dates, status
* **Employee** – role & competence
* **Report** – project-based reporting periods
* **TimeLogging** – hours logged per employee/report
* **EmployeeResource** – equipment & software

### Relations

* Many-to-many between **Projects ↔ Employees**
* Employees can use multiple resources
* Reports belong to projects and aggregate time logs

---

## 🔔 Triggers & Business Rules

Some of the enforced rules include:

* ❌ Prevent negative project budgets
* 📆 Ensure project end date is not before start date
* 🔒 Block time logging on completed or archived projects
* 📦 Prevent resource allocation to closed projects
* 📝 Full **audit logging** on project INSERT / UPDATE / DELETE

Detailed explanations can be found in:

```
Docs/Trigger&Constraints
```

---

## 📊 Database Views

* **V_EmployeesInProject** – employees per project
* **V_ReportsInProject** – reports with total logged time
* **V_ResourcesPerEmployee** – resource allocation overview

These are mapped directly into EF Core as read-only entities.

---

## ⚙️ Getting Started

### 1️⃣ Database Setup

Run the SQL scripts in this order:

1. `Queries/DataNautDbSetup.sql`
2. Schema files in `Schema/`
3. Triggers in `Triggers/`
4. Views in `Views/`
5. Procedures in `Procedures/`
6. Test data: `Data/TestData.sql`

### 2️⃣ Configure Connection String

⚠️ **Important:** Move the connection string out of source code before production.

Update `DataNautDbContext` or use `appsettings.json`:

```json
"ConnectionStrings": {
  "DefaultConnection": "Server=YOUR_SERVER;Database=DataNautDB;Trusted_Connection=True;"
}
```

---

## 🧪 Sample Data

The project includes realistic sample data:

* Active & completed projects
* Employees with different roles
* Time logs & reports
* Resource allocations (yes, even **Tzatziki & Köttbullar** 🌯😉)

---

## 📚 Documentation

Additional documentation is available in the `Docs/` folder:

* 📖 **WeeklyReports.md** – sprint reports
* 🧠 **Reflektion.md** – team reflections & learnings
* 🔧 **Trigger&Constraints** – deep dive into database logic

---

## 👨‍💻 Team & Learning Goals

This project was created as part of a **.NET / Database design course**, focusing on:

* Relational modeling & normalization
* SQL constraints & triggers
* EF Core database-first approach
* Team-based development & design decisions

---

## 📜 License

This project is intended for **educational purposes**.

---

✨ *Built with curiosity, structure, and a lot of SQL.*
