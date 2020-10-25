<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="VirtualClassroom_final.UI.Register" %>
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
                    <h3 class="modal-title">Student Registration</h3> 
               </div>
               <div class="modal-body">
                   <div align="center">
                       <%--<asp:ImageButton runat="server" ID="imgprofile" CssClass="img-circle img-responsive" ImageUrl="~/img/profile.png" Width="100" Height="100" />--%>
                       <img src="../img/profile.png" runat="server" id="imgProfile" width="100" height="120" class="img-thumbnail img-responsive" onclick="openfileDialog();" />
                       <asp:FileUpload id="flupImage"  runat="server" style="display:none;"/>
                       <asp:Button ID="btnUploadProfilepic" style="display:none;" runat="server" Text="Upload Profile Picture"  CssClass="btn btn-info" OnClick="btnUploadProfilepic_Click" />
                        <div>&nbsp;</div>
                   </div>
                   <div>
                       <asp:TextBox runat="server" ID="txtname" CssClass="form-control" Font-Bold="true"  placeholder="User Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ControlToValidate="txtname"
                            CssClass=" pull-right" ErrorMessage="Name Required" ForeColor="Red" Font-Size="Smaller"
                            Display="Dynamic" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
                   </div>
                   <div>
                       <asp:TextBox runat="server" ID="txtemail" CssClass="form-control" Font-Bold="true"  placeholder="Email"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  ControlToValidate="txtemail"
                            CssClass=" pull-right" ErrorMessage="Email Required" ForeColor="Red" Font-Size="Smaller"
                            Display="Dynamic" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rglrexprsn" runat="server" ForeColor="Red"  ControlToValidate="txtemail"
                            ErrorMessage="Wrong Email Format" CssClass=" pull-right" ValidationExpression='\w+([-+.&#039;]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*'
                            ValidationGroup="btnsubmit" Font-Size="Smaller"></asp:RegularExpressionValidator>
                   </div>
                   <div>
                     <asp:DropDownList ID="ddlclass" runat="server" CssClass="form-control" Font-Bold="true"></asp:DropDownList>  
                       <div>&nbsp;</div>
                   </div>
                   <div>
                         <asp:TextBox runat="server" ID="txtBoard" CssClass="form-control"  Font-Bold="true" placeholder="Exam Board"></asp:TextBox>  
                        <div>&nbsp;</div>
                   </div>
                   <div>
                       <asp:TextBox runat="server" ID="txtpass" Font-Bold="true"  CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1"  runat="server" Display="Dynamic"
                            ForeColor="Red" ControlToValidate="txtpass" ErrorMessage="Wrong Password Format"
                            Font-Size="Smaller" CssClass="pull-right  " ValidationExpression="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$"
                            ValidationGroup=""></asp:RegularExpressionValidator><br />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"  ControlToValidate="txtpass"
                        CssClass="pull-right " ErrorMessage="Password Required" ForeColor="Red" Font-Size="Smaller"
                        Display="Dynamic" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
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
