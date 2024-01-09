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

            //-
            var atType1 = new AttestationType { Name = "зачет" };
            var atType2 = new AttestationType { Name = "экзамен" };

            //-
            var edForm1 = new EducationalForm { Name = "заочная" };
            var edForm2 = new EducationalForm { Name = "очная" };

            //-
            var lesType1 = new LessonType { Name = "практическое занятие" };
            var lesType2 = new LessonType { Name = "лекция"};

            //-
            var mark1 = new Mark { Code = '+', Description = "присутствие (без оценки)" };
            var mark2 = new Mark { Code = 'Н', Description = "отсутствие" };
            var mark3 = new Mark { Code = '2', Description = "неудовлетворительно" };
            var mark4 = new Mark { Code = '3', Description = "удовлетворительно" };
            var mark5 = new Mark { Code = '4', Description = "хорошо" };
            var mark6 = new Mark { Code = '5', Description = "отлично" };

            //-
            var schedule1 = new Schedule { Number = 1, StartTime = new TimeOnly(8, 00, 00), EndTime = new TimeOnly(9, 35, 00) };
            var schedule2 = new Schedule { Number = 2, StartTime = new TimeOnly(10, 00, 00), EndTime = new TimeOnly(11, 35, 00) };

            //-
            var spec1 = new Specialization { Code = "46.04.01", Name = "История" };
            var spec2 = new Specialization { Code = "09.03.01", Name = "Информатика и вычислительная техника" };
            var spec3 = new Specialization { Code = "01.03.02", Name = "Прикладная математика и информатика" };

            //-
            var sub1 = new Subject { Name = "высшая математика" };
            var sub2 = new Subject { Name = "английский язык" };
            var sub3 = new Subject { Name = "физическая культура" };
            var sub4 = new Subject { Name = "история" };

            //-
            var teacher1 = new Teacher { FirstName = "Анна", LastName = "Сидорова", Patronymic = "Ивановна", Post = "старший преподаватель" };
            var teacher2 = new Teacher { FirstName = "Петр", LastName = "Петров", Patronymic = "Петрович", Post = "старший преподаватель" };
            var teacher3 = new Teacher { FirstName = "Иван", LastName = "Иванов", Patronymic = "Иванович", Post = "зав. кафедрой" };

            //-
            var group2 = new Group { Number = "ОПАСУ-2", EducationalForm = edForm1, Specialization = spec3 };
            var group1 = new Group { Number = "ОПАСУ-1", EducationalForm = edForm2, Specialization = spec2 };

            var stud1 = new Student { FirstName = "Максим", LastName = "Клещенок", Patronymic = "Сергеевич", BirthDate = new DateOnly(2000, 07, 01), Group = group2, IdCard = 100006, IsBoss = false };
            var stud2 = new Student { FirstName = "Олег", LastName = "Иванов", Patronymic = "Петрович", BirthDate = new DateOnly(2000, 06, 01), Group = group2, IdCard = 100005, IsBoss = false };
            var stud3 = new Student { FirstName = "Тарас", LastName = "Брус", Patronymic = "Вадимович", BirthDate = new DateOnly(2000, 05, 01), Group = group2, IdCard = 100004, IsBoss = true };
            var stud4 = new Student { FirstName = "Алена", LastName = "Филиппова", Patronymic = "Олеговна", BirthDate = new DateOnly(2000, 04, 01), Group = group1, IdCard = 100003, IsBoss = true };
            var stud5 = new Student { FirstName = "Ксения", LastName = "Соболева", Patronymic = "Сергеевна", BirthDate = new DateOnly(2000, 03, 01), Group = group1, IdCard = 100002, IsBoss = false };
            var stud6 = new Student { FirstName = "Александр", LastName = "Махоткин", Patronymic = "Павлович", BirthDate = new DateOnly(2000, 02, 01), Group = group1, IdCard = 100001, IsBoss = false };
            var stud7 = new Student { FirstName = "Екатерина", LastName = "Иванова", Patronymic = "Сергеевна", BirthDate = new DateOnly(2000, 01, 01), Group = group1, IdCard = 100000, IsBoss = false };

            //-
            var lesForm1 = new LessonForm { LessonType = lesType1, Teacher = teacher2, Hours = 35 };
            var lesForm2 = new LessonForm { LessonType = lesType2, Teacher = teacher1, Hours = 40 };

            //-
            var teach1 = new Teaching { Subject = sub1, Group = group1, LessonForm = lesForm1, Term = 1, TermProject = false, AttestationType = atType2 };
            var teach2 = new Teaching { Subject = sub2, Group = group1, LessonForm = lesForm1, Term = 1, TermProject = false, AttestationType = atType2 };
            var teach3 = new Teaching { Subject = sub1, Group = group1, LessonForm = lesForm2, Term = 1, TermProject = true, AttestationType = atType2 };

            //-
            var lesson1 = new Lesson { Date = new DateOnly(2023, 09, 04), Schedule = schedule2, Topic = "Матрица",  Teaching = teach3};
            var lesson2 = new Lesson { Date = new DateOnly(2023, 09, 04), Schedule = schedule2, Topic = "Комплексные числа",  Teaching = teach3};
            var lesson3 = new Lesson { Date = new DateOnly(2023, 09, 04), Schedule = schedule1, Topic = "к/п",  Teaching = teach3};
            var lesson4 = new Lesson { Date = new DateOnly(2023, 09, 04), Schedule = schedule1, Topic = "экзамен",  Teaching = teach3 };
            var lesson5 = new Lesson { Date = new DateOnly(2023, 09, 04), Schedule = schedule1, Topic = "Комплексные числа",  Teaching = teach1};
            var lesson6 = new Lesson { Date = new DateOnly(2023, 09, 04), Schedule = schedule2, Topic = "экзамен",  Teaching = teach2};
            var lesson7 = new Lesson { Date = new DateOnly(2023, 09, 04), Schedule = schedule2, Topic = "Предлоги 123",  Teaching = teach2};

            _context.Add(lesson1);
            _context.Add(lesson2);
            _context.Add(lesson3);
            _context.Add(lesson4);
            _context.Add(lesson5);
            _context.Add(lesson6);
            _context.Add(lesson7);
            _context.Add(sub3);
            _context.Add(sub4);
            _context.Add(spec1);
            _context.Add(teacher3);
            _context.Add(atType1);

            _context.Add(stud1);
            _context.Add(stud2);
            _context.Add(stud3);
            _context.Add(stud4);
            _context.Add(stud5);
            _context.Add(stud6);
            _context.Add(stud7);

            _context.Add(mark1);
            _context.Add(mark2);
            _context.Add(mark3);
            _context.Add(mark4);
            _context.Add(mark5);
            _context.Add(mark6);

            _context.SaveChanges();

            _context.ChangeTracker.Clear();
        }

        public void FreeDatabase()
        {
            _context.Database.CloseConnection();
        }

        public DBContext DBContext {
            get
            {
                return _context;
            }
        }
    }
}
