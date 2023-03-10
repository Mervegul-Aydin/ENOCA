using System.ComponentModel.DataAnnotations.Schema;

namespace Entities.Concrete
{
    public class Order: BaseEntity
    {
        public int? CompanyId { get; set; }
        public int? ProductId { get; set; }
        public DateTime OrderDate { get; set; }

        [ForeignKey("ProductId")]
        public Product? Product { get; set; }
        [ForeignKey("CompanyId")]
        public Company? Company { get; set; }
    }
}
