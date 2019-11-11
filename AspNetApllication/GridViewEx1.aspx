<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="GridViewEx1.aspx.cs" Inherits="AspNetApllication.GridViewEx1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container">
       <div class="h2 bg-success text-white text-center p-2">GridView Example 1</div>
        <div class="row">
            <div class="col">
                <asp:GridView id="grid1" runat="server" AllowPaging="True"
                    AllowSorting="True" AutoGenerateColumns="false"
                    BackColor="White" BorderColor="#E7E7FF" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="CustomerID" DataSourceID="SqlDataSource1" GridLines="Horizontal">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" SortExpression="CustomerID" />
                        
                        <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName" />
                        <asp:BoundField DataField="ContactName" HeaderText="ContactName" SortExpression="ContactName" />
                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                        <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = @original_CustomerID AND [CompanyName] = @original_CompanyName AND (([ContactName] = @original_ContactName) OR ([ContactName] IS NULL AND @original_ContactName IS NULL)) AND (([City] = @original_City) OR ([City] IS NULL AND @original_City IS NULL)) AND (([Country] = @original_Country) OR ([Country] IS NULL AND @original_Country IS NULL))" InsertCommand="INSERT INTO [Customers] ([CustomerID], [CompanyName], [ContactName], [City], [Country]) VALUES (@CustomerID, @CompanyName, @ContactName, @City, @Country)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [City], [Country] FROM [Customers]" UpdateCommand="UPDATE [Customers] SET [CompanyName] = @CompanyName, [ContactName] = @ContactName, [City] = @City, [Country] = @Country WHERE [CustomerID] = @original_CustomerID AND [CompanyName] = @original_CompanyName AND (([ContactName] = @original_ContactName) OR ([ContactName] IS NULL AND @original_ContactName IS NULL)) AND (([City] = @original_City) OR ([City] IS NULL AND @original_City IS NULL)) AND (([Country] = @original_Country) OR ([Country] IS NULL AND @original_Country IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_CustomerID" Type="String" />
                        <asp:Parameter Name="original_CompanyName" Type="String" />
                        <asp:Parameter Name="original_ContactName" Type="String" />
                        <asp:Parameter Name="original_City" Type="String" />
                        <asp:Parameter Name="original_Country" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CustomerID" Type="String" />
                        <asp:Parameter Name="CompanyName" Type="String" />
                        <asp:Parameter Name="ContactName" Type="String" />
                        <asp:Parameter Name="City" Type="String" />
                        <asp:Parameter Name="Country" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CompanyName" Type="String" />
                        <asp:Parameter Name="ContactName" Type="String" />
                        <asp:Parameter Name="City" Type="String" />
                        <asp:Parameter Name="Country" Type="String" />
                        <asp:Parameter Name="original_CustomerID" Type="String" />
                        <asp:Parameter Name="original_CompanyName" Type="String" />
                        <asp:Parameter Name="original_ContactName" Type="String" />
                        <asp:Parameter Name="original_City" Type="String" />
                        <asp:Parameter Name="original_Country" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div></div>
    </section>
</asp:Content>
