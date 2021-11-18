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

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                SqlFarrowing.Insert();
                lblError.Text = "Successful Insert";
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
                lblError.Text = "Successful Edit";
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
            txtWeight.Text = GridView1.SelectedRow.Cells[3].Text.ToString();
            string date = GridView1.SelectedRow.Cells[4].Text.ToString();
            Calendar1.SelectedDate = Convert.ToDateTime(date);
            txtLive.Text = GridView1.SelectedRow.Cells[5].Text.ToString();
            txtStill.Text = GridView1.SelectedRow.Cells[6].Text.ToString();
            txtWeak.Text = GridView1.SelectedRow.Cells[7].Text.ToString();
            txtMummified.Text = GridView1.SelectedRow.Cells[8].Text.ToString();
        }
    }
    }
