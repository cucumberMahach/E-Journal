using E_Journal.Domain.Model.Entities;
using E_Journal.Infrastructure;
using E_Journal.Infrastructure.Repository;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace E_Journal.Test
{
    public class TestHelper
    {
        private readonly DBContext _context;

        public TestHelper()
        {
            var contextOptions = new DbContextOptionsBuilder<DBContext>()
                .UseNpgsql(@"Server=185.26.96.101;Port=5432;Database=E-Journal_Test;Integrated Security=true;User Id=pupa;Password=6j1423dlo056d6i5h8h9430f5")
                .Options;

            _context = new DBContext(contextOptions);

            _context.Database.EnsureDeleted();
            _context.Database.EnsureCreated();

            var student = new Student
            {
                LastName = "Иванов",
                FirstName = "Иван",
                Patronymic = "Иванович",
                BirthDate = new DateOnly(1999, 5, 12),
                IdCard = 100000,
                IsBoss = false
            };

            _context.Students.Add(student);
            _context.SaveChanges();

            _context.ChangeTracker.Clear();
        }

        public BaseRepository<Student> StudentRepository {
            get
            {
                return new BaseRepository<Student>(_context);
            }
        }
    }
}
