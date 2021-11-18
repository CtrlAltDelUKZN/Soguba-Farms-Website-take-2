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

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                SqlFarrowing.Insert();
                //SqlNotifications.Insert();
            }
            catch (Exception)
            {

                lblError.Text = "Insert Error. Check you entered all the info correctly";
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            try
            {
                SqlFarrowing.Update();
            }
            catch (Exception)
            {
                lblError.Text = "Update Error. Check you entered all the info correctly";
                //throw;
            }
        }

        protected void ddlLitID_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblFarrowID.Text = GridView1.SelectedRow.Cells[1].Text.ToString();
        }
    }
}