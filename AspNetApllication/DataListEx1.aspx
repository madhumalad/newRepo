﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="DataListEx1.aspx.cs" Inherits="AspNetApllication.Models.DataListEx1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <section class="container">
        <div class="h2 bg-success text-white">DataList Example 1</div>
        <div class="row">
            <div class="col">
                <asp:DataList ID="dataList1" runat="server" OnItemCommand="dataList1_ItemCommand"
                    DataKeyField="CustomerId"
                    OnEditCommand="dataList1_EditCommand"
                    OnUpdateCommand="dataList1_UpdateCommand"
                    OnCancelCommand="dataList1_CancelCommand"
                    OnDeleteCommand="dataList1_DeleteCommand"
                    RepeatColumns="4" RepeatDirection="Horizontal" RepeatLayout="Table">
                    <HeaderTemplate>
                        <h4 class="bg-dark text-light">Customer List</h4>
                    
                     </HeaderTemplate>
                    <FooterTemplate>
                         </div>
                        <h6 class="bg-info text-dark text-right p-1">End of List</h6>
                      
                    </FooterTemplate>
                    <ItemTemplate>
                        <div class=" border m-0 p-2">
                        The customer <%# DataBinder.Eval(Container.DataItem,"CompanyName") %>
                        ,represented by <%# DataBinder.Eval(Container.DataItem,"ContactName") %>
                        is located in <%#  DataBinder.Eval(Container,"DataItem.City") %>,
                        <%#  DataBinder.Eval(Container,"DataItem.Country") %>.
                       <br />
                            <br />
                       <div class="mt-2 mb-2 d-flex "> 
                              <asp:LinkButton ID="editLink1" runat="server" Text="Modify" CommandName="Edit"
                             CommandArgument='<%#DataBinder.Eval(Container.DataItem,"CustomerID" )%>'
                            CssClass="btn btn-outline-danger btn-sm w-50" />
                        <asp:LinkButton ID="link1" runat="server"
                            CssClass="btn btn-outline-primary btn-sm w-50" Text="View Details"
                            CommandName="view"
                            CommandArgument='<%#DataBinder.Eval(Container.DataItem,"CustomerID" )%>'
                            />.
                        </div>
                           
                    </ItemTemplate>
                  
                    <AlternatingItemTemplate>
                        <div class="  bg-light border">
                             The customer <%# DataBinder.Eval(Container.DataItem,"CompanyName") %>
                        ,represented by <%# DataBinder.Eval(Container.DataItem,"ContactName") %>
                        is located in <%#  DataBinder.Eval(Container,"DataItem.City") %>,
                        <%#  DataBinder.Eval(Container,"DataItem.Country") %>
                       <br />
                            <div class="mt-2 mb-2 d-flex "> 
                              <asp:LinkButton ID="editLink1" runat="server" Text="Modify" CommandName="Edit"
                             CommandArgument='<%#DataBinder.Eval(Container.DataItem,"CustomerID" )%>'
                            CssClass="btn btn-outline-danger btn-sm w-50" />
                        <asp:LinkButton ID="link1" runat="server"
                            CssClass="btn btn-outline-primary btn-sm w-50" Text="View Details"
                            CommandName="view"
                            CommandArgument='<%#DataBinder.Eval(Container.DataItem,"CustomerID" )%>'
                            />.
                        </div>
                            </div>
                    </AlternatingItemTemplate>
                    
                    <EditItemTemplate>
                        <table class="table table-sm">
                            <tr>
                                <td>
                                    Company:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCompany" runat="server"
                                        CssClass="form-control" 
                                        Text='<%#DataBinder.Eval(Container.DataItem,"CompanyName") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Contact Name:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtContact" runat="server"
                                        CssClass="form-control" 
                                        Text='<%#DataBinder.Eval(Container.DataItem,"ContactName") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    City:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCity" runat="server"
                                        CssClass="form-control" 
                                        Text='<%#DataBinder.Eval(Container.DataItem,"City") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Country:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCountry" runat="server"
                                        CssClass="form-control" 
                                        Text='<%#DataBinder.Eval(Container.DataItem,"Country") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="btnUpdate" runat="server" Text="Update"
                                        CommandName="Update" CssClass="btn btn-sm btn-success" />
                                     <asp:Button ID="btnCancel" runat="server" Text="Discard"
                                        CommandName="Cancel" CssClass="btn btn-sm btn-secondary" />

                              </td>
                            </tr>
                        </table>
                    </EditItemTemplate>

 

                </asp:DataList>
            </div>
        </div>
  </section>
    
</asp:Content>
