using AspNetApllication.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AspNetApllication
{
    public partial class ProductMaster : System.Web.UI.Page
    {
        #region Private helper Methods
        private void InitializePage()
        {
            txtSearch.Text = string.Empty;
            FetchProductData();
        }

        private void FetchProductData()
        {
            if (Cache["productList"] == null)
            {


                try
                {
                    ProductProcess process = new ProductProcess();
                    var list = process.GetProducts(txtSearch.Text);
                    Cache["productList"] = list;
                    this.gridView1.DataSource = list;
                    this.gridView1.DataBind();
                }

                catch (Exception)
                {
                    throw;
                }
            }
            else
            {
                var list = Cache["productList"] as List<Product>;
                this.gridView1.DataSource = list;
                this.gridView1.DataBind();
            }
        }
        #endregion
        #region private click handler
        protected void Page_Load(object sender, EventArgs e)
        {if(!IsPostBack)
            InitializePage();

        }

        protected void btnCreateNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductCreate.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            FetchProductData();

        }
       

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtSearch.Text = string.Empty;
            FetchProductData();
        }
        #endregion

        protected void gridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridView1.PageIndex = e.NewPageIndex;
            FetchProductData();
        }

        protected void gridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            string id = gridView1.DataKeys[e.NewEditIndex].Value.ToString();
            Response.Redirect("ProductUpdate.aspx?id=" + id);
        }
    }
}