using E_Journal.API.Controllers.Abstract;
using E_Journal.Domain.Model.Entities;
using E_Journal.Infrastructure;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace E_Journal.API.Controllers.Entities
{

    [ApiController]
    [Route("[controller]")]
    public class LessonController : CRUDController<Lesson>
    {
        public LessonController(DBContext dbContext) : base(dbContext) { }

        [HttpGet("getByStudentId")]
        public async Task<List<Lesson>> GetByStudentId(Guid studentId)
        {
            var q = await _repository.DBContext.Lessons.Include(t => t.Teaching).ThenInclude(t => t.Subject).Include(t => t.Teaching).ThenInclude(t => t.AttestationType).Include(t => t.Teaching).ThenInclude(t => t.LessonForm).ThenInclude(t => t.LessonType).Include(t => t.Teaching).ThenInclude(t => t.LessonForm).ThenInclude(t => t.Teacher).Include(t => t.Schedule).Include(t => t.Attendance).ThenInclude(t => t.Student).Include(t => t.Attendance).ThenInclude(t => t.Mark).Where(t => t.Attendance.Any(q => q.Student.Id == studentId)).ToListAsync();

            List<Lesson> list = new List<Lesson>();

            foreach (var l in q)
            {
                if (l.Attendance.Any(g => g.Student.Id == studentId))
                {
                    list.Add(l);
                    l.Attendance.RemoveAll(g => g.Student.Id != studentId);
                }
            }

            return list;
        }

		[HttpGet("getByTeacherId")]
		public async Task<List<Lesson>> GetByTeacherId(Guid teacherId)
		{
			var q = await _repository.DBContext.Lessons.Include(t => t.Teaching).ThenInclude(t => t.Subject).Include(t => t.Teaching).ThenInclude(t => t.AttestationType).Include(t => t.Teaching).ThenInclude(t => t.LessonForm).ThenInclude(t => t.LessonType).Include(t => t.Teaching).ThenInclude(t => t.LessonForm).ThenInclude(t => t.Teacher).Include(t => t.Schedule).Include(t => t.Attendance).ThenInclude(t => t.Student).Include(t => t.Attendance).ThenInclude(t => t.Mark).Include(t => t.Teaching.Group).Where(t => t.Teaching.LessonForm.Teacher.Id == teacherId).ToListAsync();
			return q;
		}
	}
}
