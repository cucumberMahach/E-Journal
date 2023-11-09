using E_Journal.Domain.Model;
using Microsoft.EntityFrameworkCore;

namespace E_Journal.Infrastructure
{
    public class Context : DbContext
    {
        public DbSet<Attend> Attends { get; set; } = null!;
        public DbSet<AttestationType> AttestationTypes { get; set; } = null!;
        public DbSet<EducationalForm> EducationalForms { get; set; } = null!;
        public DbSet<Group> Groups { get; set; } = null!;
        public DbSet<Lesson> Lessons { get; set; } = null!;
        public DbSet<LessonForm> LessonForms { get; set; } = null!;
        public DbSet<LessonType> LessonTypes { get; set; } = null!;
        public DbSet<Mark> Marks { get; set; } = null!;
        public DbSet<Schedule> Schedules { get; set; } = null!;
        public DbSet<Specialization> Specializations { get; set; } = null!;
        public DbSet<Student> Students { get; set; } = null!;
        public DbSet<Subject> Subjects { get; set; } = null!;
        public DbSet<Teacher> Teachers { get; set; } = null!;
        public DbSet<Teaching> Teachings { get; set; } = null!;
        public Context(DbContextOptions<Context> options) : base(options)
        {
            Database.EnsureCreated();
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

        }
    }
}