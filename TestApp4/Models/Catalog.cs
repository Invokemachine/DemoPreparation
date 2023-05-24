using System;
using System.Collections.Generic;

#nullable disable

namespace TestApp4.Models
{
    public partial class Catalog
    {
        public Catalog()
        {
            Employees = new HashSet<Employee>();
        }

        public int Id { get; set; }
        public string CatalogName { get; set; }

        public virtual ICollection<Employee> Employees { get; set; }
    }
}
