using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace E_Journal.Domain.Model.Entities
{
    public class Mark : BaseEntity
    {
        public char Code { get; set; }
        public string Description { get; set; } = null!;
    }
}
