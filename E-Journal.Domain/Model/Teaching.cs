using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace E_Journal.Domain.Model
{
    public class Teaching
    {
        public Guid Id { get; set; }
        public Subject Subject { get; set; } = null!;
        public Group Group { get; set; } = null!;
        public LessonType LessonType { get; set; } = null!;
        public AttestationType AttestationType { get; set; } = null!;
        public int Term { get; set; }
        public bool TermProject { get; set; }
        public LessonForm LessonForm { get; set; } = null!;
    }
}
