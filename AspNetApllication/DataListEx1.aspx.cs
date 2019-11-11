using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AspNetApllication.Models
{


    public partial class DataListEx1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateData();
            }
        }
        private void PopulateData()
        {
            CustomerDataAccess dataAccess = new CustomerDataAccess();
            var list = dataAccess.GetCustomers();
            dataList1.DataSource = list;
            dataList1.DataBind();
        }




        protected void dataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string custId = e.CommandArgument.ToString();
            if (e.CommandName == "view")
            {
                Response.Redirect("CustomerDetails.aspx?ID=" + custId);
            }



        }



        protected void dataList1_EditCommand(object source, DataListCommandEventArgs e)
        {
            //enables the edit item template for the selected row
            //The selected row is the one on which the command button was clicked
            dataList1.EditItemIndex = e.Item.ItemIndex; //returns the row number
            PopulateData();
        }



        protected void dataList1_UpdateCommand(object source, DataListCommandEventArgs e)
        {
            string custId = dataList1.DataKeys[e.Item.ItemIndex].ToString();
            //De-select the EditItemTemplate by resetting the editItemIndex to -1
            string company = ((TextBox)e.Item.FindControl("txtCompany")).Text;
          
            string contact = ((TextBox)e.Item.FindControl("txtContact")).Text;
          
            string city = ((TextBox)e.Item.FindControl("txtCity")).Text;
           
            string country = ((TextBox)e.Item.FindControl("txtCountry")).Text;
          
           // Response.Write("CompanyName:" + company);
            Customer obj = new Customer
            {
                CustomerId = custId,
                CompanyName = company,
                ContactName = contact,
                City = city,
                Country = country

            };
            try
            {
                CustomerDataAccess dataAccess = new CustomerDataAccess();
                dataAccess.UpdateCustomer(obj);
            }catch(Exception ex)
            {
                throw ex;
            }
            dataList1.EditItemIndex = -1;
            PopulateData();
        }



        protected void dataList1_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            dataList1.EditItemIndex = -1;
            PopulateData();
        }



        protected void dataList1_CancelCommand(object source, DataListCommandEventArgs e)
        {
            dataList1.EditItemIndex = -1;
            PopulateData();



        }
    }
}