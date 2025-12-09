using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace DataNaut.Models;

public partial class DataNautDbContext : DbContext
{
    public DataNautDbContext()
    {
    }

    public DataNautDbContext(DbContextOptions<DataNautDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Employee> Employees { get; set; }

    public virtual DbSet<EmployeeResource> EmployeeResources { get; set; }

    public virtual DbSet<Project> Projects { get; set; }

    public virtual DbSet<ProjectAuditLog> ProjectAuditLogs { get; set; }

    public virtual DbSet<ProjectEmployee> ProjectEmployees { get; set; }

    public virtual DbSet<Report> Reports { get; set; }

    public virtual DbSet<TimeLogging> TimeLoggings { get; set; }

    public virtual DbSet<UsingResource> UsingResources { get; set; }

    public virtual DbSet<VEmployeesInProject> VEmployeesInProjects { get; set; }

    public virtual DbSet<VReportsInProject> VReportsInProjects { get; set; }

    public virtual DbSet<VResourcesPerEmployee> VResourcesPerEmployees { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=IVAN;Database=DataNautDB;Trusted_Connection=True;TrustServerCertificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Employee>(entity =>
        {
            entity.HasKey(e => e.EmployeeId).HasName("PK__Employee__7AD04F116EC2B5F2");

            entity.ToTable("Employee");

            entity.Property(e => e.EmployeeId).ValueGeneratedNever();
            entity.Property(e => e.Competence).HasMaxLength(50);
            entity.Property(e => e.EmployeeRole).HasMaxLength(50);
            entity.Property(e => e.FullName).HasMaxLength(50);
        });

        modelBuilder.Entity<EmployeeResource>(entity =>
        {
            entity.HasKey(e => e.ResourceId).HasName("PK__Employee__4ED1816F9C31253F");

            entity.ToTable("EmployeeResource");

            entity.Property(e => e.ResourceId).ValueGeneratedNever();
            entity.Property(e => e.Equipment).HasMaxLength(50);
            entity.Property(e => e.Software).HasMaxLength(50);
        });

        modelBuilder.Entity<Project>(entity =>
        {
            entity.HasKey(e => e.ProjectId).HasName("PK__Project__761ABEF0FE811649");

            entity.ToTable("Project", tb =>
                {
                    tb.HasTrigger("TR_Changes_Project");
                    tb.HasTrigger("TR_Project_ArchiveStatus");
                    tb.HasTrigger("TR_Project_BudgetValidation");
                    tb.HasTrigger("TR_Project_DateValidation");
                });

            entity.HasIndex(e => e.ProjectName, "UQ__Project__BCBE781CE0F2996B").IsUnique();

            entity.Property(e => e.ProjectId).ValueGeneratedNever();
            entity.Property(e => e.Budget).HasColumnType("decimal(16, 2)");
            entity.Property(e => e.ProjectName).HasMaxLength(50);
            entity.Property(e => e.ProjectStatus).HasMaxLength(50);
        });

        modelBuilder.Entity<ProjectAuditLog>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("Project_AuditLog");

            entity.Property(e => e.ChangeBy).HasMaxLength(50);
            entity.Property(e => e.ChangeDate).HasColumnType("datetime");
            entity.Property(e => e.ChangeType).HasMaxLength(10);
        });

