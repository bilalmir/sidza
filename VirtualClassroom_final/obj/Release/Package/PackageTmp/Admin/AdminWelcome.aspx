<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminWelcome.aspx.cs" Inherits="VirtualClassroom_final.UI.AdminWelcome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="row"  style="margin-top:150px;margin-left:5%;">
       <div class="col-md-11">
           
        <asp:Label ID="lblmsg2" runat="server"  CssClass="label-important" Font-Bold="true"></asp:Label>        
       <asp:Label ID="lblmsg" runat="server" CssClass="label-important" Font-Bold="true"></asp:Label>
        <asp:Image runat="server" ImageUrl="~/img/Bookkeeping-Admin-Services-Barnsley-South-Yorkshire-Admin-Page.jpg" CssClass="img-responsive img-thumbnail"/> 
    <asp:HiddenField ID="hdnadmininfo" runat="server" />
              
       </div>
   </div>
   

</asp:Content>
