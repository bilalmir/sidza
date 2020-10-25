<%@ Page Title="SIDZA-Articles and NEWS" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true"
     MetaKeywords="articles,news,CBSE news,JKBOSE News,notifications,smart classes,smart classroom" CodeBehind="Articles.aspx.cs" Inherits="VirtualClassroom_final.UI.Articles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script>
      function resizeIframe(obj) {
          obj.style.height = 0;
          obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';       
    }
 </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
      <div class="col-md-11" style="margin-top:50px;"">
          <div>
              <a href="LogRegister.aspx" runat="server" style="margin-left:60px;"><span class="glyphicon glyphicon-home"></span> Home</a>
              /<a href="LogRegister.aspx" runat="server" id="lnkartnews">Articles and News</a>
              /<a href="#" runat="server" class="btn btn-link" id="lnkinfo"></a>
          </div>
            <div class="jumbotron text-justify" id="showpdf" style="background-color:white" runat="server">
            </div> 
      </div>
   </div>        
   
</asp:Content>
