using System;
using System.Collections.Generic;
using System.Web;
using Microsoft.AspNet.SignalR;
namespace SignalRChat
{
    public class ChatHub : Hub
    {
        public void Send(string name, string message)
        {
            // Call the broadcastMessage method to update clients.
            Clients.All.broadcastMessage(name, message);
        }

        List<string> Users = new List<string>();

        public void AddUser(string userName)
        {
            //Users.Add(userName);
            Clients.All.onlineUsers(userName);
            
        }

        //return list of all active connections
        public List<string> GetAllActiveConnections()
        {
            //SignalRUsers.Add("user1");
            //SignalRUsers.Add("user2");
            //SignalRUsers.Add("user3");
            return Users;
        }

    }
}