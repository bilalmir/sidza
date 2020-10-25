<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="TeacherEditProfile.aspx.cs" Inherits="VirtualClassroom_final.UI.TeacherEditProfile" %>
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
                   $('#ContentPlaceHolder1_btnUploadProfilepic').click();
               }
           }
</script>
 <script type="text/javascript">
     $(document).ready(function () {        
         $("#ContentPlaceHolder1_ContactNo").keypress(function (e) {            
             if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {               
                 alert("Only Digits Are Allowed");
                 return false;
             }
         });
     });    
 </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row" style="margin-top:60px;">
         <div class="col-md-8 col-md-offset-2">     
             <div class="modal-dialog">
                     <div class="modal-content">
                        <div class="modal-header">
                             <h3 class="modal-title">Edit profile</h3> 
                         </div>
                        <div class="modal-body">
                     <div align="center">
                         <img src="../img/profile.png" runat="server" id="imgProfile" width="100" height="120" class="img-thumbnail img-responsive"  />
                        <div><a href="#" data-target="#RemovePic" data-toggle="modal" data-backdrop="false" style="color:green;" ID="lnkRemovePic" runat="server"><span class="glyphicon glyphicon-trash"   ></span> Remove/</a>
                             <a href="#" style="color:green;" ID="lnkChangePic" runat="server" onclick="openfileDialogChange();"><span class="glyphicon glyphicon-edit"  ></span > Change</a>
                           <asp:FileUpload id="flechImage"  runat="server" style="display:none;"/>
                            <asp:Button ID="btnChangeProfilepic" style="display:none;" runat="server" Text="Change Profile Pic"  CssClass="btn btn-info" OnClick="btnChangeProfilepic_Click" />
                            <a href="#" style="color:green;" ID="lnkUploadPic" runat="server" OnClick="openfileDialogUpload();"><span class="glyphicon glyphicon-upload"  ></span> Upload Pic</a></div>
                            <asp:FileUpload id="FleUplImage"  runat="server" style="display:none;"/>
                            <asp:Button ID="btnUploadProfilepic" style="display:none;" runat="server" Text="Upload Profile Pic"  CssClass="btn btn-info" OnClick="UploadProfilepic_Click" />
                            <div class="modal fade" id="RemovePic" tabindex="-1">
                                       <div class="modal-dialog">
                                           <div class="modal-content">
                                               <div class="modal-header">                                        
                                                   
                                                     <h4 class="modal-title glyphicon glyphicon-warning-sign" style="color:red">  Warning</h4>
                                               </div>
                                               <div class="modal-body">
                                                   <span class="glyphicon glyphicon-user"></span>
                                                   <asp:Label ID="lblloginStatus" runat="server"  ForeColor="green" Text="Are You Sure To Remove Your Profile Picture"></asp:Label>                                
                                               </div>
                                               <div class="modal-footer">
                                                   <asp:Button ID="btnYes" runat="server"  CssClass="btn btn-success" ForeColor="green" Text="Yes" OnClick="RemoveProfilepic_Click"  />
                                                   <asp:Button ID="Button1" runat="server"  CssClass="btn btn-success" ForeColor="green" Text="No"   />  
                                               </div>
                                           </div>
                                        </div>
                        </div>    
                   </div>
                   <div>
                       <asp:TextBox runat="server" ID="txtname" CssClass="form-control" Font-Bold="true"  placeholder="User Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ControlToValidate="txtname"
                            CssClass=" pull-right" ErrorMessage="Name Required" ForeColor="Red" Font-Size="Smaller"
                            Display="Static" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
                   </div>
                   <div>
                     <asp:TextBox ID="txtsubject" runat="server" CssClass="form-control" placeholder="Subject" Font-Bold="true"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  ControlToValidate="txtsubject"
                            CssClass=" pull-right" ErrorMessage="* Subject Required" ForeColor="Red" Font-Size="Smaller"
                            Display="Static" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
                       <div>&nbsp;</div>
                   </div>
                   <div>
                         <asp:TextBox runat="server" ID="txtqualification" CssClass="form-control"  Font-Bold="true" placeholder="Qualification"></asp:TextBox>
                   </div>
                             <div>&nbsp</div>
                   <div>
                         <asp:TextBox runat="server" ID="txtaddress" CssClass="form-control"  Font-Bold="true" placeholder="Address"></asp:TextBox>
                         
                        <div>&nbsp;</div>
                   </div>
                    <div>
                         <asp:TextBox runat="server" ID="ContactNo" CssClass="form-control"  Font-Bold="true" placeholder="Contact No" MaxLength="10"></asp:TextBox> 
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  ControlToValidate="txtname"
                            CssClass=" pull-right" ErrorMessage="Contact No Required" ForeColor="Red" Font-Size="Smaller"
                            Display="Static" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
                        <div>&nbsp;</div>
                   </div>
                   <div>
                       <asp:TextBox runat="server" ID="txtpass" Font-Bold="true"  CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1"  runat="server" Display="Static"
                            ForeColor="Red" ControlToValidate="txtpass" ErrorMessage="Wrong Password Format"
                            Font-Size="Smaller" CssClass="pull-right  " ValidationExpression="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$"
                          ValidationGroup=""></asp:RegularExpressionValidator><br />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"  ControlToValidate="txtpass"
                        CssClass="pull-right " ErrorMessage="Password Required" ForeColor="Red" Font-Size="Smaller"
                        Display="Static" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
                   </div>
               </div>
                        <div class="modal-footer">
                             <div> <asp:Button ID="btnEditprofile" runat="server" Font-Bold="true" CssClass="btn btn-success form-control"  Text="Update" ValidationGroup="btnsubmit" OnClick="btnUpdate_Click" /></div>
                              <div>&nbsp</div>
                              <div><asp:Button ID="btnCancel" runat="server" Font-Bold="true" CssClass="btn btn-success form-control"  Text="Cancel" OnClick="btnCancel_Click"/></div>
          
                         </div>
                     </div>
                 </div>
         </div>
     </div>
</asp:Content>
