using Core.Results;
using Entities.Concrete;
using Entities.Dto;

namespace Business.Abstract
{
    public interface ICompanyService
    {
        IResult Add(CompanyDto companyDto);
        Company GetById(int id);
        IDataResult<Company> Update(int id, bool isActive, string orderStartTime, string orderFinishTime);
        IDataResult<List<Company>> GetAll();

    }
}
