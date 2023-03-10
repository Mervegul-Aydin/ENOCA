using Entities.Concrete;

namespace Entities.Dto
{
    public class OrderDto : BaseEntity
    {
        public int CompanyId { get; set; }
        public int ProductId { get; set; }
    }
}
