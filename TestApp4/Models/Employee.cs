using System;
using System.Collections.Generic;

#nullable disable

namespace TestApp4.Models
{
    public partial class Employee
    {
        public int Id { get; set; }
        public string EmployeeName { get; set; }
        public int EmployeeRoleId { get; set; }
        public int EmployeeWorkingPlaceId { get; set; }

        public virtual Role EmployeeRole { get; set; }
        public virtual Catalog EmployeeWorkingPlace { get; set; }
    }
}
