using System;
using System.Collections.Generic;

namespace DataNaut.Models;

public partial class VEmployeesInProject
{
    public int ProjectId { get; set; }

    public string ProjectName { get; set; } = null!;

    public int EmployeeId { get; set; }

    public string FullName { get; set; } = null!;

    public string EmployeeRole { get; set; } = null!;
}
