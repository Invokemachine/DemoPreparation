using System;
using System.Collections.Generic;

#nullable disable

namespace TestApp4.Models
{
    public partial class Role
    {
        public Role()
        {
            Employees = new HashSet<Employee>();
            Users = new HashSet<User>();
        }

        public int RoleId { get; set; }
        public string Role1 { get; set; }

        public virtual ICollection<Employee> Employees { get; set; }
        public virtual ICollection<User> Users { get; set; }
    }
}
