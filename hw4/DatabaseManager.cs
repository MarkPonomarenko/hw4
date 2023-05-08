using hw4.Data.Entities;
using System.Data;
using System.Data.SqlClient;

namespace hw4
{
    public class DatabaseManager
    {
        public static IEnumerable<Order> GetOrdersLastYearDataReader()
        {
            using var connection = new SqlConnection(hw4.DbProperties.Default.ConnectionString);
            using var command = connection.CreateCommand();
            command.CommandText = "SELECT ord_id, ord_datetime, ord_an FROM Orders WHERE ord_datetime > DATEADD(year, -1, GETDATE());";

            connection.Open();
            var reader = command.ExecuteReader();

            while (reader.HasRows)
            {
                while (reader.Read()) 
                {
                    yield return new Order
                    {
                        Id = reader.GetInt32(0),
                        Date = reader.GetDateTime(1),
                        AnalysisId = reader.GetInt32(2)
                    };
                }
                reader.NextResult();
            }
            connection.Close();
        }

        public static IEnumerable<Order> GetOrdersLastYearDataSet()
        {
            using var connection = new SqlConnection(hw4.DbProperties.Default.ConnectionString);
            using var command = connection.CreateCommand();
            DataSet orders = new DataSet();
            command.CommandText = "SELECT ord_id, ord_datetime, ord_an FROM Orders WHERE ord_datetime > DATEADD(year, -1, GETDATE());";

            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = command;
            adapter.Fill(orders);

            foreach (DataTable table in orders.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    yield return new Order()
                    { 
                        Id = (int)row["ord_id"],
                        Date = (DateTime)row["ord_datetime"],
                        AnalysisId = (int)row["ord_an"] 
                    };
                }
            }
        }

        public static async Task<int> CreateOrderAsync(Order order)
        {
            using var connection = new SqlConnection(hw4.DbProperties.Default.ConnectionString);
            using var command = connection.CreateCommand();
            command.CommandText = "INSERT INTO Orders(ord_datetime, ord_an) VALUES (@datetime, @analysis_id); SELECT SCOPE_IDENTITY();";
            command.Parameters.Add(new SqlParameter("@datetime", order.Date));
            command.Parameters.Add(new SqlParameter("@analysis_id", order.AnalysisId));

            connection.Open();
            var result = await command.ExecuteScalarAsync();
            var id = (int)(decimal)result;

            connection.Close();
            return id;
        }

        public static async Task<int> UpdateOrderAsync(Order order)
        {
            using var connection = new SqlConnection(hw4.DbProperties.Default.ConnectionString);
            using var command = connection.CreateCommand();
            command.CommandText = "UPDATE Orders SET ord_datetime = @datetime, ord_an = @analysis_id WHERE ord_id = @id;";
            command.Parameters.Add(new SqlParameter("@id", order.Id));
            command.Parameters.Add(new SqlParameter("@datetime", order.Date));
            command.Parameters.Add(new SqlParameter("@analysis_id", order.AnalysisId));

            connection.Open();
            var count = await command.ExecuteNonQueryAsync();
            connection.Close();

            return count;
        }

        public static async Task<int> DeleteOrderAsync(int orderId)
        {
            using var connection = new SqlConnection(hw4.DbProperties.Default.ConnectionString);
            using var command = connection.CreateCommand();
            command.CommandText = "DELETE FROM Orders WHERE ord_id = @id;";
            command.Parameters.Add(new SqlParameter("id", orderId));

            connection.Open();
            var count = await command.ExecuteNonQueryAsync();
            connection.Close();

            return count;
        }

        public static async Task<Order> GetLastOrderAsync()
        {
            using var connection = new SqlConnection(hw4.DbProperties.Default.ConnectionString);
            using var command = connection.CreateCommand();
            command.CommandText = "SELECT TOP 1 ord_id, ord_datetime, ord_an FROM Orders ORDER BY ord_id DESC;";

            connection.Open();
            var reader = await command.ExecuteReaderAsync();
            reader.Read();

            Order result = new Order
            {
                Id = reader.GetInt32(0),
                Date = reader.GetDateTime(1),
                AnalysisId = reader.GetInt32(2)
            };
            connection.Close();

            return result;
        }

        public static async Task<Order?> GetOrderByIdAsync(int orderId)
        {
            using var connection = new SqlConnection(hw4.DbProperties.Default.ConnectionString);
            using var command = connection.CreateCommand();
            command.CommandText = "SELECT ord_id, ord_datetime, ord_an FROM Orders WHERE ord_id = @id;";
            command.Parameters.Add(new SqlParameter("id", orderId));

            connection.Open();
            var reader = await command.ExecuteReaderAsync();
            if (!reader.Read()) return null;

            Order result = new Order
            {
                Id = reader.GetInt32(0),
                Date = reader.GetDateTime(1),
                AnalysisId = reader.GetInt32(2)
            };
            connection.Close();

            return result;
        }
    }
}
