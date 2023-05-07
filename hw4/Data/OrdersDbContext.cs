using hw4.Data.Entities;
using Microsoft.EntityFrameworkCore;

namespace hw4.Data
{
    public class OrdersDbContext : DbContext
    {
        public OrdersDbContext() { }
        public OrdersDbContext(DbContextOptions<OrdersDbContext> options) :base(options) { }

        public DbSet<Group> Groups { get; set; }
        public DbSet<Analysis> Analyses { get; set; }
        public DbSet<Order> Orders { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if(!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("data source=DESKTOP-3KOO54P\\SQLEXPRESS;initial catalog=chi_hw3;Trusted_Connection=True;multipleactiveresultsets=True;TrustServerCertificate=True;");
            }
        }
    }
}
