using hw4.Data;
using hw4.Data.Entities;
using Microsoft.EntityFrameworkCore;

namespace hw4
{
    internal class DatabaseManager
    { 
        OrdersDbContext db = new OrdersDbContext();

        public IQueryable<Order> GetOrdersLastYear()
        {
            DateTime dateTime = DateTime.Now;
            return db.Orders.Where(x => x.DateTime >= dateTime.AddYears(-1));
        }

        public Task<Order?> GetOrderByIdAsync(int orderId)
        {
            return db.Orders.FirstOrDefaultAsync(x => x.Id==orderId);
        }

        public Task<Order> GetLastOrderAsync()
        {
            return db.Orders.OrderBy(x => x.Id).LastAsync();
        }

        public Task CreateOrderAsync(Order order)
        {
            db.Orders.Add(order);
            return db.SaveChangesAsync();
        }

        public Task UpdateOrderAsync(Order order) 
        {
            db.Orders.Update(order);
            return db.SaveChangesAsync();
        }

        public Task DeleteOrderAsync(Order order)
        {
            db.Orders.Remove(order);
            return db.SaveChangesAsync();
        }
    }
}
