<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Home.Master" CodeBehind="ResetPassWord.aspx.cs"  Inherits="VirtualClassroom_final.UI.ResetPassWord" %>
 <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
</asp:Content>
  <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="margin-top:50px;">   
      <div class="col-md-8 col-md-offset-2">       
      <div>
        <table class="table table-responsive" style="width: 50px; height: 70px; margin-left: 200px;
            margin-top: 150px;">
            <tr>
            <th>Reset Password</th>            
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" placeholder="New Password" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtpassword" ErrorMessage="Required Field"
                        ForeColor="Red" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtconfirmpassword" runat="server" CssClass="form-control" placeholder="Confirm Password"
                        TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                            runat="server" ControlToValidate="txtconfirmpassword" ErrorMessage="Required Field"
                            ForeColor="Red" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator><br />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Mismatch" ForeColor="Red" ValidationGroup="btnsubmit"
                        ControlToCompare="txtpassword" ControlToValidate="txtconfirmpassword" ></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnsumbit" runat="server" Text="Submit" CssClass="btn btn-success form-control"
                        OnClick="btnsumbit_Click" ValidationGroup="btnsubmit" />
                </td>
            </tr>
        </table>
      <div style="text-align:center"><span class="glyphicon glyphicon-warning-sign"></span> <asp:Label ID="lblmsg" runat="server" CssClass="label label-danger"></asp:Label></div>
    </div>
     </div>
   </div> 
  </asp:Content>