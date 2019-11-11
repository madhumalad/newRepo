<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="SignOut.aspx.cs" Inherits="AspNetApllication.SignOut" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="jumbotron">
        <div class="display-1">You have logged out. You will have to
            <asp:HyperLink ID="link1" runat="server" Text="Re-Login"
                NavigateUrl="~/SighInForm.aspx" />to access the site
        </div>
    </section>
</asp:Content>
