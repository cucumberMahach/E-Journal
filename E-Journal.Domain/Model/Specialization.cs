using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace E_Journal.Domain.Model
{
    public class Specialization : BaseEntity
    {
        public string Code { get; set; } = null!;
        public string Name { get; set; } = null!;
    }
}
