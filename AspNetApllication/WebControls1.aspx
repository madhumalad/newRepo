<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="WebControls1.aspx.cs" Inherits="AspNetApllication.WebControls1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <asp:Literal ID="Literal1" runat="server" />
    <section class="card shadow mx-5 mb-5"> 
        <div class="card-header card-title text-center">Application Form</div>
        <div class="card-body">

            <div class="form-group form-row">
                <div class="col-3 offset-2 text-right">
                    <asp:Label id="lbl1" runat="server" Text="Name" />
                </div>
                <div class="col-5 text-left">
                    <asp:TextBox id="txtName" runat="server" CssClass="form-control" />
                </div>
            </div>
            
            <!-- password --> 
            <div class="form-group form-row">
                <div class="col-3 offset-2 text-right">
                    <asp:Label id="lbl2" runat="server" Text="Password" />
                </div>
                <div class="col-5 text-left">
                    <asp:TextBox id="txtPwd" runat="server" TextMode="Password" CssClass="form-control" />
                </div>
            </div>

            <!-- address --> 
            <div class="form-group form-row">
                <div class="col-3 offset-2 text-right">
                    <asp:Label id="lbl3" runat="server" Text="Address" />
                </div>
                <div class="col-5 text-left">
                    <asp:TextBox id="txtAddress" runat="server" 
                        TextMode="MultiLine" CssClass="form-control" />
                </div>
            </div>

            <!-- Gender --> 
             <div class="form-group form-row">
                <div class="col-3 offset-2 text-right">
                    <asp:Label id="lbl4" runat="server" Text="Gender" />
                </div>
                <div class="col-5 text-left">
                    <asp:RadioButton ID="radMale" runat="server" GroupName="Gender" Text="Male" />
                    <asp:RadioButton ID="radFemale" runat="server" GroupName="Gender" Text="Female" />
                </div>
            </div>

            <!-- Location --> 
             <div class="form-group form-row">
                <div class="col-3 offset-2 text-right">
                    <asp:Label id="lbl5" runat="server" Text="Location" />
                </div>
                <div class="col-5 text-left">
                    <asp:DropDownList ID="ddlLocation" runat="server" CssClass="form-control">
                        <asp:ListItem Text="--Select--" Value="0" Selected="True" />
                        <asp:ListItem Text="Bengaluru" Value="Bengaluru"  />
                        <asp:ListItem Text="Chennai" Value="Chennai" />
                        <asp:ListItem Text="Amritsar" Value="Amritsar"  />
                        <asp:ListItem Text="Varanasi" Value="Varanasi" />
                    </asp:DropDownList>
                </div>
            </div>

            <!-- Interests/Hobbies --> 
            <div class="form-group form-row">
                <div class="col-3 offset-2 text-right">
                    <asp:Label id="Label1" runat="server" Text="Interests" />
                </div>
                <div class="col-5 text-left">
                    <asp:CheckBoxList ID="chkInterests" runat="server" RepeatColumns="2"
                        RepeatDirection="Horizontal" RepeatLayout="Table" 
                        CssClass="table table-sm table-striped">
                    </asp:CheckBoxList>
                </div>
            </div>

            <div class="form-row">
                <div class="col-4 offset-4 btn-group-lg text-center">
                    <asp:Button id="btnSave" runat="server" Text="Save" 
                        CssClass="btn btn-primary mx-2" OnClick="btnSave_Click"/>
                    <asp:Button id="btnCancel" runat="server" Text="Cancel" 
                        CssClass="btn btn-secondary mx-2" />
                </div>
            </div>
        </div>

    </section>
</asp:Content>
