<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="VirtualClassroom_final.UI.AdminLogin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="aa" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="Shortcut Icon" href="../img/dev7logo.png" />
    <title></title>
    <script type="text/javascript" src="../Scripts/jquery-1.9.js"></script>
    <script type="text/javascript" src="../Scripts/bootstrap.js"></script>
    <script type="text/javascript" src="../Scripts/bootstrap.min.js"></script>
    <link rel="Stylesheet" href="../Styles/bootstrap-responsive.css" />
    <link rel="Stylesheet" href="../Styles/bootstrap-responsive.min.css" />
    <link rel="Stylesheet" href="../Styles/bootstrap.css" />
    <link rel="Stylesheet" href="../Styles/Site.css" />
    <link rel="Stylesheet" href="../Styles/bootstrap.min.css" />
    <meta name="viewport" content="widht-device-width,initial-scale=1,maximum-scale=1" />
    <script type="text/javascript">
        $(document).ready(function (event) {

            $('#btnlogin').click(function (e) {


                if ($('#txtloginmail').val() == '') {
                    $('#txtloginmail').focus();
                    alert("Email can't be left blank");
                    return false;
                }
                else if
                ($('#txtloginpass').val() == '') {
                    $('#txtloginpass').focus();
                    alert("Password can't be left blank");
                    return false;

                }
            });
        });
   

    </script>
    <script type="text/javascript">

        function disableback() {
            window.history.forward();
        }
        window.onload = disableback;
        window.onpageshow = function disable(e) { if (e.persistant) { disableback(); } }
        window.onunload = disableback;


    </script>
    <style type="text/css">
        .back
        {
            background-color: #000000;
            opacity: 0.90;
        }
        .back2
        {
            background-color: #000000;
            opacity: 0.80;
        }
        
        
        #div3
        {
            background-color: #FFFFFF;
            margin: -5px 0px 0px 65px;
            padding: 10px 0px 0px 30px;
            border: 7px solid #CCCCCC;
            border-radius: 7px;
            width: 200px;
            height: 110px;
        }
        #forgtpass
        {
            background-color: #FFFFFF;
            margin: -5px 0px 0px 65px;
            padding: 10px 0px 0px 30px;
            border: 7px solid #CCCCCC;
            border-radius: 7px;
            border-style: double;
            width: 250px;
            height: 110px;
        }
    </style>
    <script type="text/javascript">

        function disableback() {
            window.history.forward();



        }
        window.onload = disableback;
        window.onpageshow = function disable(e) { if (e.persistant) { disableback(); } }
        window.onunload = disableback;
    
    
    </script>
</head>
<body>
    <form id="Form1" method="post" action="" class="form-horizontal " runat="server">
    <div class="collapse nav-collapse ">
        <div class="container">
            <div class="navbar   navbar-fixed-top   ">
               <a href="AdminLogin.aspx" style="margin-left:10px;"><asp:Image ID="imglogo" runat="server" ImageUrl="~/img/logo.jpg" Height="80px" style="margin-left:1px;" CssClass="img-rounded" Width="100px" /></a>
             
                                 <%-- -------------------------------------------------Login Start---------------------------------------------%>
                     <div style="margin-top:-30px;font-size:50px;font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;text-align:center;" class="pager">WELCOME TO SIDZA ADMIN PANEL</div>
                   
               <br /><br /><br />
            </div>
        </div>
      
        <div style="background-color: Silver; height: 500px;margin-top:30px;">
            <table    class="  hero-unit table-bordered table-hover offset5 " style="border-width: medium; border-style:double; width:100px; height:350px; background-color:White;  ">
                
                <tr>
                    <th>
                       <asp:Label runat="server" CssClass="muted" Text="Admin Login" style="margin-left:100px; " ></asp:Label>
                    </th>
                </tr>
               
                    <tr>
                        <td>
                            <asp:TextBox ID="txtloginmail" runat="server" CssClass="text-success" placeholder="Email"
                                Style="height: 30px; margin-top: 0.70em; margin-left:198px;"></asp:TextBox><asp:RegularExpressionValidator
                                    ID="RegularExpressionValidator2" runat="server" ForeColor="Red" ControlToValidate="txtloginmail"
                                    ErrorMessage="***" CssClass="" ValidationExpression='\w+([-+.&#039;]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*'
                                    ValidationGroup="btnlogin"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                <tr>
                    <td >
                        <asp:TextBox ID="txtloginpass" runat="server" placeholder="Password"  TextMode="Password"
                            Style="height: 30px; margin-top: -2em; margin-left:200px; "></asp:TextBox><asp:RequiredFieldValidator
                                ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtloginpass"
                                CssClass="pull-right offset1" ErrorMessage="" ForeColor="Red" Display="Static"
                                ValidationGroup="btnlogin"></asp:RequiredFieldValidator></td></tr>
              
                <tr >
                    <td>
                        <asp:Button type="button" ID="btnlogin" Font-Bold="true" runat="server" class="btn btn-primary "
                            Text="Login" Style="margin-top: 0.70em; margin-left:200px;" OnClick="btnlogin_Click" ValidationGroup="btnlogin" />
                    </td>
                </tr>
            </table>
        </div>
        <asp:Image runat="server" ImageUrl="~/img/login_icon.png" style="margin-top:-480px; margin-left:450px;" />
        <%-- ------------------------------------------------------------Login End-------------------------------------------------------%>
<%--        <div class="collapse nav-collapse ">
            <div class="navbar navbar-fixed-bottom">
                <div class="navbar-inner">
                    <section>
                        <ul class="inline text-center">
                            <li><strong>Designed and Developed by:</strong></li>
                            <li><a href="https://www.facebook.com/bilalmir88">Mir Bilal</a></li>
                        </ul>
                        <p class="text-center muted">
                            &copy; Copyright 2014 Virtual Classroom</p>
                    </section>
                </div>
            </div>
        </div>--%>
        <%--------------------------------------------------------modal------------------------------------------------------------------------------%>
    </form>
