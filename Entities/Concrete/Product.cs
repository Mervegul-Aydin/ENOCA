using System.ComponentModel.DataAnnotations.Schema;

namespace Entities.Concrete
{
    public class Product :BaseEntity
    {
        public int? CompanyId { get; set; }
        public int Stock { get; set; }
        public int Price { get; set; }
        [ForeignKey("CompanyId")]
        public Company? Company { get; set; }
    }
}
