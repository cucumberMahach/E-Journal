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
        public async Task<Student?> GetByFIO(int cardId)
        {
            return await _repository.DBContext.Students.FirstOrDefaultAsync(t => t.IdCard == cardId);
        }
    }
}
