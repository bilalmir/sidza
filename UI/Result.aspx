<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" EnableViewStateMac="false" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="VirtualClassroom_final.UI.Result" %>

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
        <div class="col-md-6 col-md-offset-3">
            <asp:Label ID="lblchk" runat="server" Font-Bold="true" ForeColor="White" CssClass=" label-important pull-right"></asp:Label>
            <h3 style="color:green;font-size:larger">Result of Self Evaluatory Objective Questions</h3>
            <asp:Label ID="lblmsg" runat="server" CssClass="badge" Font-Size="Larger" Font-Bold="true"></asp:Label><br /><br />
        
        <div id="rslt" runat="server" visible="false" class="table table-bordered table-responsive">
            <div style="padding-top:15px;padding-left:10px;padding-right:10px;">
                <asp:Label ID="Label1" runat="server" CssClass="label label-info" Text="Name : " Font-Size="Large" Font-Bold="true"></asp:Label>
                <asp:Label ID="lblname" runat="server" CssClass="label label-success pull-right" Font-Size="Large" Font-Bold="true"></asp:Label>
            </div>
           <%-- <div style="padding-top:15px;padding-left:10px;padding-right:10px;">
                <asp:Label ID="Label2" runat="server" CssClass="label label-info" Text="User ID : " Font-Size="Large" Font-Bold="true"></asp:Label>
                <asp:Label ID="lblid" runat="server" CssClass="label label-success pull-right" Font-Size="Large" Font-Bold="true"></asp:Label>
            </div>--%>
            <div style="padding-top:15px;padding-left:10px;padding-right:10px;">
                <asp:Label ID="Label3" runat="server" CssClass="label label-info" Font-Size="Large" Text="Class : " Font-Bold="true"></asp:Label>
                <asp:Label ID="lblcls" runat="server" CssClass="label label-success pull-right" Font-Size="Large" Font-Bold="true"></asp:Label>
            </div>
            <div style="padding-top:15px;padding-left:10px;padding-right:10px;">
               <asp:Label ID="Label4" runat="server" CssClass="label label-info" Font-Size="Large" Text="Subject : " Font-Bold="true"></asp:Label>
               <asp:Label ID="lblsub" runat="server" CssClass="label label-success pull-right" Font-Size="Large" Font-Bold="true"></asp:Label>
            </div>
            <div style="padding-top:15px;padding-left:10px;padding-right:10px;">
                <asp:Label ID="Label7" runat="server" CssClass="label label-info" Font-Size="Large" Text="Chapter : " Font-Bold="true"></asp:Label>
                <asp:Label ID="lblchapter" runat="server" CssClass="label label-success pull-right" Font-Size="Large" Font-Bold="true"></asp:Label><br />
            </div>
            <div style="padding-top:15px;padding-left:10px;padding-right:10px;">
                <asp:Label ID="Label8" runat="server" CssClass="label label-info" Font-Size="Large" Text="No of Questions Attempted : " Font-Bold="true"></asp:Label>
                <asp:Label ID="lblQuestionsAttempted" runat="server" CssClass="label label-success pull-right" Font-Size="Large" Font-Bold="true"></asp:Label><br />
            </div>
            <div style="padding-top:15px;padding-left:10px;padding-right:10px;">
                <asp:Label ID="Label9" runat="server" CssClass="label label-info" Font-Size="Large" Text="Wrong Answered Questions : " Font-Bold="true"></asp:Label>
                <asp:Label ID="lblWrongAnswered" runat="server" CssClass="label label-success pull-right" Font-Size="Large" Font-Bold="true"></asp:Label><br />
            </div>
            <div style="padding-top:15px;padding-left:10px;padding-right:10px;">
                <asp:Label ID="Label10" runat="server" CssClass="label label-info" Font-Size="Large" Text="Correct Answered Questions : " Font-Bold="true"></asp:Label>
                <asp:Label ID="lblCorrectAnswered" runat="server" CssClass="label label-success pull-right" Font-Size="Large" Font-Bold="true"></asp:Label><br />
            </div>
            <div style="padding-top:15px;padding-left:10px;padding-right:10px;padding-bottom:10px;">
                <asp:Label ID="Label5" runat="server" CssClass="label label-info" Font-Size="Large" Text="Score (%age) : " Font-Bold="true"></asp:Label>
                <asp:Label ID="lblsecured" runat="server"  CssClass="label " Font-Size="Large" Font-Bold="true"></asp:Label><br />
            </div> 
        </div>  
        </div>
    </div>
    <div class="row" style="margin-top:10px;margin-left:10px;margin-bottom:30px">        
        <div class="col-md-11"> 
            <h3 style="color:green;font-size:larger;">Question Answer Analysis</h3>
          <div class="table table-bordered table-responsive">   
             <asp:Panel ID="pnlShowAnsInfo" runat="server" style="text-wrap:normal;"></asp:Panel>              
           </div>                 
          <asp:Button ID="btnRetakeTest" runat="server" Text="Retake Test" Font-Bold="true" Font-Size="X-Large" OnClick="btnRetakeTest_Click" CssClass=" btn btn-primary offset4"/>
        </div>     
  </div> 
</asp:Content>
