using E_Journal.API.Controllers.Abstract;
using E_Journal.Domain.Model.Entities;
using E_Journal.Infrastructure;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace E_Journal.API.Controllers.Entities
{

    [ApiController]
    [Route("[controller]")]
    public class StudentController : CRUDController<Student>
    {
        public StudentController(DBContext dbContext) : base(dbContext) { }

        [HttpGet("getByCardId")]
        public async Task<Student?> GetByCardId(int cardId)
        {
            return await _repository.DBContext.Students.Include(t => t.Group).ThenInclude(t => t.Specialization).Include(t => t.Group).ThenInclude(t => t.EducationalForm).FirstOrDefaultAsync(t => t.IdCard == cardId);
        }
    }
}
