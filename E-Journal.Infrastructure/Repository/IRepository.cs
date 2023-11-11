using E_Journal.Domain.Model;
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
        Task<IEnumerable<T>> GetItems(); // получение всех объектов
        Task<T?> GetItem(Guid id); // получение одного объекта по id
        Task Create(T item); // создание объекта
        void Update(T item); // обновление объекта
        void Delete(Guid id); // удаление объекта по id
        void Save();  // сохранение изменений
    }
}
