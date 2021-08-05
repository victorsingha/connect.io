<%@ Page Title="Chat" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Connect.Pages.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="width: 100vw; position: absolute; top: 6px;">
        <form runat="server" class="afterloginnav container d-flex flex-row-reverse gap-3">
            <asp:Button ID="LogoutBtn" runat="server" Text="logout" CssClass="btn btn-outline-light fs-5" OnClick="LogoutBtn_Click"/>
            <a href="./Users.aspx" class="fs-5 mt-2">users</a>
        </form>
    </div>


    <div class="container">
        <div class="row">
            <form id="form" class="col-md-9 d-flex flex-column" style="height: 480px">
                <div class="chatwindow mb-3" style="height: 500px; background-color: beige; border-radius: 4px;">
                    <h1>chatwindow</h1>

                </div>
                <div class="d-flex gap-3">
                    <input id="MessageId" class="form-control" />
                    <button class="btn btn-outline-primary px-5">Send</button>
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


    </script>

</asp:Content>
