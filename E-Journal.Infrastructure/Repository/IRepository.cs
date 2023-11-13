using E_Journal.Domain.Model.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace E_Journal.Infrastructure.Repository
{
    public interface IRepository<T> : IDisposable
        where T : BaseEntity
    {
        Task<List<T>> GetItemsAsync();
        Task<T?> GetItemAsync(Guid id);
        Task<T> CreateAsync(T item);
        Task<bool> UpdateAsync(T item);
        Task<bool> DeleteAsync(Guid id);
        Task SaveAsync();
    }
}
