using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Soguba_Farms_Website_take_2
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Username"] == null )
            {

                Response.Redirect("Default.aspx");
            }
            if (Session["Pass"].ToString()=="Staff") {
                 Response.Write("<script>alert('Acces Denied!');</script>");
                Response.Redirect("Notifications.aspx");
                
            }
        }

        protected void Pigs_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Male or Female Selection
            if (Pigs.SelectedRow.Cells[2].Text.ToString().Contains("M"))
            {
                rbSex.SelectedIndex = 1;
            }
            else
            {
                rbSex.SelectedIndex = 0;
            }
            //Breed Switch Statement

            //Calender
           string date = Pigs.SelectedRow.Cells[4].Text.ToString();
            lblDate.Text = date;
           Calendar1.SelectedDate = Convert.ToDateTime(date);

            string birthWeight = Pigs.SelectedRow.Cells[5].Text.ToString();
            txtBirthWeight.Text = birthWeight;
            string currWeight = Pigs.SelectedRow.Cells[6].Text.ToString();
            txtCurrWeight.Text = currWeight;

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Insert();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Update();
        }
    }
}