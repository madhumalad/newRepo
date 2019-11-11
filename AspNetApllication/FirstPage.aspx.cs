using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace AspNetApllication
{
    //Partial class is class which is spread across multiple physical files.
    public partial class FirstPage :System.Web.UI.Page
    {
        //public delegat void System.EventHandler(object sender,EventArgs e)
        protected TextBox txt1;
        public void Page_Load(Object sender, EventArgs e)
        {
            if (!IsPostBack)//Checks weatther the new request or post back request
                this.txt1.Text = "enter your name";
        }
        protected override void OnInit(EventArgs e)
        {
            this.Load += new EventHandler(Page_Load);
            base.OnInit(e);
        }
        public void btn1_click(Object sender, EventArgs e)
        {
            this.txt1.Text = this.txt1.Text.ToUpper();
        }
    }
}