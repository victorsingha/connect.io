using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Connect.Pages
{
    public partial class Home : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        Socket sck;
        EndPoint epLocal, epRemote;
        byte[] buffer;
        //string localIp, remoteIp;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //GetAllUsers();
              
            }

            if(Session["socket"] != null)
            {
                sck = (Socket)Session["socket"];
            }
            else
            {
                ListMsg.Items.Add("Welcome");

                // set up socket
                sck = new Socket(AddressFamily.InterNetwork, SocketType.Dgram, ProtocolType.Udp);
                sck.SetSocketOption(SocketOptionLevel.Socket, SocketOptionName.ReuseAddress, true);

                // set up IP
                //localIp = GetLocalIP();
                //remoteIp = GetLocalIP();

                LocalIP.Text = GetLocalIP();
                RemoteIP.Text = GetLocalIP();
            }

           
            
        }

        protected string GetLocalIP()
        {
            IPHostEntry host;
            host = Dns.GetHostEntry(Dns.GetHostName());
            foreach (IPAddress ip in host.AddressList)
            {
                if (ip.AddressFamily == AddressFamily.InterNetwork)
                {
                    return ip.ToString();
                }
            }
            return "127.0.0.1";
        }

        protected void Connect_Click(object sender, EventArgs e)
        {
            // binding Socket
            epLocal = new IPEndPoint(IPAddress.Parse(LocalIP.Text), Convert.ToInt32(Port1.Text));
            sck.Bind(epLocal);

            // connect to remote IP and port
            epRemote = new IPEndPoint(IPAddress.Parse(RemoteIP.Text), Convert.ToInt32(Port2.Text));
            sck.Connect(epRemote);

            // starts to listen to an specific port
            buffer = new byte[1500];
            sck.BeginReceiveFrom(buffer, 0, buffer.Length, SocketFlags.None, ref epRemote, new
            AsyncCallback(MessageCallBack), buffer);

            // save socket in Session
            Session["socket"] = sck;
        }

        private void MessageCallBack(IAsyncResult aResult)
        {
            try
            {
                //int size = sck.EndReceiveFrom(aResult, ref epRemote);

                byte[] receivedData = new byte[1500];
                receivedData = (byte[])aResult.AsyncState;

                //convert byte[] to string
                ASCIIEncoding aEnconding = new ASCIIEncoding();
                string receivedMessage = aEnconding.GetString(receivedData);

                //Adding Msg To List
                //MessageList.Items.Add("Remote: " + receivedMessage);
                ListMsg.Items.Add("Remote: " + receivedMessage);

                // starts to listen the socket again
                buffer = new byte[1500];
                sck.BeginReceiveFrom(buffer, 0, buffer.Length, SocketFlags.None, ref epRemote, new AsyncCallback(MessageCallBack), buffer);

            }
            catch(Exception e)
            {
                throw e;
            }

        }

        protected void SendBtnClick(object sender,EventArgs e)
        {
            // Convert string msg to byte
            ASCIIEncoding aEncoding = new ASCIIEncoding();
            byte[] sendingMessage = new byte[1500];
            sendingMessage = aEncoding.GetBytes(message.Text);

            // Sending Encoded Message
            sck.Send(sendingMessage);

            // add to listbox
            ListMsg.Items.Add("Local: " + message.Text);
            message.Text = "";
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