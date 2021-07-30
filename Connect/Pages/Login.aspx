<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Connect.Pages.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server" class="d-lg-flex align-items-center justify-content-center">
        <div class="logincontainer">
            <div class="d-flex flex-column">
                <asp:Label ID="emaillabel" runat="server" CssClass="form-label" Text="email"></asp:Label>
                <asp:TextBox ID="email" runat="server" CssClass="form-control-lg" placeholder="name@example.com"></asp:TextBox>
            </div>
                <asp:RequiredFieldValidator ID="emailrequiredvalidator" runat="server" ControlToValidate="email" ForeColor="#ff6600" ErrorMessage="email required"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="emailregexvalidation" runat="server" ControlToValidate="email" ErrorMessage="email is not valid" ForeColor="#ff6600" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

            <div class="d-flex flex-column">
                <asp:Label ID="passwordlabel" runat="server" Text="password" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="password" runat="server" CssClass="form-control-lg" TextMode="Password"></asp:TextBox>
            </div>
                <asp:RequiredFieldValidator ID="passwordrequiredvalidator" runat="server" ControlToValidate="password" ForeColor="#ff6600" ErrorMessage="password required"></asp:RequiredFieldValidator>

            <div class="d-flex flex-column justify-content-between">
                <asp:Button ID="login" runat="server" Text="Login" CssClass="btn-lg btn-primary mb-4" />
               <a href="Register.aspx">Create an account.</a>
            </div>
        </div>
    </form>
</asp:Content>
