<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassWord.aspx.cs"
    Inherits="VirtualClassroom_final.UI.ResetPassWord" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="Stylesheet" href="../Styles/bootstrap-responsive.css" />
    <link rel="Stylesheet" href="../Styles/bootstrap-responsive.min.css" />
    <link rel="Stylesheet" href="../Styles/bootstrap.css" />
    <title></title>
</head>
<body>
    <form runat="server">
    <div class="collapse nav-collapse ">
        <div class="container">
            <div class="navbar   navbar-fixed-top    ">
                <asp:HyperLink ID="HyperLink2" runat="server" CssClass="brand label-inverse badge"
                    Font-Names="Lucida" ForeColor="White" Style="margin-left: 100px; margin-top: 10px;">
                    <asp:Label ID="Label2" runat="server" Font-Size="XX-Large" Font-Bold="true" Text="V"></asp:Label>-irtual
                    Classroom</asp:HyperLink>
                <div class="navbar-inner">
                <ul>
                <li><asp:Label ID="Label1" runat="server" Font-Size="XX-Large" Font-Bold="true" ></asp:Label></li>
                <li><asp:Label ID="Label3" runat="server" Font-Size="XX-Large" Font-Bold="true"></asp:Label></li>
                </ul>
                </div>
            </div>
        </div>
    </div>
    
    <div class="container pull-right">
        <table class="table  img-polaroid table-hover" style="width: 50px; height: 70px; margin-left: 200px;
            margin-top: 150px;">
            <tr>
            <th>Reset Password</th>
            
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtpassword" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtpassword" ErrorMessage="Required Field"
                        ForeColor="Red" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtconfirmpassword" runat="server" placeholder="Confirm Password"
                        TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                            runat="server" ControlToValidate="txtconfirmpassword" ErrorMessage="Required Field"
                            ForeColor="Red" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnsumbit" runat="server" Text="Submit" CssClass="btn btn-success"
                        OnClick="btnsumbit_Click" ValidationGroup="btnsubmit" />
                </td>
            </tr>
        </table>
        <asp:Label ID="lblmsg" runat="server"></asp:Label>
        <asp:Image runat="server" ImageUrl="~/img/ChangePassword.png" CssClass=" pull-right"
            Style="margin-top: -200px; margin-right: 180px;" />
    </div>
 
    <div class="collapse nav-collapse ">
        <div class="navbar navbar-fixed-bottom">
            <div class="navbar-inner">
                <section>
                    <%--<p class="lead text-center">Wanna get in touch? Email us at <a href="">office@awesomeproduct.com</a>.</p>--%>
                    <ul class="inline text-center">
                        <li><strong>Designed and Developed by:</strong></li>
                        <li><a href="">Owais&nbsp;&nbsp;&nbsp;|</a></li>
                        <li><a href="">Basit</a></li>
                        <%--<li><a href="">LinkedIn</a></li>--%>
                    </ul>
                    <p class="text-center muted">
                        &copy; Copyright 2014 Virtual Classroom</p>
                </section>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
