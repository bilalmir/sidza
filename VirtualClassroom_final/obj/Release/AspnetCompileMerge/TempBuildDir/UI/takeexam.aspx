<%@ Page Title="SIDZA-Take Test" Language="C#" MasterPageFile="~/UI/Home.Master"
     MetaKeywords="online test,self evaluation,exam,subjects,take your test" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="takeexam.aspx.cs" Inherits="VirtualClassroom_final.UI.takeexam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
        if (window.history && window.history.pushState) {
            history.pushState("nohb", null, "");
            $(window).on("popstate", function (event) {
                if (!event.originalEvent.state) {
                    history.pushState("nohb", null, "");
                    return;
                }
            });
        }
</script>
 <script type="text/javascript">
        $(document).ready(function () {
            $("label[for='ContentPlaceHolder1_rdAnswer1'] ").css("font-size", "20px");
            $("label[for='ContentPlaceHolder1_rdAnswer2'] ").css("font-size", "20px");
            $("label[for='ContentPlaceHolder1_rdAnswer3'] ").css("font-size", "20px");
            $("label[for='ContentPlaceHolder1_rdAnswer4'] ").css("font-size", "20px");            
        }); 
 </script>
   <script type="text/x-mathjax-config">
     MathJax.Hub.Config({
         showProcessingMessages: false,
        tex2jax: { inlineMath: [['$','$'],['\\(','\\)']] }
  });
