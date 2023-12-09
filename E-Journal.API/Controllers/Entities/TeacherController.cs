using E_Journal.API.Controllers.Abstract;
using E_Journal.Domain.Model.Entities;
using E_Journal.Infrastructure;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace E_Journal.API.Controllers.Entities
{

    [ApiController]
    [Route("[controller]")]
    public class TeacherController : CRUDController<Teacher>
    {
        public TeacherController(DBContext dbContext) : base(dbContext) { }

        [HttpGet("getByFIO")]
        public async Task<Teacher?> GetByFIO(string firstName, string lastName, string patronymic)
        {
            return await _repository.DBContext.Teachers.FirstOrDefaultAsync(t => t.FirstName == firstName && t.LastName == lastName && t.Patronymic == patronymic);
        }
    }
}
