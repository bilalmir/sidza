<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="VirtualClassroom_final.UI.AdminLogin" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <link rel="Shortcut Icon" href="../img/dev7logo.png" />
    <title></title>  
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="../Styles/bootstrap.min.css" media="screen"/>
    <link rel="Stylesheet" href="../Styles/bootstrap-responsive.min.css" />
   <script type="text/javascript" src="../Scripts/jquery-1.9.js"></script>    
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
   
</head>
<body>
    <div class="container-fluid"> 
    <form id="Form1" runat="server">
      <div class="row">
        <div class="col-xs-12">
      <nav class="navbar navbar-default navbar-fixed-top">    
        <div class="navbar-collapse">      
            <ul class="nav navbar-nav">                
                <li><a href="AdminLogin.aspx"><asp:Image ID="imglogo" runat="server" ImageUrl="~/img/logo.jpg" Height="80px" CssClass="img-rounded" Width="100px" /></a></li>                          
                <li><h1>WELCOME TO SIDZA ADMIN PANEL</h1></li>
            </ul>    
           </div>    
        </nav>
     
        <div class="row" style="margin-top:200px;">
           <div class="col-md-4 col-md-offset-4">
              <div class="modal-content">
                  <div class="modal-header">
                               <h3 class="modal-title pull-left">Login</h3>
                      <img src="../img/login_icon.png" class="pull-right" width="80" height="100" />
                  </div>
                  <div class="modal-body">
                      <div>
                      <asp:TextBox ID="txtloginmail" runat="server" CssClass="form-control" placeholder="Enter Admin Email">
                      </asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Red" ControlToValidate="txtloginmail"
                                    ErrorMessage="***" CssClass="" ValidationExpression='\w+([-+.&#039;]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*'
                                    ValidationGroup="btnlogin"></asp:RegularExpressionValidator>
                      </div>
                      <div>
                       <asp:TextBox ID="txtloginpass" runat="server" CssClass="form-control" placeholder="Enter Admin Password"  TextMode="Password">
                       </asp:TextBox><asp:RequiredFieldValidator  ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtloginpass"
                                CssClass="" ErrorMessage="" ForeColor="Red" Display="Dynamic"
                                ValidationGroup="btnlogin"></asp:RequiredFieldValidator>
                      </div>
                  </div>
                  <div class="modal-footer">
                      <asp:Button type="button" ID="btnlogin" Font-Bold="true" runat="server" class="btn btn-primary "
                            Text="Login"  OnClick="btnlogin_Click" ValidationGroup="btnlogin" />
                  </div>
              </div>                  
 
            </div>
        </div>     
      </div>         
       </div> 
    </form>
    <script src="../Scripts/jquery-3.2.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
   </div>
    </body>
    </html>