using Business.Abstract;
using Business.Constants;
using Core.Results;
using DataAccess.Abstract;
using DataAccess.Concrete.EntityFramework;
using Entities.Concrete;
using Entities.Dto;

namespace Business.Concrete
{
    public class ProductManager : IProductService
    {
        IProductDal _productDal;
        ICompanyDal _companyDal;

        public ProductManager(IProductDal productDal,ICompanyDal companyDal)
        {
            _productDal = productDal;
            _companyDal = companyDal;
        }

        public IResult Add(ProductDto productDto)
        {
            var company = _companyDal.GetById(productDto.CompanyId);
            Product product = new Product()
            {
                Name = productDto.Name,
                CompanyId = productDto.CompanyId,
                Stock = productDto.Stock,
                Price = productDto.Price,
                Company = company
            };
            _productDal.Add(product);
            return new SuccessResult(Messages.AddedSuccessMessage);
        }


    }
}
