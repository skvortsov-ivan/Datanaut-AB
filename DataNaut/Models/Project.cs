using System;
using System.Collections.Generic;

namespace DataNaut.Models;

public partial class Project
{
    public int ProjectId { get; set; }

    public string ProjectName { get; set; } = null!;

    public decimal Budget { get; set; }

    public DateOnly ProjectStartDate { get; set; }

    public DateOnly ProjectEndDate { get; set; }

    public string ProjectStatus { get; set; } = null!;

    public virtual ICollection<ProjectEmployee> ProjectEmployees { get; set; } = new List<ProjectEmployee>();

    public virtual ICollection<Report> Reports { get; set; } = new List<Report>();
}
