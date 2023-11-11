using E_Journal.Domain.Model.Entities;
using E_Journal.Infrastructure;
using E_Journal.Infrastructure.Repository;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace E_Journal.API.Controllers.Abstract
{
    [ApiController]
    public class CRUDController<T> : ControllerBase where T : BaseEntity
    {
        protected readonly BaseRepository<T> _repository;

        public CRUDController(DBContext dbContext)
        {
            _repository = new BaseRepository<T>(dbContext);
        }

        [HttpGet("getByID")]
        public async Task<T?> GetById(Guid id)
        {
            return await _repository.GetItem(id);
        }

        [HttpGet("getAll")]
        public async Task<List<T>> GetAll()
        {
            return await _repository.GetItems();
        }

        [HttpPost("create")]
        public async Task<T> Create(T item)
        {
            var createdEntity = await _repository.Create(item);
            await _repository.Save();
            return createdEntity;
        }
    }
}
