using Business.Abstract;
using Business.Constants;
using Core.Results;
using DataAccess.Abstract;
using DataAccess.Concrete.EntityFramework;
using Entities.Concrete;
using Entities.Dto;

namespace Business.Concrete
{
    public class CompanyManager : ICompanyService
    {
        ICompanyDal _companyDal;

        public CompanyManager(ICompanyDal companyDal)
        {
            _companyDal = companyDal;
        }

        public IResult Add(CompanyDto companyDto)
        {
            Company company = new Company()
            {
                Name = companyDto.Name,
                IsActive = companyDto.IsActive,
                OrderStartTime = companyDto.OrderStartTime,
                OrderFinishTime = companyDto.OrderFinishTime,
            };

            _companyDal.Add(company);
            return new SuccessResult(Messages.AddedSuccessMessage);
        }

        public IDataResult<List<Company>> GetAll()
        {
            return new SuccessDataResult<List<Company>>(_companyDal.GetAll(), Messages.SuccessGetAllMessage);
        }

        public Company GetById(int id)
        {
            return _companyDal.GetById(id);
        }


        public IDataResult<Company> Update(int id, bool isActive, string orderStartTime, string orderFinishTime)
        {
            var res = _companyDal.GetById(id);
            if (res != null)
            {
                res.IsActive = isActive;
                res.OrderStartTime = orderStartTime == null ? res.OrderStartTime : orderStartTime;
                res.OrderFinishTime = orderFinishTime == null ? res.OrderFinishTime : orderFinishTime;
                _companyDal.Update(res);
                return new SuccessDataResult<Company>(res, Messages.UpdatedSuccessMessage);
            }
            return new ErrorDataResult<Company>(Messages.UpdatedErrorMessage);
        }
    }
}
