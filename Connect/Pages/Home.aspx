<%@ Page Title="Chat" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Connect.Pages.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="width: 100vw; position: absolute; top: 6px;">
        <form runat="server" class="afterloginnav container d-flex flex-row-reverse gap-3">
            <asp:Button ID="LogoutBtn" runat="server" Text="logout" CssClass="btn btn-outline-light fs-5" OnClick="LogoutBtn_Click" />
            <a href="./Users.aspx" class="fs-5 mt-2">users</a>
        </form>
    </div>


    <div class="container">
        <div class="row">
            <form id="form" class="col-md-9 d-flex flex-column" style="height: 480px">
                <div class="chatwindow mb-3" style="height: 500px; background-color: beige; border-radius: 4px;">
                    <h1>chatwindow</h1>
                    <ul id="discussion"></ul>

                </div>
                <div class="d-flex gap-3">
                    <input id="message" class="form-control" />
                    <button class="btn btn-outline-primary px-5" id="sendmessage">Send</button>
                </div>
            </form>
            <div class="col-md-3 d-none d-md-block card pt-2">
                <asp:Repeater ID="UsersRepeater" runat="server">
                    <HeaderTemplate>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <p><strong><%#Eval("Username") %></strong> (<small><%#Eval("Email") %></small>)</p>
                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </div>
    </div>

    <script>

        $("#form").submit(function (e) {
            e.preventDefault();
        });

        $(function () {

            // Declare a proxy to reference the hub. 
            var chat = $.connection.chatHub;
            chat.client.broadcastMessage = function (username, message) {
                var encodedName = $('<div/>').text(username).html();
                var encodedMessage = $('<div/>').text(message).html();
                $('#discussion').append('<li><strong>' + encodedName + '</strong>:' + encodedMessage + '</li>');
            };



            $.connection.hub.start().done(function () {
                $('#sendmessage').click(function () {
                    chat.server.send("Name", $('#message').val());
                    $('#message').val('').focus();
                });
            });

        });


    </script>

</asp:Content>
