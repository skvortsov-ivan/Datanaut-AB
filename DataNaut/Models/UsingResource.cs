using System;
using System.Collections.Generic;

namespace DataNaut.Models;

public partial class UsingResource
{
    public int UsingResourceId { get; set; }

    public int FkEmployeeResourceId { get; set; }

    public int FkEmployeeId { get; set; }

    public virtual Employee FkEmployee { get; set; } = null!;

    public virtual EmployeeResource FkEmployeeResource { get; set; } = null!;
}
