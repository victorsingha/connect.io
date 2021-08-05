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
            <form runat="server" class="col-md-9 d-flex flex-column" style="height: 480px">
                   <div class="d-flex gap-3 mb-3">
                    <asp:Label ID="IP1Label" runat="server" Text="IP1" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="LocalIP" runat="server" CssClass="form-control"></asp:TextBox>

                    <asp:Label ID="IP2Label" runat="server" Text="IP2" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="RemoteIP" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="d-flex gap-3">
                    <asp:Label ID="Port1Label" runat="server" Text="Port1" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="Port1" runat="server" CssClass="form-control"></asp:TextBox>

                    <asp:Label ID="Port2Label" runat="server" Text="Port2" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="Port2" runat="server" CssClass="form-control"></asp:TextBox>

                    <asp:Button ID="Connect" runat="server" Text="Connect" CssClass="btn btn-outline-primary px-5" OnClick="Connect_Click" />
                </div>
                <div class="chatwindow" style="height: 500px;background-color: beige;margin-top: 12px;border-radius: 4px;">
                    <h1>chatwindow</h1>
                    <asp:ListBox ID="ListMsg" runat="server"></asp:ListBox>
                </div>
                <div class="d-flex gap-3">
                    <asp:TextBox ID="message" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:Button ID="send" runat="server" Text="Send" CssClass="btn btn-outline-primary px-5" OnClick="SendBtnClick" />
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

</asp:Content>
