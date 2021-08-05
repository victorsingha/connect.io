using Connect.Models;
using Microsoft.AspNet.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Connect.Services
{
    public class ChatHub : Hub
    {
        static List<User> ConnectedUsers = new List<User>();
        static List<Message> CurrentMessage = new List<Message>();

        public void Connect(string userName)
        {
            var id = Context.ConnectionId;

            if (ConnectedUsers.Count(x => x.ConnectionID == id) == 0)
            {
                string logintime = DateTime.Now.ToString();
                ConnectedUsers.Add(new User { ConnectionID = id, Username = userName});

                // send to caller  
                Clients.Caller.onConnected(id, userName, ConnectedUsers, CurrentMessage);

                // send to all except caller client  
                Clients.AllExcept(id).onNewUserConnected(id, userName);
            }
        }
    }
}