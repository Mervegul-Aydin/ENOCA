using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Dto
{
    public class ProductDto : BaseEntity
    {
        public int CompanyId { get; set; }
        public int Stock { get; set; }
        public int Price { get; set; }
    }
}
