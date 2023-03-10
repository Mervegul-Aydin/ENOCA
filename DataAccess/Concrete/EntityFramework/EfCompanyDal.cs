using DataAccess.Abstract;
using Entities.Concrete;
using Microsoft.EntityFrameworkCore;

namespace DataAccess.Concrete.EntityFramework
{
    public class EfCompanyDal : ICompanyDal
    {
        public void Add(Company company)
        {
            using (Context context = new Context())    // c# a özel yapı. Idisposable pattern implementation of c#
            {
                var addedEntity = context.Entry(company); // veri kaynağında gönderdiğim datayla bir tane nesneyi eşleştir. vt ilişkilendirir. Referans yakaladı
                addedEntity.State = EntityState.Added; // peki şimdi bunu ne yapayım ? -ekle / o aslında eklenecek bir nesne
                context.SaveChanges(); // ekledim.
            }
        }

        public List<Company> GetAll()
        {
            using (Context context = new Context())
            {
                return context.Set<Company>().ToList();

            }
        }

        public Company GetById(int id)
        {
            using (Context context = new Context())
            {
                return context.Set<Company>().Find(id);

            }
        }

        public void Update(Company company)
        {
            using (Context context = new Context()) 
            {
                var updatedEntity = context.Entry(company); 
                updatedEntity.State = EntityState.Modified;
                context.SaveChanges();

            }
        }
    }
}
