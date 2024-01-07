using E_Journal.Domain.Model.Entities;

namespace E_Journal.Test
{
    public class StudentTest
    {
        [Fact]
        public void VoidTest()
        {
            var testHelper = new TestHelper();
            var studentRepository = testHelper.StudentRepository;

            Assert.Equal(1, 1);
        }

        [Fact]
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
        }
    }
}