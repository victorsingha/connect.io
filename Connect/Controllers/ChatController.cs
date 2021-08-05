using Connect.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.Mvc;

namespace Connect.Controllers
{
    public class ChatController : Controller
    {
        // Chat/{{ActionName}}

        //Socket sck;
        //EndPoint epLocal, epRemote;
        //byte[] buffer;
        //string localIp, remoteIp;
        //List<string> MsgList = new List<string>();

        SocketService socketService = new SocketService();

        // API for Connect Button
        [HttpPost]
        public ActionResult Connect(string IP1, string IP2, string Port1, string Port2)
        {
            try
            {

                socketService.BindSocket(IP1, IP2, Port1, Port2);
                return Json(new { success = true, responseText = "Connected." }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                return Json(new { success = false, responseText = e.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        //API for Send Button
        [HttpPost]
        public ActionResult Send(string message)
        {
            try
            {
                //Socket sck = (Socket)Session["socket"];

                //// Convert string msg to byte
                //ASCIIEncoding aEncoding = new ASCIIEncoding();
                //byte[] sendingMessage = new byte[1500];
                //sendingMessage = aEncoding.GetBytes(message);

                //// Sending Encoded Message
                //sck.Send(sendingMessage);

                //// add to listbox
                //MsgList.Add("Local: " + message);
                List<string> msgList = new List<string>();
                msgList = socketService.Send(message);

                return Json(new { success = true, responseText = msgList }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                return Json(new { success = false, responseText = e.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        //public void BindSocket(string IP1, string IP2, string Port1, string Port2)
        //{
        //    sck = new Socket(AddressFamily.InterNetwork, SocketType.Dgram, ProtocolType.Udp);
        //    sck.SetSocketOption(SocketOptionLevel.Socket, SocketOptionName.ReuseAddress, true);

        //    //localIp = IP1;
        //    //remoteIp = IP2;

        //    localIp = GetLocalIP();
        //    remoteIp = GetLocalIP();

        //    // binding Socket
        //    epLocal = new IPEndPoint(IPAddress.Parse(localIp), Convert.ToInt32(Port1));
        //    sck.Bind(epLocal);

        //    // connect to remote IP and port
        //    epRemote = new IPEndPoint(IPAddress.Parse(remoteIp), Convert.ToInt32(Port2));
        //    sck.Connect(epRemote);

        //    // starts to listen to an specific port
        //    buffer = new byte[1500];
        //    sck.BeginReceiveFrom(buffer, 0, buffer.Length, SocketFlags.None, ref epRemote, new
        //    AsyncCallback(MessageCallBack), buffer);
            
        //    //save to session
        //    Session["socket"] = sck;
        //}


        //private void MessageCallBack(IAsyncResult aResult)
        //{
        //    try
        //    {
        //        //int size = sck.EndReceiveFrom(aResult, ref epRemote);

        //        byte[] receivedData = new byte[1500];
        //        receivedData = (byte[])aResult.AsyncState;

        //        //convert byte[] to string
        //        ASCIIEncoding aEnconding = new ASCIIEncoding();
        //        string receivedMessage = aEnconding.GetString(receivedData);

        //        //Adding Msg To List
        //        MsgList.Add("Remote: " + receivedMessage);

        //        // starts to listen the socket again
        //        buffer = new byte[1500];
        //        sck.BeginReceiveFrom(buffer, 0, buffer.Length, SocketFlags.None, ref epRemote, new AsyncCallback(MessageCallBack), buffer);

               
        //    }
        //    catch (Exception e)
        //    {
        //        throw e;
        //    }

        //}
        //protected string GetLocalIP()
        //{
        //    IPHostEntry host;
        //    host = Dns.GetHostEntry(Dns.GetHostName());
        //    foreach (IPAddress ip in host.AddressList)
        //    {
        //        if (ip.AddressFamily == AddressFamily.InterNetwork)
        //        {
        //            return ip.ToString();
        //        }
        //    }
        //    return "127.0.0.1";
        //}
    }
}