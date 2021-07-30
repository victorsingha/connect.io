﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Connect.Services
{
    public class UserService
    {

        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        public bool Login(string email,string password)
        {
            try
            {
                using (connection)
                {
                    string query = $"SELECT * FROM Users WHERE Email = '{email}' and Password = '{password}'";
                    SqlCommand cmd = new SqlCommand(query, connection);
                    //SqlCommand cmd = new SqlCommand("Login", connection);
                    //cmd.CommandType = CommandType.StoredProcedure;

                    //cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = model.Email;
                    //cmd.Parameters.Add("@Password", SqlDbType.VarChar).Value = model.Password;

                    connection.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        if (reader.HasRows)
                        {
                            int _userid = (Int32)reader["UserId"];
                            string _username = (string)reader["Username"]; ;
                            string _email = (string)reader["Email"];

                            return true;

                        }
                        else
                        {
                            return false;
                        }
                    }

                }
                return false;
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }
}