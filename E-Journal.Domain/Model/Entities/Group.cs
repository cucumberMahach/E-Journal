using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace E_Journal.Domain.Model.Entities
{
    public class Group : BaseEntity
    {
        public string Number { get; set; } = null!;
        public Specialization Specialization { get; set; } = null!;
        public EducationalForm EducationalForm { get; set; } = null!;
    }
}
