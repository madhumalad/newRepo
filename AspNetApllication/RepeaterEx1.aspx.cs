using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AspNetApllication
{
    public partial class RepeaterEx1 : System.Web.UI.Page
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
            if (Adapter == null)
            {
                adapter = new SqlDataAdapter(sql, connectionString);
            }
            if (ds == null) ds = new DataSet();
            {
                adapter.Fill(ds, tableName);
                this.repeater1.DataSource = ds;
                repeater1.DataMember = tableName;
                repeater1.DataBind();
            }

        }
    }
}