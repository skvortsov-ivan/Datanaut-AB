using System;
using System.Collections.Generic;

namespace DataNaut.Models;

public partial class TimeLogging
{
    public int TimeLoggingId { get; set; }

    public int FkReportId { get; set; }

    public int FkEmployeeId { get; set; }

    public decimal TotalTimeInHours { get; set; }

    public virtual Employee FkEmployee { get; set; } = null!;

    public virtual Report FkReport { get; set; } = null!;
}
