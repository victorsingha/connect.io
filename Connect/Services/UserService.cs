using Connect.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Connect.Services
{
    public class UserService
    {

        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        public LoginResponse Login(string email,string password)
        {
            try
            {
                using (connection)
                {
                    //string query = $"SELECT * FROM Users WHERE Email = '{email}' and Password = '{password}'";
                    //SqlCommand cmd = new SqlCommand(query, connection);
                    SqlCommand cmd = new SqlCommand("Login", connection);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = email;
                    cmd.Parameters.Add("@Password", SqlDbType.VarChar).Value = password;

                    connection.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        if (reader.HasRows)
                        {
                            LoginResponse model = new LoginResponse();
                            model.UserId = (Int32)reader["UserId"];
                            model.Username = (string)reader["Username"]; ;
                            model.Email = (string)reader["Email"];

                            return model;

                        }
                        else
                        {
                            return null;
                        }
                    }

                }
                return null;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public bool Register(string username,string email,string password)
        {
            try
            {
                using (connection)
                {
                    string query = $"insert into Users (Username,Email,Password) values ('{username}','{email}','{password}')";
                    SqlCommand cmd = new SqlCommand(query, connection);
                    connection.Open();
                    var result = cmd.ExecuteNonQuery();
                    connection.Close();
                    if (result != 0)
                    {
                        return true;
                    }
                    else return false;
                }
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }
}