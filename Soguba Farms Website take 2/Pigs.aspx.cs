﻿using System;
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
            string birthWeight = Pigs.SelectedRow.Cells[5].Text.ToString();
            txtBirthWeight.Text = birthWeight;
            string currWeight = Pigs.SelectedRow.Cells[6].Text.ToString();
            txtCurrWeight.Text = currWeight;

        }
    }
}