using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace E_Journal.Domain.Model.Entities
{
    public class Teaching : BaseEntity
    {
        public Subject Subject { get; set; } = null!;
        public Group Group { get; set; } = null!;
        public AttestationType AttestationType { get; set; } = null!;
        public int Term { get; set; }
        public bool TermProject { get; set; }
        public LessonForm LessonForm { get; set; } = null!;
    }
}
