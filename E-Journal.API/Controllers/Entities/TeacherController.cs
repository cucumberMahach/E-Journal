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
        public async Task<Teacher?> GetByFIO(string firstName, string lastName, string? patronymic)
        {
            return await _repository.DBContext.Teachers.FirstOrDefaultAsync(t => t.FirstName.ToLower() == firstName.ToLower() && t.LastName.ToLower() == lastName.ToLower() && ((t.Patronymic == null && patronymic == null) || (t.Patronymic != null && patronymic != null && t.Patronymic.ToLower() == patronymic.ToLower())));
        }
    }
}
