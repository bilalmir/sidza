<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="VirtualClassroom_final.UI.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="row" style="margin-top:50px;">   
   <div class="col-md-8 col-md-offset-2">       
         <table align="center" class="table-responsive">
             <tr>
                 <td  align="center">
                      <asp:Label runat="server" Text="Register here" CssClass="label label-success img-rounded" Font-Bold="true" Font-Size="X-Large"></asp:Label>
                 </td>
                 <td></td>
             </tr>
             <tr>
                 <td colspan="2">
                     &nbsp;
                 </td>
             </tr>
             <tr>
                 <td  align="center">
                      <asp:Label ID="Label5" runat="server" CssClass="label label-primary img-rounded" style="font-size:larger" Text="Select Type of User"></asp:Label>
                 </td>
                 <td></td>
             </tr>
              <tr>
                 <td colspan="2">
                     &nbsp;
                 </td>
             </tr>
            <tr>
                 <td align="center">
                  <div class="radio-inline">
                     <asp:RadioButton ID="rdoTeacher" CssClass="" runat="server" OnCheckedChanged="rdoTeacher_CheckedChanged" Text="Teacher"  GroupName="UserType" AutoPostBack="true" />                   
                     <asp:RadioButton ID="rdoStudent" CssClass="" style="margin-left:20px;" runat="server" Checked="true" Text="Student" OnCheckedChanged="rdoStudent_CheckedChanged" GroupName="UserType"  AutoPostBack="true"/>
                 </div>                   
                 </td>
                <td></td>
             </tr>
             <tr>
                 <td >
                    <hr/>                     
                 </td>
                 <td></td>
             </tr>
                <tr>
                  
                    <td  align="center">
                        <asp:TextBox runat="server" ID="txtname" CssClass="form-control" Font-Bold="true"  placeholder="User Name"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ControlToValidate="txtname"
                            CssClass=" pull-right" ErrorMessage="Name Required" ForeColor="Red" Font-Size="Smaller"
                            Display="Static" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    
                    <td align="center">
                        <asp:TextBox runat="server" ID="txtemail" CssClass="form-control" Font-Bold="true"  placeholder="Email"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RegularExpressionValidator ID="rglrexprsn" runat="server" ForeColor="Red"  ControlToValidate="txtemail"
                            ErrorMessage="Wrong Email Format" CssClass=" pull-right" ValidationExpression='\w+([-+.&#039;]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*'
                            ValidationGroup="btnsubmit" Font-Size="Smaller"></asp:RegularExpressionValidator>
                    </td>
                </tr>
             <tr>
                
                 <td align="center">
                      <asp:TextBox runat="server" ID="txtcontact" CssClass="form-control" Visible="false"  Font-Bold="true" placeholder="Contact No"></asp:TextBox>                        
                 </td>
                 <td>

                 </td>
             </tr>
             <tr>
                 
                 <td align="center">
                   <%--   <asp:TextBox runat="server" ID="txtGrade" CssClass=""  Font-Bold="true" Height="30px"
                            Width="250px" placeholder="Enter Grade" Style="margin-top: 5px;"></asp:TextBox>  --%>
                      <asp:DropDownList ID="ddlclass" runat="server" CssClass="form-control" Font-Bold="true"></asp:DropDownList>  
                 </td>
                 <td>

                 </td>
             </tr>
                <tr>
                    
                    <td align="center">
                        <asp:TextBox runat="server" ID="txtpass" Font-Bold="true"  CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
                      </td>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1"  runat="server" Display="Static"
                            ForeColor="Red" ControlToValidate="txtpass" ErrorMessage="Wrong Password Format"
                            Font-Size="Smaller" CssClass="pull-right  " ValidationExpression="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$"
                            ValidationGroup=""></asp:RegularExpressionValidator><br />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"  ControlToValidate="txtpass"
                        CssClass="pull-right " ErrorMessage="Password Required" ForeColor="Red" Font-Size="Smaller"
                        Display="Static" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
                    </td>
                </tr>   

             <tr>
                    <td  align="center">
                      <asp:Button ID="btnregister" runat="server" style="margin-left:10%;" Font-Bold="true" CssClass="btn btn-success"
                            Text="Register" ValidationGroup="btnsubmit" OnClick="btnregister_Click" />
                    </td>
                 <td></td>
                </tr>
            </table>
 </div>
</div>        
</asp:Content>
