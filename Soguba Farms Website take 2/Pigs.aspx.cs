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
            Calendar1.SelectedDate = DateTime.Today;
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
            switch (Pigs.SelectedRow.Cells[3].Text.ToString())
            {
                case "B35":
                    //ddlBreed.Items.IndexOf("B35");
                    break;
            }
            //Accomodation Switch

            //Status Switch

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
            try
            {
                SqlDataSource1.Insert();
                lblError.Text = "Successful Insert";
            }
            catch (Exception)
            {
                lblError.Text = "Insert Error. Check you entered all the info correctly";
                //throw;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataSource1.Update();
                lblError.Text = "Successful Edit";
            }
            catch (Exception)
            {
                lblError.Text = "Update Error. Check you entered all the info correctly";
                //throw;
            }
        }
    }
}