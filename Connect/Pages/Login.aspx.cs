using Connect.Models;
using Connect.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Connect.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        UserService userService = new UserService();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void LoginBtnClick(object sender,EventArgs e)
        {
            string _email =  email.Text.ToString();
            string _password = password.Text.ToString();

            string alert = "<div class='alert alert-danger mb-0' role='alert'>Wrong Credentials!</div>";

            LoginResponse response = userService.Login(_email, _password);
            if (response != null) 
            {
                Session["UserId"] = response.UserId;
                Session["Username"] = response.Username;
                Session["Email"] = response.Email;
                Response.Redirect("Home.aspx");
            }
            else
            {
                Response.Write(alert);
            }


        }
    }
}