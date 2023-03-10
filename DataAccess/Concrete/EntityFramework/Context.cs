using Entities.Concrete;
using Microsoft.EntityFrameworkCore;

namespace DataAccess.Concrete.EntityFramework
{
    public class Context:DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder) // hangi vt ile ilişkilendirdiğimizi gösterdiğimiz yer 
        {
            optionsBuilder.UseSqlServer(@"Server=.;Database=EnocaDB;Trusted_Connection=true"); // peki hangi veri tabanına bağlanıcam onun cevabı
        }

        public DbSet<Company>Companies { get; set; } // benim CCompany nesnemi db'de Companies ile eşleştir  bunu dbset ile yapıyoruz.
        public DbSet<Product> Products { get; set; }
        public DbSet<Order> Orders { get; set; }



    }
   
}
