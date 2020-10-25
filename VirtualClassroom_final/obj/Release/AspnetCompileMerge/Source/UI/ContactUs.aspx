<%@ Page Title="SIDZA-Contact Us" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="VirtualClassroom_final.UI.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="row" style="margin-left:5px;margin-top:50px;">
    <div class="col-md-4">
     <a href="LogRegister.aspx" runat="server">Go to Home Page</a>
          <h3 style="color:green;font-size:large">Our Location</h3>
            <div style="height:100%;width:100%;">       
                <iframe src="https://www.google.com/maps/embed?q=%2B33%C2%B0+56'+36.83%4,+74%C2%B0+47'+46.04%64&ie=UTF-8" style="height:400px;width:100%;"></iframe>    
            </div>
    </div>
    <div class="col-md-6 col-md-offset-1">     
         <h3 style="color:green;font-size:large;">Query Us</h3>
                        <table class="table table-bordered table-responsive">
                            <tr>
                                <td>
                                    <asp:Label ID="lblName" CssClass="label label-primary" runat="server" Text="Name"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="Rf33" runat="server" ErrorMessage="Required" ControlToValidate="txtname" ForeColor="#990000" />
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblEmail" CssClass="label label-primary" runat="server" Text="Email ID"></asp:Label></td>
                                <td>
                                    <asp:TextBox ID="txtemail" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="Rf2" runat="server" ForeColor="#990000" ErrorMessage="Required" ControlToValidate="txtEmail" />
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblContact" CssClass="label label-primary" runat="server" Text="Contact Number"></asp:Label></td>
                                <td>
                                    <asp:TextBox ID="txtContact" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator  runat="server" ForeColor="#990000" ErrorMessage="Required" ControlToValidate="txtContact" />
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblMessage" CssClass="label label-primary" runat="server" Text="Message"></asp:Label></td>
                                <td>
                                    <asp:TextBox ID="txtMessage" runat="server" Height="95px" CssClass="form-control" TextMode="MultiLine"></asp:TextBox></td>

                            </tr>
                        </table>
                      <div>
                            <asp:Button ID="btnSendMsg" runat="server" Text="Send Message" CssClass="button" OnClick="btnSendMsg_Click" /><br />
                                        &nbsp;
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtemail" ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" runat="server" ForeColor="#990000" ErrorMessage="Email not valid" Display="Dynamic"></asp:RegularExpressionValidator><br />
                                        <asp:RequiredFieldValidator ID="Rf1" runat="server" ForeColor="#990000" ErrorMessage="Message Required" ControlToValidate="txtMessage" /><br />
                                        <asp:Label ID="lblresp" runat="server" CssClass="lblresponse" />
                      </div>
   </div>
  </div>      
  <div class="row" style="margin-left:5px;margin-top:10px;margin-bottom:20px;">
               <div class="col-md-3">
                    <h3 style="color:green;font-size:larger;font:bold;">Contact Information</h3>
                        <label class="label label-primary">Query Email  :</label>&nbsp;&nbsp;<label class="label label-success"><span class="glyphicon glyphicon-pencil"></span> sidza999@gmail.com</label> 
                        <label class="label label-primary">Owner Email  :</label>&nbsp;&nbsp;<label class="label label-success"><span class="glyphicon glyphicon-pencil"></span> chemicalbilal@rediffmail.com</label> 
                        <label class="label label-primary">Owner Name  :</label>&nbsp;&nbsp;<label class="label label-success"><span class="glyphicon glyphicon-user"></span> BILAL AHMAD KHAWAJA</label>                             
                </div>
            </div> 
</asp:Content>
