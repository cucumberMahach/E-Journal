using E_Journal.API.Controllers.Abstract;
using E_Journal.Domain.Model.Entities;
using E_Journal.Infrastructure;
using Microsoft.AspNetCore.Mvc;

namespace E_Journal.API.Controllers.Entities
{

    [ApiController]
    [Route("[controller]")]
    public class TeacherController : CRUDController<Teacher>
    {
        public TeacherController(DBContext dbContext) : base(dbContext) { }
    }
}
