using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
 
using System.Configuration;

namespace Soguba_Farms_Website_take_2
{
    public partial class _Default : Page
    {

        string connectionString = ConfigurationManager.ConnectionStrings["group25ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Username"] != null && Session["Pass"] != null)
            {
                Session.Abandon();
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {

      
            /*
            {
                try
                {
                    SqlConnection conn = new SqlConnection(connectionString);

                        conn.Open();
                    
                    SqlCommand com = new SqlCommand("select * from Employees where Name ='" + Login1.UserName.ToString().Trim() +
                        "'AND Password = '" + Login1.Password.ToString().Trim() + "'", conn);
                    SqlDataReader dr = com.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {

                            Response.Write("<script>alert('" + dr.GetValue(1).ToString() + "');</script>");
                            Session["username"] = dr.GetValue(1).ToString();
                            Session["password"] = dr.GetValue(2).ToString();
                            Session["position"] = dr.GetValue(3).ToString();
                            if (Session["username"].ToString() == Login1.UserName.ToString().Trim() && Session["password"].ToString() == Login1.Password.ToString().Trim())
                            {
                                if (Session["position"].ToString() == "Administrator")
                                {
                                    Session["status"] = "go";
                                }
                                Response.Redirect("Notifications.aspx");
                            } 
   
                        }
                        
                    }
                    else
                    {
                        Login1.FailureText = "Please try again";    
                        Label1.Visible = true;
                        Response.Redirect("Default.aspx");
                        Label1.Visible = true;
                        Response.Write("<script>alert('Invalid');</script>");

                    }
                }
                catch (Exception ex)
                {
                  Console.WriteLine(  ex.Message);

                }
                
                

                if (Login1.UserName == Session["user"].ToString() && Login1.Password == Session["pass"].ToString())
                {
                    Session["status"] = "go";
                    Response.Redirect("Pigs.aspx");
                }
            }*/


        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            if (ValidateUser(Login1.UserName, Login1.Password))
            {
                Response.Redirect("Notifications.aspx");
            }
            else {
                e.Authenticated = false;
            }

             bool ValidateUser(string user, string pass)
            {
                bool status = false;
                string username;
                string password;
                string position;
                try
                {
                    SqlConnection conn = new SqlConnection(connectionString);

                    conn.Open();

                    SqlCommand com = new SqlCommand("select * from Employees where Name ='" + Login1.UserName.ToString().Trim() +
                            "'AND Password = '" + Login1.Password.ToString().Trim() + "'", conn);
                    SqlDataReader dr = com.ExecuteReader();

                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            username = dr.GetValue(1).ToString();
                            password = dr.GetValue(2).ToString();
                            position = dr.GetValue(3).ToString();

                            if (user == username && pass == password)
                            {
                                Session["Username"] = username;
                                Session["Pass"] = position;//Meant for position not Pass
                                status = true;

                            }
                            else
                            {
                                status = false;
                            }



                        }


                    }
 
                }
                catch(Exception ex)
                {
                    Response.Write("<script>alert('Please check your server connection and try again');</script>");
                }
                return status;
            }
        }
    }
}