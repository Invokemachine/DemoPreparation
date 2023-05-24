using System;
using System.Collections.Generic;

#nullable disable

namespace TestApp4.Models
{
    public partial class WorkersInfo
    {
        public int Id { get; set; }
        public int CatalogId { get; set; }
        public int EmployeeId { get; set; }
        public string WorkTime { get; set; }
    }
}
