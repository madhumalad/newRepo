using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AspNetApllication
{
    public partial class Validator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cv3_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value == "abcdef")
            {
                args.IsValid = true;
            }else
            {
                args.IsValid = false;
            }
        }
    }
}