<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Connect.Pages.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server" class="d-flex align-content-center justify-content-center">
        <div class="logincontainer">
            <div class="d-flex flex-column mb-3">
                <asp:Label ID="emaillabel" runat="server" CssClass="form-label" Text="email"></asp:Label>
                <asp:TextBox ID="email" runat="server" CssClass="form-control" placeholder="name@example.com"></asp:TextBox>
            </div>

            <div class="d-flex flex-column mb-3">
                <asp:Label ID="passwordlabel" runat="server" Text="password" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>

            <div class="d-flex flex-column justify-content-between">
                <asp:Button ID="login" runat="server" Text="Login" CssClass="btn btn-primary mb-3"/>
                <asp:Button ID="register" runat="server" Text="Register" CssClass="btn btn-outline-primary"/>
            </div>
        </div>

    </form>
</asp:Content>
