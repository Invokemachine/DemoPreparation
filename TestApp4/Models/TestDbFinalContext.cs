using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace TestApp4.Models
{
    public partial class TestDbFinalContext : DbContext
    {
        public TestDbFinalContext()
        {
        }

        public TestDbFinalContext(DbContextOptions<TestDbFinalContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Catalog> Catalogs { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<Good> Goods { get; set; }
        public virtual DbSet<PointsOfIssue> PointsOfIssues { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<WorkersInfo> WorkersInfos { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Data Source=DESKTOP-N7IEGIM\\SQLEXPRESS; Initial Catalog= TestDbFinal; Trusted_Connection = true; MultipleActiveResultSets = true");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "Cyrillic_General_CI_AS");

            modelBuilder.Entity<Catalog>(entity =>
            {
                entity.Property(e => e.CatalogName)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Employee>(entity =>
            {
                entity.ToTable("Employee");

                entity.Property(e => e.EmployeeName)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.EmployeeRole)
                    .WithMany(p => p.Employees)
                    .HasForeignKey(d => d.EmployeeRoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Employee_Roles");

                entity.HasOne(d => d.EmployeeWorkingPlace)
                    .WithMany(p => p.Employees)
                    .HasForeignKey(d => d.EmployeeWorkingPlaceId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Employee_Catalogs");
            });

            modelBuilder.Entity<Good>(entity =>
            {
                entity.HasKey(e => e.Article);

                entity.Property(e => e.Article).HasMaxLength(50);

                entity.Property(e => e.Category)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Manufacturer)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Supplier)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.UnitType)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<PointsOfIssue>(entity =>
            {
                entity.HasKey(e => e.PointId);

                entity.ToTable("PointsOfIssue");

                entity.Property(e => e.Address).IsRequired();

                entity.Property(e => e.WorkTime).HasMaxLength(50);
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.Property(e => e.Role1)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("Role");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.Login)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_RoleId");
            });

            modelBuilder.Entity<WorkersInfo>(entity =>
            {
                entity.ToTable("WorkersInfo");

                entity.Property(e => e.WorkTime).HasMaxLength(50);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
