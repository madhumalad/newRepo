using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace AspNetApllication.Models
{
   internal class ProductDAO
    {
        //All Stored Procedure Names
        const string GETALL = "sp_GetAllProducts";
        const string GETDETAILS = "sp_getproductbyid";
        const string INSERT = "sp_CreateProduct";
        const string UPDATE = "sp_UpdateProduct";
        SqlConnection connection;
        // string connectionString = @"server=(local)\sqldev2016;database=northwind;integrated security=sspi";
        string connectionString = @"Data Source = PUNARVASU\SQLDEV2016;Initial Catalog = Northwind; Integrated Security = True";
        private void CreateConnection()
        {
            if (connection == null) 
                connection = new SqlConnection(connectionString);
        }
        private void OpenConnection()
        {
            if (connection == null) CreateConnection();

            if (connection.State != ConnectionState.Open) connection.Open();
           
        }
        private void CloseConnection()
        {
            if (connection != null)
                if (connection.State != ConnectionState.Closed) connection.Close();
            connection = null;
        }
        private Product CreateProductFromReader(SqlDataReader reader)
        {
            Product p = new Product();
            p.ProductId = Convert.ToInt32("0" + reader["ProductId"].ToString());
            p.ProductName = reader["ProductName"].ToString();
            p.UnitPrice = Convert.ToDecimal("0" + reader["UnitPrice"].ToString());
            p.UnitsInStock = Convert.ToInt16("0" + reader["UnitsInStock"].ToString());
            p.Discontinued = Convert.ToBoolean(reader["Discontinued"].ToString());
            p.CategoryId = Convert.ToInt32("0" + reader["CategoryId"].ToString());
            return p;
    }
        //Data Access Public Methods
        public List<Product>GetProducts(string criteria)
        {
            //Execute the Stored Procedure
            //Check argument is passed or not
            //if (string.IsNullOrEmpty(criteria))
            //{
            //    throw new ArgumentNullException(nameof(criteria), "Required Argument Missing");
            //}
            List<Product> productList = new List<Product>();
            //create command and setup parameter
            CreateConnection();
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = GETALL;
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@search", criteria);
            //open connection and execute statements with in try catch block
            SqlDataReader reader = null;
            try
            {
                OpenConnection();
                reader= command.ExecuteReader();
                while(reader.Read())
                {
                    var product = CreateProductFromReader(reader);
                    productList.Add(product);
                }
            }
            catch (SqlException sqle)
            {
                throw sqle;
            }
            catch (Exception )
            {
                throw;
            }

            finally
            {
                if (!reader.IsClosed) reader.Close();
                CloseConnection();
            }
            return productList;
        }
        public Product GetProduct(int productId)
        {
           
                
                Product product = new Product();
                //create command and setup parameter
                CreateConnection();
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandText = GETDETAILS;
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@productId", productId);
                //open connection and execute statements with in try catch block
                SqlDataReader reader = null;
                try
                {
                    OpenConnection();
                    reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                         product = CreateProductFromReader(reader);
                       // productList.Add(product);
                    }
                }
                catch (SqlException sqle)
                {
                    throw sqle;
                }
                catch (Exception)
                {
                    throw;
                }

                finally
                {
                    if (!reader.IsClosed) reader.Close();
                    CloseConnection();
                }
                return product;
            
        }
        public void CreateProduct(Product item)
        {
            if (item == null)
                throw new ArgumentException(nameof(item), "");
            else
            {
                CreateConnection();
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandText = INSERT;
                command.CommandType = CommandType.StoredProcedure;
                SqlParameter p1 = new SqlParameter();
                p1.ParameterName = "@productName";
                p1.SqlDbType = SqlDbType.VarChar;
                p1.Direction = ParameterDirection.Input;
                p1.Value = item.ProductName;
                command.Parameters.Add(p1);
                command.Parameters.AddWithValue("@UnitPrice", item.UnitPrice);
                command.Parameters.AddWithValue("@UnitsInStock", item.UnitsInStock);
                command.Parameters.AddWithValue("@Discontinued", item.Discontinued);
                command.Parameters.AddWithValue("@CategoryID", item.CategoryId);
                OpenConnection();
                SqlTransaction trans = connection.BeginTransaction();
                command.Transaction = trans;
                try
                {
                    command.ExecuteNonQuery();
                    trans.Commit();

                }catch(SqlException)
                {
                    trans.Rollback();
                    throw;

                }catch(Exception)
                {
                    trans.Rollback();
                    throw;
                }
                finally
                {
                    CloseConnection();
                }
            }
        }
        public void UpdateProduct(Product item)
        {
            if (item == null)
                throw new ArgumentException(nameof(item), "");
            else
            {
                CreateConnection();
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandText = UPDATE;
                command.CommandType = CommandType.StoredProcedure;
                SqlParameter p1 = new SqlParameter();
                p1.ParameterName = "@productName";
                p1.SqlDbType = SqlDbType.VarChar;
                p1.Direction = ParameterDirection.Input;
                p1.Value = item.ProductName;
                command.Parameters.Add(p1);
                command.Parameters.AddWithValue("@UnitPrice", item.UnitPrice);
                command.Parameters.AddWithValue("@UnitsInStock", item.UnitsInStock);
                command.Parameters.AddWithValue("@Discontinued", item.Discontinued);
                command.Parameters.AddWithValue("@CategoryID", item.CategoryId);
                command.Parameters.AddWithValue("@productId", item.ProductId);
                OpenConnection();
                SqlTransaction trans = connection.BeginTransaction();
                command.Transaction = trans;
                try
                {
                    command.ExecuteNonQuery();
                    trans.Commit();

                }
                catch (SqlException)
                {
                    trans.Rollback();
                    throw;

                }
                catch (Exception)
                {
                    trans.Rollback();
                    throw;
                }
                finally
                {
                    CloseConnection();
                }
            }
        }
    }
}
