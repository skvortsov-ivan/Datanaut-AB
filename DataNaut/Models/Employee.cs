using System;
using System.Collections.Generic;

namespace DataNaut.Models;

public partial class Employee
{
    public int EmployeeId { get; set; }

    public string FullName { get; set; } = null!;

    public string EmployeeRole { get; set; } = null!;

    public string Competence { get; set; } = null!;

    public virtual ICollection<ProjectEmployee> ProjectEmployees { get; set; } = new List<ProjectEmployee>();

    public virtual ICollection<TimeLogging> TimeLoggings { get; set; } = new List<TimeLogging>();

    public virtual ICollection<UsingResource> UsingResources { get; set; } = new List<UsingResource>();
}
