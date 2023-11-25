using E_Journal.API.Controllers.Abstract;
using E_Journal.Domain.Model.Entities;
using E_Journal.Infrastructure;
using Microsoft.AspNetCore.Mvc;

namespace E_Journal.API.Controllers.Entities
{

    [ApiController]
    [Route("[controller]")]
    public class LessonController : CRUDController<Lesson>
    {
        public LessonController(DBContext dbContext) : base(dbContext) { }
    }
}
