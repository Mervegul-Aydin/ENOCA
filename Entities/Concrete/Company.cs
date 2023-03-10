using System.ComponentModel.DataAnnotations;

namespace Entities.Concrete
{
    public class Company : BaseEntity
    {
        [Required]
        public bool IsActive  { get; set; }
        [Required]
        public string OrderStartTime  { get; set; }
        [Required]
        public string OrderFinishTime  { get; set; } 
        public Product? Product { get; set; }
    }
}
