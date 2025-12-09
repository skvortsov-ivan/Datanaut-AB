using System;
using System.Collections.Generic;

namespace DataNaut.Models;

public partial class VReportsInProject
{
    public int ProjectId { get; set; }

    public string ProjectName { get; set; } = null!;

    public int ReportId { get; set; }

    public string Title { get; set; } = null!;

    public DateOnly IssuedDate { get; set; }

    public string Content { get; set; } = null!;

    public int TimeLoggingId { get; set; }

    public decimal TotalTime { get; set; }

    public int EmployeeId { get; set; }

    public string FullName { get; set; } = null!;

    public string EmployeeRole { get; set; } = null!;
}
