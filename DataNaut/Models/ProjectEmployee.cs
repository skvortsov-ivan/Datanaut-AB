using System;
using System.Collections.Generic;

namespace DataNaut.Models;

public partial class ProjectEmployee
{
    public int ProjectEmployeeId { get; set; }

    public int FkEmployeeId { get; set; }

    public int FkProjectId { get; set; }

    public virtual Employee FkEmployee { get; set; } = null!;

    public virtual Project FkProject { get; set; } = null!;
}
