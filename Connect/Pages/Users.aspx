<%@ Page Title="Users List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="Connect.Pages.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server" class="container">
        <asp:GridView ID="UsersGrid" runat="server" CssClass="table table-bordered table-hover">
               <HeaderStyle CssClass="table table-primary"/>
        </asp:GridView>
    </form>
</asp:Content>
