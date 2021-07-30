<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Connect.Pages.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server" class="d-flex align-items-center justify-content-center">
        <div class="card p-3 logincontainer">
            <div class="d-flex flex-column">
                <asp:Label ID="usernamelabel" runat="server" CssClass="form-label" Text="Username"></asp:Label>
                <asp:TextBox ID="username" runat="server" CssClass="form-control" placeholder="ex:johnathan"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ID="usernamerequiredvalidatior" runat="server" ControlToValidate="username" ForeColor="#ff6600" ErrorMessage="Username Required"></asp:RequiredFieldValidator>

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
            <asp:RequiredFieldValidator ID="passwordrequiredvalidator" runat="server" ControlToValidate="password" ForeColor="#ff6600" ErrorMessage="Password Required"></asp:RequiredFieldValidator>

            <div class="d-flex flex-column">
                <asp:Label ID="confirmpasswordlabel" runat="server" Text="Confirm Password" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="confirmpassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <div style="height: 4px;" class="mb-3">
                <div style="position: absolute;">
                    <asp:RequiredFieldValidator ID="confirmpasswordrequiredvalidator" runat="server" ControlToValidate="confirmpassword" ForeColor="#ff6600" ErrorMessage="Confirm Password Required"></asp:RequiredFieldValidator>

                </div>
                <div style="position: absolute;">
                    <asp:CompareValidator ID="comparevalidator" ControlToValidate="confirmpassword" ControlToCompare="password" ForeColor="#ff6600" runat="server" ErrorMessage="Password Must Match"></asp:CompareValidator>

                </div>
            </div>

            <div class="d-flex flex-column justify-content-between">
                <asp:Button ID="register" runat="server" Text="Register" CssClass="btn btn-outline-primary mb-2 mt-2" OnClick="RegisterBtnClick" />
                <a href="Login.aspx">Already have an Account.</a>
            </div>
        </div>
    </form>
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 300" style="position: absolute; bottom: 0px; z-index: -5">
        <path fill="#ff5500" fill-opacity="0.5" d="M0,0L40,42.7C80,85,160,171,240,202.7C320,235,400,213,480,176C560,139,640,85,720,101.3C800,117,880,203,960,218.7C1040,235,1120,181,1200,138.7C1280,96,1360,64,1400,48L1440,32L1440,320L1400,320C1360,320,1280,320,1200,320C1120,320,1040,320,960,320C880,320,800,320,720,320C640,320,560,320,480,320C400,320,320,320,240,320C160,320,80,320,40,320L0,320Z"></path>
    </svg>
</asp:Content>
