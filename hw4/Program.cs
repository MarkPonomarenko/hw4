using hw4.Data;
using hw4.Data.Entities;

namespace hw4
{
    internal class Program
    {
        static async Task Main(string[] args)
        {
            DatabaseManager databaseManager = new DatabaseManager();
            Console.WriteLine("All orders for the last year:\n");
            foreach (Order order in databaseManager.GetOrdersLastYear()) 
            {
                Console.WriteLine(order);
            }
            Console.WriteLine("\nCreate new order with today's datetime:\n");
            await databaseManager.CreateOrderAsync(new Order { DateTime = DateTime.Now, AnalysisId = 1 });
            Order newOrder = await databaseManager.GetLastOrderAsync();
            Console.WriteLine(newOrder);
            Console.WriteLine("\nUpdate created order to increase its year by 1\n");
            newOrder.DateTime = newOrder.DateTime.Value.AddYears(1);
            await databaseManager.UpdateOrderAsync(newOrder);
            Console.WriteLine(await databaseManager.GetOrderByIdAsync(newOrder.Id));
            Console.WriteLine("\nDelete created order\n");
            await databaseManager.DeleteOrderAsync(newOrder);
            Order? result = await databaseManager.GetOrderByIdAsync(newOrder.Id);
            Console.WriteLine(result == null ? $"Order not found by Id={newOrder.Id}" : result);
        }
    }
}