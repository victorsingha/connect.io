using Connect.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Connect.Pages
{
    public partial class Register : System.Web.UI.Page
    {
        UserService userService = new UserService();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void RegisterBtnClick(object sender,EventArgs e)
        {
            string _username = username.Text.ToString();
            string _email = email.Text.ToString();
            string _password = password.Text.ToString();

            bool result = userService.Register(_username, _email, _password);
            if (result)
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}