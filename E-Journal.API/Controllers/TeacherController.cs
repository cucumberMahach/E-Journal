using E_Journal.Domain.Model;
using Microsoft.AspNetCore.Mvc;

namespace E_Journal.API.Controllers
{

    [ApiController]
    [Route("[controller]")]
    public class TeacherController : CRUDController<Teacher>
    {
    }
}
