using Autofac;
using Business.Abstract;
using Business.Concrete;
using DataAccess.Abstract;
using DataAccess.Concrete.EntityFramework;
using System.Reflection;
using Module = Autofac.Module;

namespace Business.DependencyResolvers.Autofac
{
    public class AutofacBusinessModule : Module
    {
        protected override void Load(ContainerBuilder builder)
        {

            //builder.RegisterGeneric(typeof(GenericRepository<>)).As(typeof(IGenericRepository<>)).InstancePerLifetimeScope();
            //builder.RegisterGeneric(typeof(GenericService<>)).As(typeof(IGenericService<>)).InstancePerLifetimeScope();
            builder.RegisterType<EfCompanyDal>().As<ICompanyDal>();
            builder.RegisterType<EfProductDal>().As<IProductDal>();
            builder.RegisterType<EfOrderDal>().As<IOrderDal>();

            builder.RegisterType<CompanyManager>().As<ICompanyService>();
            builder.RegisterType<ProductManager>().As<IProductService>();
            builder.RegisterType<OrderManager>().As<IOrderService>();

            var repository = Assembly.GetAssembly(typeof(AppContext));
            var api = Assembly.GetExecutingAssembly();


            builder.RegisterAssemblyTypes(repository, api).Where(x => x.Name.EndsWith("Repository")).AsImplementedInterfaces().InstancePerLifetimeScope();

            builder.RegisterAssemblyTypes(repository, api).Where(x => x.Name.EndsWith("Service")).AsImplementedInterfaces().InstancePerLifetimeScope();



        }
    }
}
