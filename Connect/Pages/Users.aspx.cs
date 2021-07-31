using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Connect.Pages
{
    public partial class Users : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            GetAllUsers();
        }
        protected void GetAllUsers()
        {
            try
            {
                using (connection)
                {
                    connection.Open();
                    string query = $"SELECT * FROM Users";
                    SqlCommand cmd = new SqlCommand(query, connection);
                    // cmd = new SqlCommand("GetAllBookList", connection);
                    //cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();
                    DataTable dt = new DataTable();
                    //DataSet ds = new DataSet();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    //BooksRepeater.DataSource = dt;
                    //BooksRepeater.DataBind();

                    UsersGrid.DataSource = dt;
                    UsersGrid.DataBind();

                    connection.Close();

                }
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }
}