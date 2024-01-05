using E_Journal.Domain.Model.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace E_Journal.Domain.Model
{
	public class UpdateLessonParams
	{
		public Guid LessonId { get; set; }
		public Dictionary<Guid, Guid> StudentsMarksIds { get; set; }
		public string Topic { get; set; }
	}
}
