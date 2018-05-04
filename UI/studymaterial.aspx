<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="studymaterial.aspx.cs" Inherits="VirtualClassroom_final.UI.studymaterial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="row" style="margin-top:200px;margin-left:10px;">
    <div class="col-md-6">    
           <a href="QuestionsPapers.aspx" runat="server" style="color:white;font-size:x-large;width:400px;" class="btn btn-success pull-right">Download Question Papers Here</a>
    </div>
     <div class="col-md-6">
          <a href="Syllabus.aspx" runat="server" style="color:white;font-size:x-large;width:400px;" class="btn btn-success pull-left">Download Syllabus Here</a>    
    </div>
</div>
</asp:Content>