        modelBuilder.Entity<ProjectEmployee>(entity =>
        {
            entity.HasKey(e => e.ProjectEmployeeId).HasName("PK__ProjectE__339275CE9FF66B22");

            entity.ToTable("ProjectEmployee");

            entity.Property(e => e.ProjectEmployeeId).ValueGeneratedNever();

            entity.HasOne(d => d.FkEmployee).WithMany(p => p.ProjectEmployees)
                .HasForeignKey(d => d.FkEmployeeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ProjectEmployee_Employee");

            entity.HasOne(d => d.FkProject).WithMany(p => p.ProjectEmployees)
                .HasForeignKey(d => d.FkProjectId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ProjectEmployee_Project");
        });

        modelBuilder.Entity<Report>(entity =>
        {
            entity.HasKey(e => e.ReportId).HasName("PK__Report__D5BD4805F95D24E6");

            entity.ToTable("Report");

            entity.Property(e => e.ReportId).ValueGeneratedNever();
            entity.Property(e => e.Content).HasMaxLength(4000);
            entity.Property(e => e.ReportTitle).HasMaxLength(50);

            entity.HasOne(d => d.FkProject).WithMany(p => p.Reports)
                .HasForeignKey(d => d.FkProjectId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Report_Project");
        });

        modelBuilder.Entity<TimeLogging>(entity =>
        {
            entity.HasKey(e => e.TimeLoggingId).HasName("PK__TimeLogg__22A44739B1D883D3");

            entity.ToTable("TimeLogging", tb => tb.HasTrigger("TR_TimeLogging_ProjectStatus"));

            entity.Property(e => e.TimeLoggingId).ValueGeneratedNever();
            entity.Property(e => e.TotalTimeInHours).HasColumnType("decimal(4, 1)");

            entity.HasOne(d => d.FkEmployee).WithMany(p => p.TimeLoggings)
                .HasForeignKey(d => d.FkEmployeeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_TimeLogging_Employee");

            entity.HasOne(d => d.FkReport).WithMany(p => p.TimeLoggings)
                .HasForeignKey(d => d.FkReportId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_TimeLogging_Report");
        });

        modelBuilder.Entity<UsingResource>(entity =>
        {
            entity.HasKey(e => e.UsingResourceId).HasName("PK__UsingRes__ABE0C506316370D4");

            entity.ToTable("UsingResource", tb => tb.HasTrigger("TR_UsingResourceAllocation_ProjectStatus"));

            entity.Property(e => e.UsingResourceId).ValueGeneratedNever();

            entity.HasOne(d => d.FkEmployee).WithMany(p => p.UsingResources)
                .HasForeignKey(d => d.FkEmployeeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_UsingResource_Employee");

            entity.HasOne(d => d.FkEmployeeResource).WithMany(p => p.UsingResources)
                .HasForeignKey(d => d.FkEmployeeResourceId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_UsingResource_EmployeeResource");
        });

        modelBuilder.Entity<VEmployeesInProject>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("V_EmployeesInProject");

            entity.Property(e => e.EmployeeRole)
                .HasMaxLength(50)
                .HasColumnName("Employee Role");
            entity.Property(e => e.FullName)
                .HasMaxLength(50)
                .HasColumnName("Full Name");
            entity.Property(e => e.ProjectName)
                .HasMaxLength(50)
                .HasColumnName("Project Name");
        });

        modelBuilder.Entity<VReportsInProject>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("V_ReportsInProject");

            entity.Property(e => e.Content).HasMaxLength(4000);
            entity.Property(e => e.EmployeeRole)
                .HasMaxLength(50)
                .HasColumnName("Employee Role");
            entity.Property(e => e.FullName)
                .HasMaxLength(50)
                .HasColumnName("Full Name");
            entity.Property(e => e.IssuedDate).HasColumnName("Issued Date");
            entity.Property(e => e.ProjectName)
                .HasMaxLength(50)
                .HasColumnName("Project Name");
            entity.Property(e => e.Title).HasMaxLength(50);
            entity.Property(e => e.TotalTime)
                .HasColumnType("decimal(4, 1)")
                .HasColumnName("Total Time");
        });

        modelBuilder.Entity<VResourcesPerEmployee>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("V_ResourcesPerEmployee");

            entity.Property(e => e.Equipment).HasMaxLength(50);
            entity.Property(e => e.FullName)
                .HasMaxLength(50)
                .HasColumnName("Full Name");
            entity.Property(e => e.Role).HasMaxLength(50);
            entity.Property(e => e.Software).HasMaxLength(50);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
