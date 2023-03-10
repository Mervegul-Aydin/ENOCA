using DataAccess.Abstract;
using Entities.Concrete;
using Microsoft.EntityFrameworkCore;

namespace DataAccess.Concrete.EntityFramework
{
    public class EfOrderDal : IOrderDal
    {
        public void Add(Order order)
        {
            using (Context context = new Context())    // c# a özel yapı. Idisposable pattern implementation of c#
            {
                var addedEntity = context.Entry(order); // veri kaynağında gönderdiğim datayla bir tane nesneyi eşleştir. vt ilişkilendirir. Referans yakaladı
                addedEntity.State = EntityState.Added; // peki şimdi bunu ne yapayım ? -ekle / o aslında eklenecek bir nesne
                context.SaveChanges(); // ekledim.
            }

        }

    }
}
