<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="VirtualClassroom_final.UI.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top:10px;margin-bottom:80px;height:100%"><br /><br />
         <table align="center" class="muted">
             <tr>
                 <td  align="center">
                      <asp:Label runat="server" Text="Register here" Width="100%" Font-Bold="true" Font-Size="Larger" BackColor="#49b846" ForeColor="WhiteSmoke"></asp:Label>
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
                      <asp:Label ID="Label5" runat="server" Text="Select Type of User"></asp:Label>
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
                     <asp:Literal ID="ltrl" runat="server" Text="Teacher"></asp:Literal>
                     <asp:RadioButton ID="rdoTeacher" runat="server" OnCheckedChanged="rdoTeacher_CheckedChanged"  GroupName="UserType" AutoPostBack="true" />
                
                     <asp:Literal ID="Literal1" runat="server" Text="Student"></asp:Literal>
                     <asp:RadioButton ID="rdoStudent" runat="server" Checked="true" OnCheckedChanged="rdoStudent_CheckedChanged" GroupName="UserType"  AutoPostBack="true"/>
                 
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
                        <asp:TextBox runat="server" ID="txtname" CssClass="" Font-Bold="true"  Height="30px"
                            Width="250px" placeholder="User Name"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ControlToValidate="txtname"
                            CssClass=" pull-right" ErrorMessage="Name Required" ForeColor="Red" Font-Size="Smaller"
                            Display="Static" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    
                    <td align="center">
                        <asp:TextBox runat="server" ID="txtemail" CssClass="" Font-Bold="true"  Height="30px"
                            Width="250px" placeholder="Email" Style="margin-top: 5px;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RegularExpressionValidator ID="rglrexprsn" runat="server" ForeColor="Red"  ControlToValidate="txtemail"
                            ErrorMessage="Wrong Email Format" CssClass=" pull-right" ValidationExpression='\w+([-+.&#039;]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*'
                            ValidationGroup="btnsubmit" Font-Size="Smaller"></asp:RegularExpressionValidator>
                    </td>
                </tr>
             <tr>
                
                 <td align="center">
                      <asp:TextBox runat="server" ID="txtcontact" CssClass="" Visible="false"  Font-Bold="true" Height="30px"
                            Width="250px" placeholder="Contact No" Style="margin-top: 5px;"></asp:TextBox>                        
                 </td>
                 <td>

                 </td>
             </tr>
             <tr>
                 
                 <td align="center">
                   <%--   <asp:TextBox runat="server" ID="txtGrade" CssClass=""  Font-Bold="true" Height="30px"
                            Width="250px" placeholder="Enter Grade" Style="margin-top: 5px;"></asp:TextBox>  --%>
                      <asp:DropDownList ID="ddlclass" runat="server" Width="250" Font-Bold="true" Height="30px" Style="margin-top: 5px;"></asp:DropDownList>  
                 </td>
                 <td>

                 </td>
             </tr>
                <tr>
                    
                    <td align="center">
                        <asp:TextBox runat="server" ID="txtpass" Font-Bold="true"  CssClass="" TextMode="Password"
                            Height="30px" Width="250px" placeholder="Password" Style="margin-top: 5px;"></asp:TextBox>
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
                      <asp:Button ID="btnregister" runat="server" Width="150"  Font-Bold="true" CssClass="btn btn-success"
                            Text="Register" ValidationGroup="btnsubmit" OnClick="btnregister_Click" />
                    </td>
                 <td></td>
                </tr>
            </table>
        </div>
    
</asp:Content>
