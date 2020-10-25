<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="VirtualClassroom_final.UI.Result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div style="height:100%;margin-bottom:300px;">
        <%--  <asp:Label ID="Label1" runat="server" Text="Result-Theoretical" CssClass="muted offset6"
            Font-Bold="true" Font-Size="XX-Large"></asp:Label>--%>
        <asp:Label ID="lblchk" runat="server" Font-Bold="true" ForeColor="White" CssClass=" label-important pull-right"></asp:Label>
        <div class=" hero-unit" style="margin-top: -30px; background-color:White;">
        <asp:Label runat="server" Text="Result of Self Evaluatory Objective Questions" CssClass="muted" Font-Underline="true" Font-Bold="true" Font-Size="Larger" style="margin-left:400px;"></asp:Label><br />
            <asp:Label ID="lblmsg" runat="server" CssClass="badge" Font-Size="Larger" Font-Bold="true"></asp:Label><br /><br />
        
        <div id="rslt" runat="server" visible="false" style="width:290px; margin-left:350px;margin-top:-40px;border:double;border-color:blue;border-width:4px;" >
            <asp:Label ID="Label1" runat="server" CssClass="badge badge-info" Text="Name : " Font-Size="Large" Font-Bold="true"></asp:Label>
            <asp:Label ID="lblname" runat="server" CssClass="badge badge-success" Font-Size="Large" Font-Bold="true"></asp:Label><br />

            <asp:Label ID="Label2" runat="server" CssClass="badge badge-info" Text="User ID : " Font-Size="Large" Font-Bold="true"></asp:Label>
            <asp:Label ID="lblid" runat="server" CssClass="badge badge-success" Font-Size="Large" Font-Bold="true"></asp:Label><br />

            <asp:Label ID="Label3" runat="server" CssClass="badge badge-info" Font-Size="Large" Text="Class : " Font-Bold="true"></asp:Label>
            <asp:Label ID="lblcls" runat="server" CssClass="badge badge-success" Font-Size="Large" Font-Bold="true"></asp:Label><br />

            <asp:Label ID="Label4" runat="server" CssClass="badge badge-info" Font-Size="Large" Text="Subject : " Font-Bold="true"></asp:Label>
            <asp:Label ID="lblsub" runat="server" CssClass="badge badge-success" Font-Size="Large" Font-Bold="true"></asp:Label><br />

            <asp:Label ID="Label7" runat="server" CssClass="badge badge-info" Font-Size="Large" Text="Chapter : " Font-Bold="true"></asp:Label>
            <asp:Label ID="lblchapter" runat="server" CssClass="badge badge-success" Font-Size="Large" Font-Bold="true"></asp:Label><br />

            <asp:Label ID="Label5" runat="server" CssClass="badge badge-info" Font-Size="Large" Text="Score : " Font-Bold="true"></asp:Label>
            <asp:Label ID="lblsecured" runat="server"  Font-Size="Large" Font-Bold="true"></asp:Label><br />

            <asp:Label ID="Label6" runat="server" CssClass="badge badge-info" Font-Size="Large" Text="Final Result : " Font-Bold="true"></asp:Label>
            <asp:Label ID="lblresult" runat="server" Font-Size="Large" Font-Bold="true"></asp:Label>          

        </div>
    
      <div style="margin-top:15px;margin-left:120px;"> 
          <asp:Label ID="lblinfo" style="margin-left:50px;" Font-Underline="true" runat="server" Text="Question Answer Analysis" Font-Bold="true" Font-Size="X-Large" CssClass=" text-info "></asp:Label><br />
          <div style="border:double;border-color:blue;border-width:4px;margin-top:15px;">   
          <asp:Panel ID="pnlShowAnsInfo" runat="server">
             </asp:Panel>
              <br /><br />
              </div>
      </div>
            
          <asp:Button ID="btnRetakeTest" runat="server" Text="Retake Test" style="margin-left:35%;margin-top:70px;" Font-Bold="true" Font-Size="X-Large" OnClick="btnRetakeTest_Click" CssClass=" btn img-rounded"/>

        </div>
    </div>     
    <br />
    <br />
</asp:Content>
