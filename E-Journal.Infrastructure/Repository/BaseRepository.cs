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

        public async Task<List<T>> GetItemsAsync()
        {
            return await _dbContext.Set<T>().ToListAsync();
        }

        public async Task<T?> GetItemAsync(Guid id)
        {
            return await _dbContext.FindAsync<T>(id);
        }

        public async Task<T> CreateAsync(T item)
        {
            if (item.Id == Guid.Empty)
            {
                item.Id = Guid.NewGuid();
            }
            var entry = await _dbContext.AddAsync(item);
            return entry.Entity;
        }

        public async Task<bool> UpdateAsync(T item)
        {
            T? i = await _dbContext.FindAsync<T>(item.Id);
            if (i != null)
            {
                _dbContext.Entry(i).CurrentValues.SetValues(item);
                return true;
            }
            else
            {
                return false;
            }
        }

        public async Task<bool> DeleteAsync(Guid id)
        {
            T? i = await _dbContext.FindAsync<T>(id);
            if (i != null)
            {
                _dbContext.Remove(i);
                return true;
            }
            else
            {
                return false;
            }
        }

        public async Task SaveAsync()
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
