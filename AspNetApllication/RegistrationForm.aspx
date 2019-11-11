<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="AspNetApllication.RegistrationForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="container">
        <h2 class="bg-success text-white font-weight-bold text-center">
           Registration Form
    </h2>
        <asp:ValidationSummary ID="sum1" runat="server"  DisplayMode="List" ShowSummary="true"
            Cssclass="alert alert-danger" HeaderText="Errors"/>
        <div class="row">
            <div class="col-6 offset-3 p-1">
            <div class="card h-100" >
                <div class="card-header card-title bg-warning" >Required field validator </div>

                <div class="card-body">
                    <div class="form-group">
                        <asp:TextBox id="txtName" Cssclass="form-control" runat="server" placeholder="Enter First Name" />
                   <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtName" 
                       display="Static" text="*" ErrorMessage="First Name is Required" CssClass="text-danger">

                   </asp:RequiredFieldValidator>
                        </div>
                
                    <div class="form-group">
                        <asp:TextBox id="txt2" Cssclass="form-control" runat="server" placeholder="Enter Midle Name" />
                   <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txt2" 
                       display="Static" text="*" ErrorMessage="Midle Name Required" CssClass="text-danger">

                   </asp:RequiredFieldValidator>
                        </div>
                     <div class="form-group">
                        <asp:TextBox id="txt3" Cssclass="form-control" runat="server" placeholder="Enter Last Name" />
                   <asp:RequiredFieldValidator ID="rfv3" runat="server" ControlToValidate="txt3" 
                       display="Static" text="*" ErrorMessage="Last Name Required" CssClass="text-danger">

                   </asp:RequiredFieldValidator>
                        </div>
                     <div class="form-group">
                        <asp:TextBox id="txt4" Cssclass="form-control" runat="server" 
                            placeholder="Enter PhoneNumber" />
                         <asp:RequiredFieldValidator ID="rfv5" runat="server" ControlToValidate="txt4" 
                       display="Static" text="*" ErrorMessage="Phone Number Required" CssClass="text-danger">

                   </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rge1" runat="server" ControlToValidate="txt4" 
                       display="Static" text="*" ErrorMessage="Invalid PhoneNumber it should be greater than 60000000" CssClass="text-danger"
                            ValidationExpression="^([6-9]\d|\d{7,})$"
                           ></asp:RegularExpressionValidator>

                   
                   
                </div>
                    <div class="form-group">
                        <asp:TextBox id="txt5" Cssclass="form-control" runat="server" 
                            placeholder="Enter Home CntactNumber" /></div><br />
                      <div class="form-group">
                        <asp:TextBox id="txt6" Cssclass="form-control" runat="server" 
                            placeholder="Enter Work CntactNumber" /></div>
<br />
                    <div class="form-group">
                        <asp:TextBox id="txt7" Cssclass="form-control" runat="server" 
                            placeholder="Enter Email" />
                         <asp:RequiredFieldValidator ID="rfv6" runat="server" ControlToValidate="txt4" 
                       display="Dynamic" text="*" ErrorMessage="Email Required" CssClass="text-danger">

                   </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rge2" runat="server" ControlToValidate="txt7" 
                       display="Static" text="*" ErrorMessage="Invalid Email Id" CssClass="text-danger"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                           ></asp:RegularExpressionValidator>
                </div>
                     <div class="form-group">
                        <asp:TextBox id="txtDate" Cssclass="form-control" runat="server" 
                            placeholder="Enter BirthDate" />
                        <asp:RequiredFieldValidator ID="rfv4" runat="server" ControlToValidate="txtDate" 
                       display="Static" text="*" ErrorMessage="Date is Required" CssClass="text-danger">

                   </asp:RequiredFieldValidator>
                   <asp:CompareValidator  ID="cv2" runat="server" ControlToValidate="txtDate"
                       Display="Static" Text="*" ErrorMessage="Invalid Date"
                       Cssclass="text-danger"  Operator="DataTypeCheck"  Type="Date"/>
                         <asp:RangeValidator ID="rv1" runat="server" ControlToValidate="txtDate" 
                       display="Static" text="*" ErrorMessage="Age should be lessthan 18" CssClass="text-danger"
                            Type="Date" MinimumValue="01-01-2001" MaximumValue="06-11-2019">

                   </asp:RangeValidator>
                        </div>
                  </div>
            </div>
            </div>
             </div>
        <div class="row">
            <div class="col-12 text-center">
               <asp:Button id="btn1" class="btn btn-outline-danger" runat="server" Text="Submit"></asp:Button>
           <%--<Button id="Button1" class="btn btn-outline-danger" >Submit</Button>
          --%>
                </div>
        </div>
    </section>
</asp:Content>
