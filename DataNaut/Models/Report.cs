using System;
using System.Collections.Generic;

namespace DataNaut.Models;

public partial class Report
{
    public int ReportId { get; set; }

    public int FkProjectId { get; set; }

    public string ReportTitle { get; set; } = null!;

    public string Content { get; set; } = null!;

    public DateOnly ReportStartDate { get; set; }

    public DateOnly ReportEndDate { get; set; }

    public virtual Project FkProject { get; set; } = null!;

    public virtual ICollection<TimeLogging> TimeLoggings { get; set; } = new List<TimeLogging>();
}
