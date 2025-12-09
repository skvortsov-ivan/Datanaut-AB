using System;
using System.Collections.Generic;

namespace DataNaut.Models;

public partial class EmployeeResource
{
    public int ResourceId { get; set; }

    public string? Equipment { get; set; }

    public string? Software { get; set; }

    public virtual ICollection<UsingResource> UsingResources { get; set; } = new List<UsingResource>();
}
