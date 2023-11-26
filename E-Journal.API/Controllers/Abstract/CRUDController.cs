using E_Journal.Domain.Model.Entities;
using E_Journal.Infrastructure;
using E_Journal.Infrastructure.Repository;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace E_Journal.API.Controllers.Abstract
{
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
            return await _repository.GetItemAsync(id);
        }

        [HttpGet("getAll")]
        public async Task<List<T>> GetAll()
        {
            return await _repository.GetItemsAsync();
        }

        // POST, т.к. повторный вызов одного и того же метода POST может иметь различные эффекты
        // https://developer.mozilla.org/ru/docs/Web/HTTP/Methods/POST
        [HttpPost("create")]
        public virtual async Task<T> Create(T item)
        {
            var createdEntity = await _repository.CreateAsync(item);
            await _repository.SaveAsync();
            return createdEntity;
        }

        // PUT, т.к. единичный и множественные вызовы этого метода, с идентичным набором данных, будут иметь тот же результат выполнения
        // https://developer.mozilla.org/ru/docs/Web/HTTP/Methods/PUT
        [HttpPut("update")]
        public virtual async Task<bool> Update(T item)
        {
            var result = await _repository.UpdateAsync(item);
            await _repository.SaveAsync();
            return result;
        }

        [HttpDelete("delete")]
        public async Task<bool> Delete(Guid id)
        {
            var result = await _repository.DeleteAsync(id);
            await _repository.SaveAsync();
            return result;
        }
    }
}
