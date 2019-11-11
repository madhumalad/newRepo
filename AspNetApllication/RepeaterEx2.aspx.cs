using AspNetApllication.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AspNetApllication
{
    public partial class RepeaterEx2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateData();
            }

        }
        string connectionString = @"Data Source=PUNARVASU\SQLDEV2016;Initial Catalog=Northwind;Integrated Security=True;";
        string sql = "Select CustomerId,CompanyName,ContactName,City,Country from Customers";
        DataSet ds;
        SqlDataAdapter adapter;
        string tableName = "Customers";

        private void PopulateData()
        {
            //if (Adapter == null)
            //{
            //    adapter = new SqlDataAdapter(sql, connectionString);
            //}
            //if (ds == null) ds = new DataSet();
            //{
            //    adapter.Fill(ds, tableName);
            //    this.repeater1.DataSource = ds;
            //    repeater1.DataMember = tableName;
            //    repeater1.DataBind();
            //}
            CustomerDataAccess customerData = new CustomerDataAccess();
            var list = customerData.GetCustomers();
            repeater1.DataSource = list;
            repeater1.DataBind();
        }

        protected void rep1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string custId = e.CommandArgument.ToString();
           if( e.CommandName =="View")
            {
                Response.Redirect("CustomerDetails.aspx?ID=" + custId);
            }
        }
    }
}