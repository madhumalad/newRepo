using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AspNetApllication
{
    public partial class WebControls1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<string> interestList = new List<string>

            {
                "Art","Atomation","Dancing","Technology","Singing","fashion","Science"
            };
            //IsPostBack==>checks weather request is new or postback (submit) request
            if (!IsPostBack)
            {
                //chkInterests.DataSource = interestList;
                //chkInterests.DataBind();
                //altrnate way of databinding
                for (int i= 0; i<interestList.Count;i++ )
                {
                    chkInterests.Items.Add(interestList[i]);
                }
            }
        }
        protected void btnSave_Click(object sender,EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<session class='alert-info'>");
            sb.AppendFormat("Hi,<b>{0}</b>!<br/>", txtName.Text)
                .Append("Welcome to our site. you are located in")
                .AppendFormat("<strong>{0}</strong>", ddlLocation.SelectedItem.Text.ToString())
                .AppendFormat("<address>{0}</Address>", txtAddress.Text)
                .Append("<br/> Your Interest are:")
                .Append("<ul>");
            foreach (ListItem item in chkInterests.Items)
            {
                if (item.Selected)
                    sb.AppendFormat("<li>{0}</li>", item.Text);

            }
            sb.Append("<ul>");
            sb.Append("</section>");
           Literal1.Text = sb.ToString();
        }
    }
}