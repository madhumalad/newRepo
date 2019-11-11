using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AspNetApllication.Models
{
    public class CustomerDataAccess
    {
        string connectionString = string.Empty;
        SqlConnection connection;
        public CustomerDataAccess()
        {
            var conStr = ConfigurationManager.ConnectionStrings["NorthwindConnectionString"].ConnectionString;
            connectionString = conStr;
            connection = new SqlConnection(connectionString);
            
        }



        public List<Customer> GetCustomers()
        {
            List<Customer> customerList = new List<Customer>();
            string sql = "Select CustomerID,CompanyName,ContactName,City,Country from Customers";
            SqlCommand command = new SqlCommand(sql, connection);
            SqlDataReader reader = null;
            try
            {
                connection.Open();
                reader = command.ExecuteReader(CommandBehavior.CloseConnection);
                while (reader.Read())
                {
                    Customer obj = new Customer
                    {
                        CustomerId = reader["CustomerID"].ToString(),
                        CompanyName = reader["CompanyName"].ToString(),
                        ContactName = reader["ContactName"].ToString(),
                        City = reader["City"].ToString(),
                        Country = reader["Country"].ToString()



                    };
                    customerList.Add(obj);
                }
            }
            catch (SqlException sqle)
            {
                throw sqle;
}
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (reader != null) if (!reader.IsClosed) reader.Close();
                if (connection.State != ConnectionState.Closed) connection.Close();
                connection = null;
            }
            return customerList;
        }
        public void UpdateCustomer(Customer item)
        {
            if(item==null)
            
                throw new ArgumentNullException(nameof(item), "value is null");
            string sql = " Update Customers Set CompanyName=@company, " +
                " ContactName=@contact, City=@city, Country=@country " +
                " Where CustomerId=@customerId ";
            SqlCommand command = new SqlCommand(sql,connection);
            command.Parameters.AddWithValue("@company", item.CompanyName);
            command.Parameters.AddWithValue("@contact", item.ContactName);
            command.Parameters.AddWithValue("@city", item.City);
            command.Parameters.AddWithValue("@country", item.Country);
            command.Parameters.AddWithValue("@customerId", item.CustomerId);
            try
            {
                connection.Open();
                command.ExecuteNonQuery();
            }
            catch (SqlException sqle)
            {
                throw sqle;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
               
                if (connection.State != ConnectionState.Closed) connection.Close();
                connection = null;
            }


        }


    }
}