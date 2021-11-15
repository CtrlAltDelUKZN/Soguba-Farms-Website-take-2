using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Soguba_Farms_Website_take_2
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
 
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            if ( Login1.UserName==Session["user"].ToString() && Login1.Password==Session["pass"].ToString()) {
                Session["status"] = "go";
                Response.Redirect("Pigs.aspx");
            }
        }
    }
}