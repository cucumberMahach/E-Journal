using E_Journal.API.Controllers.Abstract;
using E_Journal.Domain.Model.Entities;
using E_Journal.Infrastructure;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace E_Journal.API.Controllers.Entities
{

    [ApiController]
    [Route("[controller]")]
    public class AttendController : CRUDController<Attend>
    {
        public AttendController(DBContext dbContext) : base(dbContext) {
        }

        [HttpPut("createAttendsByLessons")]
        public IActionResult CreateAttends()
        {
            var mark = _repository.DBContext.Marks.FirstOrDefault(i => i.Code == '+');
            if (mark == null)
            {
                return StatusCode(400, "Mark not found");
            }

            var lessons = _repository.DBContext.Lessons.Include(p => p.Teaching).ThenInclude(p => p.Group).Include(p => p.Attendance).ThenInclude(p => p.Student).ToList();
            
            if (lessons.Count == 0)
            {
                return StatusCode(400, "Lessons is empty");
            }

            int attendsCount = 0;
            int lessonsCount = 0;

            foreach (var l in lessons) {
                var group = l.Teaching.Group;
                if (group == null)
                    continue;
                var students = _repository.DBContext.Students.Where(p => p.Group == group).ToList();
                foreach (var student in students)
                {
                    if (l.Attendance.Where(p => p.Student.Id == student.Id).Any())
                        continue;
                    Attend attend = new Attend();
                    attend.Student = student;
                    attend.Mark = mark;
                    attend.Id = Guid.NewGuid();
                    l.Attendance.Add(attend);
                    _repository.DBContext.Attends.Add(attend);
                    attendsCount++;
                }
                lessonsCount++;
            }

            _repository.DBContext.SaveChanges();
            return StatusCode(200, "Proceed " + lessonsCount + " lessons, added " + attendsCount + " attends");
        }
    }
}
