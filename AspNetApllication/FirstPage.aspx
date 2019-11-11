<%@ Page Language="C#" AutoEventWireup="false" CodeBehind="FirstPage.aspx.cs" 
    Inherits="AspNetApllication.FirstPage"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title></title><style></style>
<script runat="server">
   
</script>
</head>
<body>
    <h2>Welcome to Asp.net Applicaton (Html Based)</h2>
    <form runat="server">
        <%--
        <lable class="username">User Name</lable>
        <input type="text" name="username" /><br />
        <lable class="password">Password</lable>
        <input type="password" name="password" /><br/>

        <button type="button">Submit</button>
web server controls are like<asp:Lable><asp:textbox>
asp.net objects into html tag is called rendering>
--%>
<asp:Label id="lbl1" runat="server" Text="UserName" />
<asp:TextBox id="txt1" runat="server" />
<br/>
<asp:Label id="lbl2" runat="server" Text="Password"/>
<asp:TextBox id="txt2" runat="server" TexMode="Password"/>
<br/>
<asp:Button id="btn1" runat="server" onclick="btn1_click" Text="Submit"/>
    </form>
</body>
</html>