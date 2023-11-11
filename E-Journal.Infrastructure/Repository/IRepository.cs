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
        Task<List<T>> GetItems();
        Task<T?> GetItem(Guid id);
        Task<T> Create(T item);
        Task Update(T item);
        Task Delete(Guid id);
        Task Save();
    }
}
