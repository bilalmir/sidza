<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="StuEditProfile.aspx.cs" Inherits="VirtualClassroom_final.UI.StuEditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function openfileDialogChange() {
            $('#ContentPlaceHolder1_flechImage').click();
        }
    </script>

    <script type="text/javascript">
        function ChangeFile(fileUpload) {
            if (fileUpload.value != '') {
                $('#ContentPlaceHolder1_btnChangeProfilepic').click();
            }
        }
    </script>
    <script type="text/javascript">
        function openfileDialogUpload() {
            $('#ContentPlaceHolder1_FleUplImage').click();
        }
    </script>
    <script type="text/javascript">
        function UploadFile(fileUpload) {
            if (fileUpload.value != '') {
                // imgProfile.src = fileUpload.value;
                $('#ContentPlaceHolder1_btnUploadProfilepic').click();
            }
        }
    </script>
    <script type="text/javascript">
         $(document).ready(function () {
             //called when key is pressed in textbox
             $("#ContentPlaceHolder1_ContactNo").keypress(function (e) {
                 //if the letter is not digit then display error and don't type anything
                 if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                     //display error message
                     //  alert("Only Digits Are Allowd")
                     return false;
                 }
             });
         });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="margin-top: 30px;">
        <div class="col-md-8 col-md-offset-2">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title">Edit profile</h3>
                    </div>
                    <div class="modal-body">
                        <div align="center">
                            <%--<asp:ImageButton runat="server" ID="imgprofile" CssClass="img-circle img-responsive" ImageUrl="~/img/profile.png" Width="100" Height="100" />--%>
                            <img src="../img/profile.png" runat="server" id="imgProfile" width="100" height="120" class="img-thumbnail img-responsive" />

                            <%-- <asp:Button ID="btnEditProfilepic" style="display:none;" runat="server" Text="Upload Profile Picture"  CssClass="btn btn-info" OnClick="btnEditProfilepic_Click" />--%>
                            <div>
                                <a href="#" data-target="#RemovePic" data-toggle="modal" data-backdrop="false" style="color: green;" id="lnkRemovePic" runat="server"><span class="glyphicon glyphicon-trash"></span>Remove/</a>
                                <a href="#" style="color: green;" id="lnkChangePic" runat="server" onclick="openfileDialogChange();"><span class="glyphicon glyphicon-edit"></span>Change</a>
                                <asp:FileUpload ID="flechImage" runat="server" Style="display: none;" />
                                <asp:Button ID="btnChangeProfilepic" Style="display: none;" runat="server" Text="Change Profile Pic" CssClass="btn btn-info" OnClick="btnChangeProfilepic_Click" />
                                <a href="#" style="color: green;" id="lnkUploadPic" runat="server" onclick="openfileDialogUpload();"><span class="glyphicon glyphicon-upload"></span>Upload Pic</a>
                            </div>
                            <asp:FileUpload ID="FleUplImage" runat="server" Style="display: none;" />
                            <asp:Button ID="btnUploadProfilepic" Style="display: none;" runat="server" Text="Upload Profile Pic" CssClass="btn btn-info" OnClick="UploadProfilepic_Click" />
                            <div class="modal fade" id="RemovePic" tabindex="-1">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <%--<asp:Button ID="Button2" runat="server" CssClass="close btn-link" Text="Close"/>--%>

                                            <h4 class="modal-title glyphicon glyphicon-warning-sign" style="color: red">Warning</h4>
                                        </div>
                                        <div class="modal-body">
                                            <span class="glyphicon glyphicon-user"></span>
                                            <asp:Label ID="lblloginStatus" runat="server" ForeColor="green" Text="Are You Sure To Remove Your Profile Picture"></asp:Label>
                                        </div>
                                        <div class="modal-footer">
                                            <asp:Button ID="btnYes" runat="server" CssClass="btn btn-success" ForeColor="green" Text="Yes" OnClick="RemoveProfilepic_Click" />
                                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" ForeColor="green" Text="No" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <asp:TextBox runat="server" ID="txtname" CssClass="form-control" Font-Bold="true" placeholder="User Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname"
                                CssClass=" pull-right" ErrorMessage="Name Required" ForeColor="Red" Font-Size="Smaller"
                                Display="Dynamic" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
                            <div>&nbsp;</div>
                        </div>
                        <div>
                            <asp:DropDownList ID="ddlclass" runat="server" CssClass="form-control" Font-Bold="true"></asp:DropDownList>

                            <div>&nbsp;</div>
                        </div>
                        <div>
                            <asp:TextBox runat="server" ID="txtBoard" CssClass="form-control" Font-Bold="true" placeholder="Exam Board"></asp:TextBox>
                            <div>&nbsp;</div>
                        </div>
                        <div>
                            <asp:TextBox runat="server" ID="ContactNo" CssClass="form-control" Font-Bold="true" placeholder="Contact No" MaxLength="10"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtname"
                                CssClass=" pull-right" ErrorMessage="Contact No Required" ForeColor="Red" Font-Size="Smaller"
                                Display="Dynamic" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
                            <div>&nbsp;</div>
                        </div>
                        <div>
                            <asp:TextBox runat="server" ID="txtpass" Font-Bold="true" CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic"
                                ForeColor="Red" ControlToValidate="txtpass" ErrorMessage="Wrong Password Format"
                                Font-Size="Smaller" CssClass="pull-right  " ValidationExpression="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$"
                                ValidationGroup=""></asp:RegularExpressionValidator><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtpass"
                                CssClass="pull-right " ErrorMessage="Password Required" ForeColor="Red" Font-Size="Smaller"
                                Display="Dynamic" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div>
                            <asp:Button ID="btnEditprofile" runat="server" Font-Bold="true" CssClass="btn btn-success form-control" Text="Update" ValidationGroup="btnsubmit" OnClick="btnUpdate_Click" />
                        </div>
                        <div>&nbsp</div>
                        <div>
                            <asp:Button ID="btnCancel" runat="server" Font-Bold="true" CssClass="btn btn-success form-control" Text="Cancel" OnClick="btnCancel_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
