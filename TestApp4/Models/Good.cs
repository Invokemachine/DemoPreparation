using System;
using System.Collections.Generic;

#nullable disable

namespace TestApp4.Models
{
    public partial class Good
    {
        public string Article { get; set; }
        public string Name { get; set; }
        public string UnitType { get; set; }
        public double Price { get; set; }
        public int MaxDiscountAmount { get; set; }
        public string Manufacturer { get; set; }
        public string Supplier { get; set; }
        public string Category { get; set; }
        public int CurrentDiscount { get; set; }
        public int AmountInStock { get; set; }
        public string Description { get; set; }
        public string Picture { get; set; }
    }
}
