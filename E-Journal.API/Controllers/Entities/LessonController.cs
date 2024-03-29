﻿using E_Journal.API.Controllers.Abstract;
using E_Journal.Domain.Model;
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

        [HttpGet("getByStudentBossId")]
        public async Task<List<Lesson>> GetByStudentBossId(Guid bossId)
        {
            var stud = await _repository.DBContext.Students.Include(s => s.Group).FirstAsync(s => s.Id == bossId);
            if (stud == null || !stud.IsBoss || stud.Group == null)
            {
                return new List<Lesson>();
            }
            var q = await _repository.DBContext.Lessons.Include(t => t.Teaching).ThenInclude(t => t.Subject).Include(t => t.Teaching).ThenInclude(t => t.AttestationType).Include(t => t.Teaching).ThenInclude(t => t.LessonForm).ThenInclude(t => t.LessonType).Include(t => t.Teaching).ThenInclude(t => t.LessonForm).ThenInclude(t => t.Teacher).Include(t => t.Schedule).Include(t => t.Attendance).ThenInclude(t => t.Student).Include(t => t.Attendance).ThenInclude(t => t.Mark).Include(t => t.Teaching.Group).Where(t => t.Teaching.Group.Id == stud.Group.Id).ToListAsync();
            return q;
        }

        [HttpPut("updateLesson")]
        public async Task<bool> UpdateLesson(UpdateLessonParams p)
        {
            var dbLesson = _repository.DBContext.Lessons.Include(t => t.Teaching).ThenInclude(t => t.Subject).Include(t => t.Teaching).ThenInclude(t => t.AttestationType).Include(t => t.Teaching).ThenInclude(t => t.LessonForm).ThenInclude(t => t.LessonType).Include(t => t.Teaching).ThenInclude(t => t.LessonForm).ThenInclude(t => t.Teacher).Include(t => t.Schedule).Include(t => t.Attendance).ThenInclude(t => t.Student).Include(t => t.Attendance).ThenInclude(t => t.Mark).Include(t => t.Teaching.Group).Where(q => q.Id == p.LessonId).First();

            if (dbLesson == null)
                return false;

            var marks = _repository.DBContext.Marks.ToList();


            foreach(var a in dbLesson.Attendance)
            {
                a.Mark = marks.Where(q => q.Id == p.StudentsMarksIds[a.Student.Id]).First();
            }

            dbLesson.Topic = p.Topic;

            _repository.DBContext.Lessons.Entry(dbLesson).State = EntityState.Modified;
			await _repository.SaveAsync();
            return true;
		}
	}
}
