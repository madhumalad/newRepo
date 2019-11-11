<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Validator.aspx.cs" Inherits="AspNetApllication.Validator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script>
    function myValidation(s, e) {
        if (e.Value.length > 4) {
            e.IsValid = true;
        } else {
            e.IsValid = false;
        }
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container">
        <h2 class="bg-success text-white font-weight-bold text-center">
            Working with validations
    </h2>
        <asp:ValidationSummary ID="sum1" runat="server"  DisplayMode="List" ShowSummary="true"
            Cssclass="alert alert-danger" HeaderText="Errors"/>
        <div class="row">
            <div class="col-3 p-2">
            <div class="card h-100" >
                <div class="card-header card-title bg-warning" >Required field validator </div>

                <div class="card-body">
                    <div class="form-group">
                        <asp:TextBox id="txtName" Cssclass="form-control" runat="server" placeholder="EnterName" />
                   <asp:RequiredFieldValidator ID="ftv1" runat="server" ControlToValidate="txtName" 
                       display="Static" text="*" ErrorMessage="Name is Required" CssClass="text-danger">

                   </asp:RequiredFieldValidator>
                        </div>
                </div>
                  </div>
            </div>
             <div class="col-3 p-2">
            <div class="card h-100">
                <div class="card-header card-title bg-warning" >Required field validator </div>

                <div class="card-body">
                    <div class="form-group">
                        <asp:TextBox id="txtPwd" Cssclass="form-control" runat="server" 
                            placeholder="Enter Password" TextMode="password" />
                        <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtPwd" 
                       display="Static" text="*" ErrorMessage="Password is Required" CssClass="text-danger">

                   </asp:RequiredFieldValidator>
                        <asp:TextBox id="txtConfirm" Cssclass="form-control" runat="server" 
                            placeholder="Confirm Password" TextMode="password" />
                   <asp:CompareValidator  ID="cv1" runat="server" ControlToValidate="txtConfirm"
                       Display="Static" Text="*" ErrorMessage="Password Does not Match"
                       Cssclass="text-danger" ControlToCompare="txtPwd" Operator="Equal" Type="String"/>
                        </div>
                </div>
                  </div>
            </div>
             <div class="col-3 p-2">
            <div class="card h-100">
                <div class="card-header card-title bg-warning" >Required field validator </div>

                <div class="card-body">
                    <div class="form-group">
                        <asp:TextBox id="txtDate" Cssclass="form-control" runat="server" 
                            placeholder="Enter BirthDate" />
                        <asp:RequiredFieldValidator ID="rfv3" runat="server" ControlToValidate="txtDate" 
                       display="Static" text="*" ErrorMessage="Date is Required" CssClass="text-danger">

                   </asp:RequiredFieldValidator>
                   <asp:CompareValidator  ID="cv2" runat="server" ControlToValidate="txtDate"
                       Display="Static" Text="*" ErrorMessage="Invalid Date"
                       Cssclass="text-danger"  Operator="DataTypeCheck" Type="Date"/>
                        </div>
                </div>
                  </div>
            </div>
              <div class="col-3 p-2">
            <div class="card h-100">
                <div class="card-header card-title bg-warning" >Required field validator </div>

                <div class="card-body">
                    <div class="form-group">
                        <asp:TextBox id="txtAge" Cssclass="form-control" runat="server" 
                            placeholder="Enter Age" />
                        <asp:RangeValidator ID="rv1" runat="server" ControlToValidate="txtAge" 
                       display="Static" text="*" ErrorMessage="Age should be between 18 and 100" CssClass="text-danger"
                            Type="Integer" MinimumValue="18" MaximumValue="100">

                   </asp:RangeValidator>
                   
                </div>
                    </div>
                  </div>
            </div>
             <div class="col-3 p-2">
            <div class="card h-100">
                <div class="card-header card-title bg-warning" >Required field validator </div>

                <div class="card-body">
                    <div class="form-group">
                        <asp:TextBox id="txtEmail" Cssclass="form-control" runat="server" 
                            placeholder="Enter Email" />
                        <asp:RegularExpressionValidator ID="rge1" runat="server" ControlToValidate="txtEmail" 
                       display="Static" text="*" ErrorMessage="Invalid Email" CssClass="text-danger"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                           ></asp:RegularExpressionValidator>
                   
                </div>
                    </div>
                  </div>
            </div>
              <div class="col-3 p-2">
            <div class="card h-100">
                <div class="card-header card-title bg-warning" >Required field validator </div>

                <div class="card-body">
                    <div class="form-group">
                        <asp:TextBox id="txtUserId" Cssclass="form-control" runat="server" 
                            placeholder="Enter UserId" />
                        <asp:CustomValidator ID="cv3" runat="server" 
                            ControlToValidate="txtUserId" 
                       display="Static" text="*" ErrorMessage="UseId should be atleast 5 letter and non Existent" 
                            CssClass="text-danger" ClientValidationFunction="myValidation"
                            OnServerValidate="cv3_ServerValidate"
                            
                           ></asp:CustomValidator>
                   
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
