using System;
using System.Collections.Generic;

namespace DataNaut.Models;

public partial class ProjectAuditLog
{
    public int ProjectId { get; set; }

    public string ChangeType { get; set; } = null!;

    public string? OldValue { get; set; }

    public string ChangeBy { get; set; } = null!;

    public DateTime ChangeDate { get; set; }

    public string? NewValue { get; set; }
}
