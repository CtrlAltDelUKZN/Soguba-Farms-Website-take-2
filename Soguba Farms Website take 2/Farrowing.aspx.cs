﻿using System;
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

                throw;
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

                throw;
            }
        }

        protected void ddlLitID_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
    }
}