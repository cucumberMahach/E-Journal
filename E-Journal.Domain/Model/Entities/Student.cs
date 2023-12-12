namespace E_Journal.Domain.Model.Entities
{
    public class Student : BaseEntity
    {
        public string FirstName { get; set; } = null!;
        public string LastName { get; set; } = null!;
        public string? Patronymic { get; set; }
        public DateOnly BirthDate { get; set; }
        public Group? Group { get; set; }
        public int IdCard { get; set; }

        public bool IsBoss { get; set; } = false;
    }
}