using hw4.Data.Entities;

namespace hw4
{
    internal class Program
    {
        static async Task Main(string[] args)
        {
            Console.WriteLine("Get Orders for last year using DataReader:\n");
            foreach(Order order in DatabaseManager.GetOrdersLastYearDataReader())
            {
                Console.WriteLine(order);
            }
            Console.WriteLine("\nGet Orders for last year using DataAdapter:\n");
            foreach (Order order in DatabaseManager.GetOrdersLastYearDataSet())
            {
                Console.WriteLine(order);
            }

            Console.WriteLine("\nCreate new order with today's datetime:\n");
            await DatabaseManager.CreateOrderAsync(new Order() { Date = DateTime.Now, AnalysisId = 1 });
            Order newOrder = await DatabaseManager.GetLastOrderAsync();
            Console.WriteLine(newOrder);
            Console.WriteLine("\nUpdate created order to increase its year by 1\n");
            newOrder.Date = newOrder.Date.Value.AddYears(1);
            await DatabaseManager.UpdateOrderAsync(newOrder);
            Console.WriteLine(await DatabaseManager.GetOrderByIdAsync(newOrder.Id));
            Console.WriteLine("\nDelete created order\n");
            await DatabaseManager.DeleteOrderAsync(newOrder.Id);
            Order? result = await DatabaseManager.GetOrderByIdAsync(newOrder.Id);
            Console.WriteLine(result == null ? $"Order not found by Id={newOrder.Id}" : result);

        }
    }
}