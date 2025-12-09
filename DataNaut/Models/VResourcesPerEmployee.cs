using System;
using System.Collections.Generic;

namespace DataNaut.Models;

public partial class VResourcesPerEmployee
{
    public int EmployeeId { get; set; }

    public string FullName { get; set; } = null!;

    public string Role { get; set; } = null!;

    public int ResourceId { get; set; }

    public string? Equipment { get; set; }

    public string? Software { get; set; }
}
