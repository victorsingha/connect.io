<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Connect.Pages.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server" class="d-flex align-items-center justify-content-center">
        <div class="card p-3 logincontainer">
            <div class="d-flex flex-column">
                <asp:Label ID="usernamelabel" runat="server" CssClass="form-label" Text="Username"></asp:Label>
                <asp:TextBox ID="username" runat="server" CssClass="form-control" placeholder="ex:johnathan"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ID="usernamerequiredvalidatior" runat="server" ControlToValidate="username" ForeColor="#ff6600" ErrorMessage="username required"></asp:RequiredFieldValidator>

            <div class="d-flex flex-column">
                <asp:Label ID="emaillabel" runat="server" CssClass="form-label" Text="Email"></asp:Label>
                <asp:TextBox ID="email" runat="server" CssClass="form-control" placeholder="name@example.com"></asp:TextBox>
            </div>
            <div style="height: 4px;" class="mb-3">
                <div style="position: absolute;">
                    <asp:RequiredFieldValidator ID="emailrequiredvalidator" runat="server" ControlToValidate="email" ForeColor="#ff6600" ErrorMessage="email required"></asp:RequiredFieldValidator>
                </div>
                <div style="position: absolute;">
                    <asp:RegularExpressionValidator CssClass="emailregex" ID="emailregexvalidation" runat="server" ControlToValidate="email" ErrorMessage="email is not valid" ForeColor="#ff6600" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="d-flex flex-column">
                <asp:Label ID="passwordlabel" runat="server" Text="Password" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ID="passwordrequiredvalidator" runat="server" ControlToValidate="password" ForeColor="#ff6600" ErrorMessage="password required"></asp:RequiredFieldValidator>

            <div class="d-flex flex-column">
                <asp:Label ID="confirmpasswordlabel" runat="server" Text="Confirm Password" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="confirmpassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ID="confirmpasswordrequiredvalidator" runat="server" ControlToValidate="confirmpassword" ForeColor="#ff6600" ErrorMessage="confirm password required"></asp:RequiredFieldValidator>

            <div class="d-flex flex-column justify-content-between">
                <asp:Button ID="register" runat="server" Text="Register" CssClass="btn btn-outline-primary mb-2 mt-1" />
                <a href="Login.aspx">Already have an account.</a>
            </div>
        </div>
    </form>
</asp:Content>
