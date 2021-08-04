<%@ Page Title="Chat" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Connect.Pages.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="width: 100vw; position: absolute; top: 15px;">
        <nav class="afterloginnav container d-flex flex-row-reverse gap-3">
            <a href="./Login.aspx" class="fs-5">logout</a>
            <a href="./Users.aspx" class="fs-5">users</a>
        </nav>
    </div>


    <div class="container">
        <div class="row">
            <form id="form" class="col-md-9 d-flex flex-column" style="height: 480px">
                <div class="d-flex gap-3 mb-3">
                    <p class="form-label">IP1</p>
                    <input class="form-control" id="IP1" />

                    <p class="form-label">IP2</p>
                    <input class="form-control" id="IP2" />
                </div>

                <div class="d-flex gap-3">
                    <p class="form-label">Port1</p>
                    <input class="form-control" id="Port1" />

                    <p class="form-label">Port2</p>
                    <input class="form-control" id="Port2" />
                    <button class="btn btn-outline-primary px-5" onclick="connectBtn()">Connect</button>
                </div>
                <div class="chatwindow" style="height: 500px; background-color: beige; margin: 12px 0px; border-radius: 4px;">
                    <h1>chatwindow</h1>

                </div>
                <div class="d-flex gap-3">
                    <input id="MessageId" class="form-control" />
                    <button class="btn btn-outline-primary px-5" onclick="sendBtn()">Send</button>
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
        function connectBtn() {
            //console.log("connect")
            var IP1 = document.getElementById("IP1").value;
            var IP2 = document.getElementById("IP2").value;
            var Port1 = document.getElementById("Port1").value;
            var Port2 = document.getElementById("Port2").value;
            console.log(IP1 + IP2 + Port1 + Port2);
        }
        function sendBtn() {
            //console.log("send")
            var msg = document.getElementById("MessageId").value;
            console.log(msg);
        }
    </script>

</asp:Content>
