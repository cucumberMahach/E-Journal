using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace E_Journal.Domain.Model
{
    public class LessonForm
    {
        public Guid Id { get; set; }
        public LessonType LessonType { get; set; } = null!;
        public Teacher Teacher { get; set; } = null!;
        public int Hours { get; set; }
    }
}
