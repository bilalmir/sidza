<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="studymaterial.aspx.cs" Inherits="VirtualClassroom_final.UI.studymaterial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .btnsize{
            color: white; 
            font-size: x-large; 
            width: 400px;
            background-color:black !important;
            opacity:0.9;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="background-image: url('../img/elearning.jpg');background-position:center; width: 2000px; height: 800px; max-height: 100%; opacity: 0.9; max-width: 100%; margin-left: 0px; background-repeat: no-repeat;">
        <div style="margin-top:200px;"></div>
        <div class="col-md-4 col-md-offset-4">
            <a href="QuestionsPapers.aspx" runat="server" class="btn btn-success btnsize">Download Question Papers Here</a>
            <div>&nbsp;</div>
            <a href="Syllabus.aspx" runat="server" class="btn btn-success btnsize">Download Syllabus Here</a>
        </div>
    </div>
</asp:Content>
