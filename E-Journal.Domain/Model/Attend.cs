﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace E_Journal.Domain.Model
{
    public class Attend
    {
        public Guid Id { get; set; }
        public Student Student { get; set; } = null!;
        public Mark Mark { get; set; } = null!;
    }
}
