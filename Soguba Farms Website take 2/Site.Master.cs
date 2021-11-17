using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


using System.Web.UI;
using System.Web.UI.WebControls;

namespace Soguba_Farms_Website_take_2
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LinkButton2.Visible = false;
            
            Button1.Visible = false;
            if (Session["Username"] == null)
            {
               
                LinkButton2.Visible = false;
                LinkButton3.Visible = false;
            }
            else if (Session["Pass"].ToString() != "") {
                LinkButton3.Text = " Hello " + Session["Username"].ToString();
                Button1.Visible = true;
               
            }
            
        }
       
        

        protected void Button1_Click1(object sender, EventArgs e)
        {/*
            Response.Redirect("Default.aspx");
            Session.Abandon();
            Button1.Visible = false;*/
        }
    }

}