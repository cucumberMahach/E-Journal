using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace E_Journal.Domain.Model
{
    public class Mark
    {
        public Guid Id { get; set; }
        public char Code { get; set; }
        public string Description { get; set; } = null!;
    }
}
