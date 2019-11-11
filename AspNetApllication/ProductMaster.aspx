<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="ProductMaster.aspx.cs" Inherits="AspNetApllication.ProductMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container">
        <h2 class="bg-primary text-light text-center p-2">
            Product List
        </h2>
       <div class="row">
            <div class="col-8 offset-2">
              <div class="input-group">
                    <div class="input-group-prepend">
                        <asp:Label ID="lbl1" runat="server" CssClass="input-group-text" Text="Search:" />
                    </div>
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" />
                    <div class="input-group-append">
                        <asp:LinkButton ID="btnLink1" runat="server"
                            CssClass="btn btn-primary" Text="Find" OnClick="btnSubmit_Click" >
                            <i class="fa fa-search"></i>
                        </asp:LinkButton>
                          <asp:LinkButton ID="btnClear" runat="server"
                            CssClass="btn btn-danger" OnClick="btnClear_Click" >
                            <i class="fa fa-close"></i>
                        </asp:LinkButton>
                        </div>
                
                    </div>
 
                </div>
         </div>
        <div class="row">
            <div class="col-8 offset-2">
                <asp:GridView ID="gridView1" runat="server" 
                    GridLines="None" CssClass="table table-striped border"
                    PageSize="5" AllowPaging="true"
                    AutogenerateColumns="false" DataKeyNames="ProductId"
                    OnPageIndexChanging="gridView1_PageIndexChanging" 
                    OnRowEditing="gridView1_RowEditing">
                    <EmptyDataTemplate >
                        <div class="alert alert-warning">
                            Search does not found
                        </div>

                    </EmptyDataTemplate>
                    <PagerStyle  HorizontalAlign="Center"/>
                    <PagerSettings Mode="Numeric" Position="TopAndBottom" PageButtonCount="5" />
                    <Columns>
                        <asp:ButtonField  CommandName="Edit" ButtonType="link" 
                            DatatextField="ProductName" HeaderText="Product Name"
                            /><asp:BoundField HeaderText="Unit Price" DataField="UnitPrice" DataFormatString="{0:C2}"/>
                    </Columns>
                </asp:GridView>
            </div>
        </div><div class="row">

        <div class="col-8 offset-2  text-center">
           <asp:Button ID="btnCreateNew" CssClass="btn btn-lg btn-dark lg-2" runat="server"
               Text="Add New Product" OnClick="btnCreateNew_Click" />
            </div>
        </div>
    </section>

</asp:Content>
