using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AspNetApllication
{
    public partial class StateManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Application.Lock();
            int counter = Convert.ToInt32(Application["counter"]);
            counter++;
            lblApplication.Text = counter.ToString();
            Application["counter"] = counter;
            Application.UnLock();



            counter = Convert.ToInt32(Session["counter"]);
            counter++;
            lblSession.Text = counter.ToString();
            Session["counter"] = counter;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            System.Web.HttpCookie cookie = new HttpCookie(
            name: txtName.Text,
            value: txtValue.Text);
            //Make a persistant cookie by setting the expires property
            //cookies.Expires=DateTime.Now.AddHours(1);
            Response.Cookies.Add(cookie);
            lblMessage.Text = "WOW Success in Saving Cookie";
            lblMessage.BackColor = Color.Green;
            lblMessage.ForeColor = Color.White;
            lblMessage.Font.Size = new FontUnit(20.0);


        }

        protected void btnRetrieve_Click(object sender, EventArgs e)
        {
            StringBuilder bldr = new StringBuilder();
            bldr.Append("<h3>Cookies are:</h3>")
                .Append("<ul>");
            foreach (string key in Request.Cookies)
            {
                bldr.AppendFormat("<li><b>{0}</b>:{1}</li>",
                key, Request.Cookies[key].Value);

            }
            bldr.Append("</ul>");
            lblMessage.BackColor = Color.White;
            lblMessage.ForeColor = Color.Black;
            lblMessage.Text = bldr.ToString();
        }
    }
}