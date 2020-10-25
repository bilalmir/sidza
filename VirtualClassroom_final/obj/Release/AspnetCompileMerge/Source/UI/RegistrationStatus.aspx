<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="RegistrationStatus.aspx.cs" Inherits="VirtualClassroom_final.UI.RegistrationStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="refresh" content="15;url=LogRegister.aspx" />
    <script type="text/javascript">
       
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="margin-top:50px;">   
   <div class="col-md-8 col-md-offset-2">   
       <div class="jumbotron" style="background-color:green;">  
       <h1 class="label" style="color:white">
          Registration Successfull.
       </h1>
       </div>
       <div class="well well-lg" style="background-color:green;color:white;font-size:large">
       <p>Thanks for Registration. An Email with the Registration link will be sent to you.</p>
       <br />       
       <p>You will be redirected to SIDZA automatically or you can <a href="LogRegister.aspx" style="color:yellow" runat="server">click here</a> to go to home Page.</p>
           </div>
   </div>
        </div>
</asp:Content>
