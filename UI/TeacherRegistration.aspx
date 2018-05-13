<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="TeacherRegistration.aspx.cs" Inherits="VirtualClassroom_final.UI.TeacherRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
        function openfileDialog() {
            $('#ContentPlaceHolder1_flupImage').click();
        }
    </script>
   <script type="text/javascript">
       function UploadFile(fileUpload) {
           if (fileUpload.value != '') {              
               $('#ContentPlaceHolder1_btnUploadProfilepic').click();
        }
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <div class="row" style="margin-top:50px;">   
   <div class="col-md-8 col-md-offset-2">       
       <div class="modal-dialog">
           <div class="modal-content">
               <div class="modal-header">
                    <h3 class="modal-title">Tutor Registration</h3> 
               </div>
               <div class="modal-body">
                   <div align="center">
                       <%--<asp:ImageButton runat="server" ID="imgprofile" CssClass="img-circle img-responsive" ImageUrl="~/img/profile.png" Width="100" Height="100" />--%>
                       <img src="../img/profile.png" runat="server" id="imgProfile" width="100" height="120" class="img-thumbnail img-responsive" onclick="openfileDialog();" />
                       <asp:FileUpload id="flupImage"  runat="server" style="display:none;"/>
                       <asp:Button ID="btnUploadProfilepic" style="display:none;" runat="server" Text="Upload Profile Picture"  CssClass="btn btn-info" OnClick="btnUploadProfilepic_Click" />
                       
                   </div>
                   <div><asp:TextBox runat="server" ID="txtname" CssClass="form-control" Font-Bold="true"  placeholder="User Name"></asp:TextBox></div>
                   <div><asp:TextBox runat="server" ID="txtemail" CssClass="form-control" Font-Bold="true"  placeholder="Email"></asp:TextBox></div>
                   <div><asp:DropDownList ID="drpTutorSubject" runat="server" CssClass="form-control" Font-Bold="true"></asp:DropDownList></div>
                   <div> <asp:TextBox runat="server" ID="txtQualification1" CssClass="form-control" Font-Bold="true" placeholder="Qualification First"></asp:TextBox></div>
                   <div> <asp:TextBox runat="server" ID="txtQualification2" CssClass="form-control" Font-Bold="true" placeholder="Qualification Second"></asp:TextBox></div>
                   <div> <asp:TextBox runat="server" ID="txtQualification3" CssClass="form-control" Font-Bold="true" placeholder="Qualification Third"></asp:TextBox></div>
                   <div><asp:TextBox ID="txtaddress" runat="server" CssClass="form-control" placeholder="Address" Font-Bold="true"></asp:TextBox></div>
                   <div><asp:TextBox ID="txtContact" runat="server" CssClass="form-control" placeholder="contact no" Font-Bold="true"></asp:TextBox></div>
                   <div><asp:TextBox runat="server" ID="txtpass" Font-Bold="true"  CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox></div>
                   <div><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ControlToValidate="txtname"
                            CssClass=" pull-right" ErrorMessage="* Name Required" ForeColor="Red" Font-Size="Smaller"
                            Display="Static" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator><br />                 
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  ControlToValidate="txtemail"
                            CssClass=" pull-right" ErrorMessage="* Email Required" ForeColor="Red" Font-Size="Smaller"
                            Display="Static" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator><br />                
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"  ControlToValidate="txtpass"
                        CssClass="pull-right " ErrorMessage="* Password Required" ForeColor="Red" Font-Size="Smaller"
                        Display="Static" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator><br />   
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  ControlToValidate="txtQualification1"
                        CssClass="pull-right " ErrorMessage="* Qualification Required" ForeColor="Red" Font-Size="Smaller"
                        Display="Static" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator><br />   
                        <asp:RegularExpressionValidator ID="rglrexprsn" runat="server" ForeColor="Red"  ControlToValidate="txtemail"
                            ErrorMessage="* Wrong Email Format" CssClass=" pull-right" ValidationExpression='\w+([-+.&#039;]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*'
                            ValidationGroup="btnsubmit" Font-Size="Smaller"></asp:RegularExpressionValidator><br />
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1"  runat="server" Display="Static"
                            ForeColor="Red" ControlToValidate="txtpass" ErrorMessage="* Wrong Password Format"
                            Font-Size="Smaller" CssClass="pull-right  " ValidationExpression="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$"
                            ValidationGroup=""></asp:RegularExpressionValidator>                       
                 </div>
               </div>
               <div class="modal-footer">
                     <asp:Button ID="btnregister" runat="server" Font-Bold="true" CssClass="btn btn-success form-control"  Text="Register" ValidationGroup="btnsubmit" OnClick="btnregister_Click" />
               </div>
           </div>
       </div>
 </div>
</div>        

</asp:Content>
