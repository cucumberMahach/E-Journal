using E_Journal.Domain.Model.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace E_Journal.Infrastructure.Repository
{
    public class BaseRepository<T> : IRepository<T> where T : BaseEntity
    {
        private bool _disposed = false;
        protected DBContext _dbContext;

        public BaseRepository(DBContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<List<T>> GetItems()
        {
            return await _dbContext.Set<T>().ToListAsync();
        }

        public async Task<T?> GetItem(Guid id)
        {
            return await _dbContext.FindAsync<T>(id);
        }

        public async Task<T> Create(T item)
        {
            var entry = await _dbContext.AddAsync(item);
            return entry.Entity;
        }

        public async Task Update(T item)
        {
            T? i = await _dbContext.FindAsync<T>(item.Id);
            if (i != null)
            {
                _dbContext.Entry(i).CurrentValues.SetValues(item);
            }
        }

        public async Task Delete(Guid id)
        {
            T? i = await _dbContext.FindAsync<T>(id);
            if (i != null)
            {
                _dbContext.Remove(i);
            }
        }

        public async Task Save()
        {
            await _dbContext.SaveChangesAsync();
        }

        public virtual void Dispose(bool disposing)
        {
            if (!_disposed)
            {
                if (disposing)
                {
                    _dbContext.Dispose();
                }
            }
            _disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}
