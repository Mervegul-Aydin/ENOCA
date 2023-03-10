﻿using DataAccess.Abstract;
using Entities.Concrete;
using Microsoft.EntityFrameworkCore;

namespace DataAccess.Concrete.EntityFramework
{
    public class EfProductDal : IProductDal
    {
        public void Add(Product product)
        {
            using (Context context = new Context())    // c# a özel yapı. Idisposable pattern implementation of c#
            {
                var addedEntity = context.Entry(product); // veri kaynağında gönderdiğim datayla bir tane nesneyi eşleştir. vt ilişkilendirir. Referans yakaladı
                addedEntity.State = EntityState.Added; // peki şimdi bunu ne yapayım ? -ekle / o aslında eklenecek bir nesne
                context.SaveChanges(); // ekledim.
            }
        }

        public Product GetById(int id)
        {
            using (Context context = new Context())
            {
                return context.Set<Product>().Find(id);

            }
        }
    }
}
