using Core.Results;
using Entities.Dto;

namespace Business.Abstract
{
    public interface IProductService
    {
        IResult Add(ProductDto productDto);
    }
}
