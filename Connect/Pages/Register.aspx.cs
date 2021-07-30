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
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void RegisterBtnClick(object sender,EventArgs e)
        {
            string _username = username.Text.ToString();
            string _email = email.Text.ToString();
            string _password = password.Text.ToString();
            string _confirmpass = confirmpassword.Text.ToString();
        }
    }
}