</script>
    <script type="text/javascript" src="../MathJax-2.7.2/MathJax.js?config=TeX-MML-AM_HTMLorMML"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="row" style="margin-top:50px;">   
   <div class="col-md-10 col-md-offset-1">       
    <asp:Label ID="lblchk" runat="server" Font-Bold="true" ForeColor="Green" CssClass=" label-important pull-right"></asp:Label>       
     <asp:Label ID="Label2" runat="server" Text="Welcome to Online Objective Examination" Font-Bold="true" style="color:green;" Font-Size="Larger"></asp:Label><br /><br />
      <div id="tblselect" runat="server">  
         <table class="table table-responsive">
          <tr>
           <td> 
               <asp:Label ID="lblclassheading" runat="server" Text="Class Name" Font-Bold="true" Font-Size="Medium" ForeColor="white"></asp:Label>    
              <asp:DropDownList ID="ddlclass" runat="server"  Font-Bold="true" Font-Size="Medium" AutoPostBack="True" CssClass="btn-success form-control" ForeColor="White"
                        OnSelectedIndexChanged="ddlclass_SelectedIndexChanged"  style="border-color:Gray;" ClientIDMode="Static"></asp:DropDownList>
          </td>
          <td>                
            <asp:Label ID="lblsubjectheading" runat="server" Text="Subject Name" Font-Bold="true" Font-Size="Medium" ForeColor="white"></asp:Label>    
            <asp:DropDownList ID="ddlsubject" runat="server"  Font-Bold="true" Font-Size="Medium" AutoPostBack="True" CssClass="btn-success form-control" ForeColor="White"
                        style="border-color:Gray;" OnSelectedIndexChanged="ddlsubject_SelectedIndexChanged" ClientIDMode="Static"></asp:DropDownList>
         </td>
         <td>                
            <asp:Label ID="lblchapterheading" runat="server" Text="Chapter Name" Font-Bold="true" Font-Size="Medium" ForeColor="white"></asp:Label>    
            <asp:DropDownList ID="ddlchapter" runat="server"  Font-Bold="true" Font-Size="Medium" AutoPostBack="True" CssClass="btn-success form-control" ForeColor="White"
                        style="border-color:Gray;" OnSelectedIndexChanged="ddlchapter_SelectedIndexChanged" ClientIDMode="Static"></asp:DropDownList>
         </td>
         </tr>        
          <tr>
            <td colspan="3" align="center">
                <asp:Button ID="btntest" runat="server" Visible="false" Text="Start test" OnClick="btntest_Click" OnClientClick="javascript:blockConfirm();"
                CssClass="btn btn-primary" Font-Bold="true" Width="300" Font-Size="X-Large" ForeColor="white" />            
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <asp:Label ID="lblmsg1" runat="server" CssClass="offset1" Font-Bold="true"
            ForeColor="White"  Font-Size="Large"></asp:Label>
            </td>
        </tr>
      </table>
      </div>            
  </div>  
 </div> 
  <div class="row">
      <div class="col-md-10 col-md-offset-1">
          <div id="dv" runat="server" visible="false" style="margin-top: 10px;">
            <asp:Label ID="lblcls" CssClass="label label-primary" style="font-size:medium" runat="server"></asp:Label>
            <asp:TextBox ID="txtclass" CssClass="text-info disabled" runat="server" ReadOnly="true"></asp:TextBox>
            <asp:Label ID="lblsub" CssClass="label label-primary" style="font-size:medium" runat="server"></asp:Label>
            <asp:TextBox ID="txtsubject" CssClass=" text-info disabled" runat="server" ReadOnly="true"></asp:TextBox>
            <asp:Label ID="lblchapter" CssClass="label label-primary" style="font-size:medium" runat="server"></asp:Label>
            <asp:TextBox ID="txtchapter" CssClass=" text-info disabled" runat="server" ReadOnly="true"></asp:TextBox> 
         </div>
        <asp:Label ID="lblmsg" runat="server" Font-Bold="true" ForeColor="Blue" Font-Size="Larger"></asp:Label><br />
        <asp:Button ID="btnBack" runat="server" Visible="false" Text="Select New Paper"  OnClick="btnBack_Click" CssClass="btn btn-success" Font-Bold="true" Font-Size="Larger" ForeColor="white" />
      </div>
  </div>          
  <div class="row">
      <div class="col-md-10 col-md-offset-1">
        <div Class="img-rounded">
          <asp:Panel ID="pnlExam"  style="background-color:silver" runat="server" CssClass="panel" Font-Bold="true" Font-Size="Large" Visible="false"><br />
            <asp:Label ID="lblQuestionNo" Font-Bold="true" Font-Size="Larger" runat="server"></asp:Label>
            <asp:Label ID="lblQuestionDetail" Font-Bold="true" Font-Size="Larger" runat="server"></asp:Label><br /> 
            <asp:Image ID="imgDisplayImage" Visible="false" style="margin-left:10px;" runat="server" Height="266px" Width="434px" /><br /> 
           <div>         
            <asp:RadioButton ID="rdAnswer1" CssClass="radio-inline" runat="server" GroupName="rdQuestion"/>
            <asp:RadioButton ID="rdAnswer2" CssClass="radio-inline" runat="server" GroupName="rdQuestion"/>
           </div>
           <div>
            <asp:RadioButton ID="rdAnswer3" CssClass="radio-inline" runat="server" GroupName="rdQuestion"/>
            <asp:RadioButton ID="rdAnswer4" CssClass="radio-inline" runat="server" GroupName="rdQuestion"/>
           </div><br />       
            <asp:Button ID="btnnextquestion" runat="server" Font-Size="Larger" Width="200" Text="&nbsp;&nbsp;Next&nbsp;&nbsp;" CssClass="btn btn-primary offset3" OnClientClick="javascript:blockConfirm();" OnClick="btnnextquestion_Click"/>
            <asp:Button ID="btnEndExam" runat="server" Font-Size="Larger" Width="200" OnClientClick="javascript:blockConfirm();" Text="End Exam" CssClass="btn btn-danger" OnClick="btnEndExam_Click"/><br />
         </asp:Panel>          
       </div>
        <asp:Button ID="btnsubmit" runat="server" Text="Submit" Visible="false" Width="350" OnClick="btnsubmit_Click"
            CssClass="btn btn-info offset3" Font-Bold="true" Font-Size="X-Large"/>  
      </div>
  </div>
    
</asp:Content>
