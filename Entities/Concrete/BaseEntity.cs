using System.ComponentModel.DataAnnotations;

namespace Entities.Concrete
{
    public abstract class BaseEntity
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
    }
}
