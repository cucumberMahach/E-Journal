﻿namespace E_Journal.Domain.Model
{
    public class Student : BaseEntity
    {
        public string FirstName { get; set; } = null!;
        public string LastName { get; set; } = null!;
        public string? Patronymic { get; set; }
        public DateOnly BirthDate { get; set; }
        public Group? Group { get; set; }
        public int? IdCard { get; set; }
    }
}