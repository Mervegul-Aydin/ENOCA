using Core.Results;
using Entities.Concrete;
using Entities.Dto;

namespace Business.Abstract
{
    public interface IOrderService
    {
        IResult Add(OrderDto orderDto); 
    }
}
