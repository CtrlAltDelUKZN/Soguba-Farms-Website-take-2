using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Soguba_Farms_Website_take_2
{
    public partial class Vaccinations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {

                Response.Redirect("Default.aspx");
            }
            if (Session["Pass"].ToString() == "Staff")
            {
                Response.Redirect("Notifications.aspx");
            }

        }
    }
    }
