﻿<%@ Page Title="Chat" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Connect.Pages.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <form runat="server" class="col-md-9 d-flex card flex-column-reverse" style="height: 480px">
                <div class="d-flex mb-3 gap-3">
                    <asp:TextBox ID="chat" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:Button ID="send" runat="server" Text="Send" CssClass="btn btn-outline-primary px-5" OnClick="SendBtnClick" />
                </div>
                <asp:RequiredFieldValidator ID="chatrequired" runat="server" ControlToValidate="chat" ForeColor="#66ccff" ErrorMessage="Empty Chat"></asp:RequiredFieldValidator>

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
