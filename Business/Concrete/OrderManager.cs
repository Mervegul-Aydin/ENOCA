using Business.Abstract;
using Business.Constants;
using Core.Results;
using DataAccess.Abstract;
using Entities.Concrete;
using Entities.Dto;

namespace Business.Concrete
{
    public class OrderManager : IOrderService
    {
        IOrderDal _orderDal;
        ICompanyDal _companyDal;
        IProductDal _productDal;

        public OrderManager(IOrderDal orderDal, ICompanyDal companyDal,IProductDal productDal)
        {
            _orderDal = orderDal;
            _companyDal = companyDal;
            _productDal = productDal;
        }

        public IResult Add(OrderDto orderdto)
        {
            var company = _companyDal.GetById(orderdto.CompanyId);
            var product = _productDal.GetById(orderdto.ProductId);
            if (company.IsActive != false)
            {
                if (Convert.ToDateTime(company.OrderStartTime) <= DateTime.Now && DateTime.Now <= Convert.ToDateTime(company.OrderFinishTime))
                {
                    Order order = new Order()
                    {
                        Name = orderdto.Name,
                        OrderDate = DateTime.Now,
                        ProductId = orderdto.ProductId,
                        CompanyId = orderdto.CompanyId,
                        Company=company,
                        Product= product
                    };
                    _orderDal.Add(order);
                    return new SuccessDataResult<Order>(order, Messages.AddedSuccessMessage);
                }
                return new ErrorResult(Messages.ErrorOrderMessage);
            }
            return new ErrorResult(Messages.ErrorIsActiveMessage);
        }
    }
}
