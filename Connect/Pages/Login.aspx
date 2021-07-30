<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Connect.Pages.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server" class="d-flex align-items-center justify-content-center" style="height: 400px">
        <div class="card p-3 logincontainer">
            <div class="d-flex flex-column">
                <asp:Label ID="emaillabel" runat="server" CssClass="form-label" Text="Email"></asp:Label>
                <asp:TextBox ID="email" runat="server" CssClass="form-control" placeholder="name@example.com"></asp:TextBox>
            </div>
            <div style="height: 4px;" class="mb-3">
                <div style="position: absolute;">
                    <asp:RequiredFieldValidator ID="emailrequiredvalidator" runat="server" ControlToValidate="email" ForeColor="#ff6600" ErrorMessage="Email Required"></asp:RequiredFieldValidator>
                </div>
                <div style="position: absolute;">
                    <asp:RegularExpressionValidator CssClass="emailregex" ID="emailregexvalidation" runat="server" ControlToValidate="email" ErrorMessage="Email is not valid" ForeColor="#ff6600" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
            </div>


            <div class="d-flex flex-column">
                <asp:Label ID="passwordlabel" runat="server" Text="Password" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <div style="height: 4px;" class="mb-4">
                <div style="position: absolute;">
                    <asp:RequiredFieldValidator ID="passwordrequiredvalidator" runat="server" ControlToValidate="password" ForeColor="#ff6600" ErrorMessage="Password Required"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="d-flex flex-column justify-content-between">
                <asp:Button ID="login" runat="server" Text="Login" CssClass="btn btn-outline-primary mb-3" OnClick="LoginBtnClick" />
                <a href="Register.aspx">Create an Account.</a>
            </div>
        </div>
    </form>

    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 300" style="position: absolute; bottom: 0px; z-index: -5;">
        <path fill="#0099ff" fill-opacity="0.3" d="M0,224L60,229.3C120,235,240,245,360,240C480,235,600,213,720,176C840,139,960,85,1080,80C1200,75,1320,117,1380,138.7L1440,160L1440,320L1380,320C1320,320,1200,320,1080,320C960,320,840,320,720,320C600,320,480,320,360,320C240,320,120,320,60,320L0,320Z"></path>
    </svg>
</asp:Content>
