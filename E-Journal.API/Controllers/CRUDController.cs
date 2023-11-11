using E_Journal.Domain.Model;
using E_Journal.Infrastructure;
using E_Journal.Infrastructure.Repository;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace E_Journal.API.Controllers
{
    [ApiController]
    public class CRUDController<T> : ControllerBase where T : BaseEntity
    {
        private readonly BaseRepository<T> _repository;

        public CRUDController()
        {
            var dbConnectionString = new ConfigurationBuilder().AddJsonFile("appsettings.json").Build().GetSection("ConnectionStrings")["Database"];
            _repository = new BaseRepository<T>(new Context(new DbContextOptionsBuilder<Context>().UseNpgsql(dbConnectionString).Options));
        }

        [HttpGet]
        public Task<T?> GetById(Guid id)
        {
            return _repository.GetItem(id);
        }

        [HttpPost]
        public async Task Create(T item)
        {
            await _repository.Create(item);
        }
    }
}
