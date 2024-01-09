using E_Journal.API.Controllers.Entities;
using E_Journal.Domain.Model;
using E_Journal.Domain.Model.Entities;
using E_Journal.Infrastructure.Repository;
using Microsoft.AspNetCore.Mvc;

namespace E_Journal.Test
{
    public class Test
    {
        [Fact]
        public void VoidTest()
        {
            var testHelper = new TestHelper();
            testHelper.FreeDatabase();
            Assert.Equal(1, 1);
        }

        /*[Fact]
        public void TestAdd()
        {
            var testHelper = new TestHelper();
            var studentRepository = testHelper.StudentRepository;

            var student = new Student
            {
                LastName = "Петров",
                FirstName = "Петр",
                Patronymic = "Петрович",
                BirthDate = new DateOnly(2001, 6, 10),
                IdCard = 100001,
                IsBoss = false
            };

            studentRepository.CreateAsync(student).Wait();
            studentRepository.DBContext.ChangeTracker.Clear();

            Assert.True(studentRepository.GetItemsAsync().Result.Count == 2);
        }*/

        [Fact]
        public void TestStudentGetByCardId()
        {
            var testHelper = new TestHelper();

            var controller = new StudentController(testHelper.DBContext);
            var student = controller.GetByCardId(100000).Result;

            testHelper.FreeDatabase();
            Assert.NotNull(student);
            Assert.Equal("Иванова", student.LastName);
        }

        [Fact]
        public void TestCreateAttends()
        {
            var testHelper = new TestHelper();

            var controller = new AttendController(testHelper.DBContext);
            var attends = (ObjectResult)controller.CreateAttends();
            
            testHelper.FreeDatabase();
            Assert.Equal(200, attends.StatusCode);
            Assert.NotNull(attends.Value);
            Assert.StartsWith("Proceed 7 lessons", attends.Value.ToString());
        }


        [Fact]
        public void TestLessonGetByStudentId()
        {
            var testHelper = new TestHelper();

            var controller = new AttendController(testHelper.DBContext);
            controller.CreateAttends();

            var studentController = new StudentController(testHelper.DBContext);
            var studentByCardId = studentController.GetByCardId(100000).Result;

            Assert.NotNull(studentByCardId);

            var lessonController = new LessonController(testHelper.DBContext);
            var lessons = lessonController.GetByStudentId(studentByCardId.Id).Result;

            Assert.NotNull(lessons);
            Assert.Equal(7, lessons.Count);
        }

        [Fact]
        public void TestTeacherGetByFIO()
        {
            var testHelper = new TestHelper();

            var controller = new TeacherController(testHelper.DBContext);
            var teacher = controller.GetByFIO("Петр", "Петров", "Петрович").Result;

            Assert.NotNull(teacher);

            Assert.Equal("старший преподаватель", teacher.Post);
        }

        
        [Fact]
        public void TestLessonGetByTeacherId()
        {
            var testHelper = new TestHelper();

            var controller = new AttendController(testHelper.DBContext);
            controller.CreateAttends();

            var teacherController = new TeacherController(testHelper.DBContext);
            var teacherByFIO = teacherController.GetByFIO("Петр", "Петров", "Петрович").Result;

            Assert.NotNull(teacherByFIO);

            var lessonController = new LessonController(testHelper.DBContext);
            var lessons = lessonController.GetByTeacherId(teacherByFIO.Id).Result;

            Assert.NotNull(lessons);
            Assert.Equal(3, lessons.Count);
        }

        [Fact]
        public void TestLessonGetByStudentBossId()
        {
            var testHelper = new TestHelper();

            var controller = new AttendController(testHelper.DBContext);
            controller.CreateAttends();

            var studentController = new StudentController(testHelper.DBContext);
            var studentByCardId = studentController.GetByCardId(100003).Result;

            Assert.NotNull(studentByCardId);

            var lessonController = new LessonController(testHelper.DBContext);
            var lessons = lessonController.GetByStudentBossId(studentByCardId.Id).Result;

            Assert.NotNull(lessons);
            Assert.Equal(7, lessons.Count);
        }

        [Fact]
        public void TestUpdateLesson()
        {
            var testHelper = new TestHelper();

            var controller = new AttendController(testHelper.DBContext);
            controller.CreateAttends();

            var teacherController = new TeacherController(testHelper.DBContext);
            var teacherByFIO = teacherController.GetByFIO("Петр", "Петров", "Петрович").Result;

            Assert.NotNull(teacherByFIO);

            var lessonController = new LessonController(testHelper.DBContext);
            var lessons = lessonController.GetByTeacherId(teacherByFIO.Id).Result;

            Assert.NotNull(lessons);
            Assert.NotEmpty(lessons);
            var lesson = lessons.Where(p => p.Topic == "Комплексные числа").First();
            Assert.NotNull(lesson);

            var marks = testHelper.DBContext.Marks.ToList();
            Assert.NotNull(marks);
            Assert.NotEmpty(marks);
            Assert.Equal(6, marks.Count);
            var mark = marks.Where(p => p.Code == '5').First();
            Assert.NotNull(mark);

            UpdateLessonParams p = new UpdateLessonParams();
            p.LessonId = lesson.Id;
            p.StudentsMarksIds = new Dictionary<Guid, Guid>();
            foreach (var q in lesson.Attendance)
            {
                p.StudentsMarksIds.Add(q.Student.Id, mark.Id);
            }
            p.Topic = "Комплексные числа (тест)";

            Assert.True(lessonController.UpdateLesson(p).Result);

            // Проверка UpdateLesson

            var updatedLessons = lessonController.GetByTeacherId(teacherByFIO.Id).Result;

            Assert.NotNull(updatedLessons);
            Assert.NotEmpty(updatedLessons);
            var updatedLesson = updatedLessons.Where(p => p.Topic == "Комплексные числа (тест)").First();
            Assert.NotNull(updatedLesson);

            Assert.True(updatedLesson.Attendance.All(p => p.Mark.Code == '5'));
        }
    }
}