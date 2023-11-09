using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace E_Journal.Domain.Model
{
    public class Lesson
    {
        public Guid Id { get; set; }
        public DateOnly Date { get; set; }
        public Schedule Schedule { get; set; } = null!;
        public string? Topic { get; set; }
        public Teaching Teaching { get; set; } = null!;
        public List<Attend> Attendance { get; set; } = null!;
    }
}
