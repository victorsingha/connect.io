﻿using System;
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
    public partial class Home : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetAllUsers();
            }
        }
        protected void SendBtnClick(object sender,EventArgs e)
        {

        }
        protected void GetAllUsers()
        {
            try
            {
                using (connection)
                {
                    connection.Open();
                    string query = $"SELECT Users.Username, Users.Email FROM Users";
                    SqlCommand cmd = new SqlCommand(query, connection);
                    // cmd = new SqlCommand("GetAllBookList", connection);
                    //cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();
                    DataTable dt = new DataTable();
                    //DataSet ds = new DataSet();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    UsersRepeater.DataSource = dt;
                    UsersRepeater.DataBind();

                    //UsersGrid.DataSource = dt;
                    //UsersGrid.DataBind();

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