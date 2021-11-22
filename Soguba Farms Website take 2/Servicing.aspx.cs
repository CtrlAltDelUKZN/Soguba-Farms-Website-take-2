using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Soguba_Farms_Website_take_2
{
    public partial class Servicing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Calendar1.SelectedDate = DateTime.Today;
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