<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" MasterPageFile="~/UI/Home.Master" Inherits="VirtualClassroom_final.UI.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <link rel="Shortcut Icon" href="../img/dev7logo.png" />
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
        .back {
            background-color: #000000;
            opacity: 0.90;
        }

        .back2 {
            background-color: #000000;
            opacity: 0.80;
        }


        #div3 {
            background-color: #FFFFFF;
            margin: -5px 0px 0px 65px;
            padding: 10px 0px 0px 30px;
            border: 7px solid #CCCCCC;
            border-radius: 7px;
            width: 200px;
            height: 110px;
        }

        #forgtpass {
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">

        <div class="row">
            <div class="col-xs-12">

                <div class="row" style="margin-top: 200px;">
                    <div class="col-md-4 col-md-offset-4">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 class="modal-title pull-left">Login</h3>
                                <img src="../img/login_icon.png" class="pull-right" width="80" height="100" />
                            </div>
                            <div class="modal-body">
                                <div>
                                    <asp:TextBox ID="txtloginmail" runat="server" CssClass="form-control" placeholder="Enter Email">
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvtxtemail" runat="server" ControlToValidate="txtloginmail" ForeColor="Red" Display="Dynamic"
                                         ErrorMessage="*Email Required" ValidationGroup="btnlogin"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Red" ControlToValidate="txtloginmail" Display="Dynamic"
                                        ErrorMessage="***" CssClass="" ValidationExpression='\w+([-+.&#039;]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*'
                                        ValidationGroup="btnlogin"></asp:RegularExpressionValidator>
                                </div>
                                <div>&nbsp;</div>
                                <div>
                                    <asp:TextBox ID="txtloginpass" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password">
                                    </asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtloginpass" ForeColor="Red" Display="Dynamic"
                                         ErrorMessage="*Password Required" ValidationGroup="btnlogin"></asp:RequiredFieldValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtloginpass"
                                        CssClass="" ErrorMessage="" ForeColor="Red" Display="Dynamic"
                                        ValidationGroup="btnlogin"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div class="block-inline">
                                    <asp:Button type="button" ID="btnlogin" Font-Bold="true" runat="server" class="btn btn-primary "
                                        Text="Login" OnClick="btnlogin_Click" ValidationGroup="btnlogin" />

                                    <asp:Button type="button" ID="btnReg" Font-Bold="true" runat="server" class="btn btn-success" ValidationGroup="btnsubmit" OnClick="btnReg_Click" Text="Register" />
                                </div>
                                <div>
                                    <a href="#" data-target="#forgotpassword" data-toggle="modal" data-backdrop="false" style="color: green; font-size: x-small;" id="lnkforgotpassword" runat="server">
                                        <span class="glyphicon glyphicon-user"></span>Forgot Password?</a>
                                    <div class="modal fade" id="forgotpassword" tabindex="-1">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button class="close" data-dismiss="modal" runat="server">&times;</button>
                                                    <%--<asp:Button ID="btnClose" runat="server" CssClass="close btn-link" Text="Close"/>--%>
                                                    <h4 class="modal-title">Forgot Password</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <asp:TextBox ID="txtforgotpass" runat="server" placeholder="Please enter your email" CssClass="form-control"></asp:TextBox><br />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtforgotpass" Display="Dynamic"
                                                        ErrorMessage="Email Required" ForeColor="Red" ValidationGroup="btnforgotpass"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="modal-footer">
                                                    <asp:Button ID="btnforgotpass" runat="server" Text="Send Password" CssClass="btn btn-success form-control"
                                                        ValidationGroup="btnforgotpass" OnClick="btnforgotpass_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div>
                    <asp:Label ID="lblmessage" runat="server" ForeColor="green" Font-Size="Small"
                        CssClass="label label-warning" Style="margin-top: 10px; margin-left: 0%;"></asp:Label>
                    <asp:Label ID="lblauthn" runat="server" CssClass="text text-error text-warning"
                        ForeColor="green" Style="margin-top: 10px;"></asp:Label>
                    <asp:Label ID="lblmsg" runat="server" CssClass="text text-error text-warning" ForeColor="Blue"></asp:Label>
                    <a href="#" data-target="#admincontact" data-toggle="modal" data-backdrop="true" style="color: white; background-color: blue"
                        visible="false" class="alert-link" id="lnkadmin1" runat="server">Conatct Admin</a>
                    <asp:Label ID="lblmsg3" runat="server" CssClass="text text-info" ForeColor="green"
                        Style="margin-top: 10px;"></asp:Label>
                </div>
            </div>
        </div>
        <!--Contact Administrator for blocking of account-->
        <div class="modal fade" id="admincontact" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Contact Administrator</h4>
                    </div>
                    <div class="modal-body">
                        <asp:TextBox ID="txtemailid" runat="server" CssClass="form-control" placeholder="Please Enter your email"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtemailid"
                            ErrorMessage="Email Required" ValidationGroup="btncontact" ForeColor="Red"></asp:RequiredFieldValidator><br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtemailid"
                            ErrorMessage="Invalid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ValidationGroup="btncontact"></asp:RegularExpressionValidator>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btncontact" runat="server" Text="Send" CssClass="btn btn-success form-control"
                            ValidationGroup="btncontact" OnClick="btncontact_Click" />
                    </div>
                </div>
            </div>
        </div>


    </div>
</asp:Content>
