using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Abstract
{
    public interface ICompanyDal
    {
        void Add(Company company);
        void Update(Company company);
        List<Company> GetAll();
        Company GetById(int id);

    }
}
