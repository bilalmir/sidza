<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="takeexam.aspx.cs" Inherits="VirtualClassroom_final.UI.takeexam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblchk" runat="server" Font-Bold="true" ForeColor="White" CssClass=" label-important pull-right"></asp:Label>
    
    <hr />
   <div style="height:100%;width:100%">
    
    
        <script type="text/javascript">

            function hide(tbl) {

                document.getElementById(tbl).style.display = 'none';
                
            }
 
        </script>
   
        <div class="container" style="margin-left:190px; margin-top:0px;">            
           <asp:Label ID="Label2" runat="server" Text="Welcome to Online Objective Examination" CssClass="muted"
        Font-Bold="true" Font-Size="X-Large" ForeColor="#58B158"></asp:Label><br /><br />
      <div id="tblselect" runat="server">  
         <table style="width:1000px; background-color:grey;border-style:double;border-color:blueviolet;border-width:3px;">
          <tr>
             <td colspan="3" ></td>
          </tr>
          <tr>
           <td> 
               <asp:Label ID="lblclassheading" runat="server" Text="Class Name" Font-Bold="true" Font-Size="Medium" ForeColor="white"></asp:Label>    
              <asp:DropDownList ID="ddlclass" runat="server"  Font-Bold="true" Font-Size="Medium" AutoPostBack="True" CssClass="btn-success" ForeColor="White"
                        OnSelectedIndexChanged="ddlclass_SelectedIndexChanged"  style="border-color:Gray; " ClientIDMode="Static"></asp:DropDownList>
          </td>
          <td>                
            <asp:Label ID="lblsubjectheading" runat="server" Text="Subject Name" Font-Bold="true" Font-Size="Medium" ForeColor="white"></asp:Label>    
            <asp:DropDownList ID="ddlsubject" runat="server"  Font-Bold="true" Font-Size="Medium" AutoPostBack="True" CssClass="btn-success" ForeColor="White"
                        style="border-color:Gray; " OnSelectedIndexChanged="ddlsubject_SelectedIndexChanged" ClientIDMode="Static"></asp:DropDownList>
         </td>
         <td>                
            <asp:Label ID="lblchapterheading" runat="server" Text="Chapter Name" Font-Bold="true" Font-Size="Medium" ForeColor="white"></asp:Label>    
            <asp:DropDownList ID="ddlchapter" runat="server"  Font-Bold="true" Font-Size="Medium" AutoPostBack="True" CssClass="btn-success" ForeColor="White"
                        style="border-color:Gray;" OnSelectedIndexChanged="ddlchapter_SelectedIndexChanged" ClientIDMode="Static"></asp:DropDownList>
         </td>
         </tr>
         <tr>
             <td colspan="3">

             </td>
         </tr>   
        <tr>
            <td colspan="3" align="center">
                <asp:Button ID="btntest" runat="server" Visible="false" Text="Start test" OnClick="btntest_Click" OnClientClick="javascript:hide('tblselect');"
                CssClass="btn btn-success" Font-Bold="true" Font-Size="X-Large" ForeColor="white" />            
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
        
        <div id="dv" runat="server" visible="false" class="container" style="margin-top: 20px;">
            <asp:Label ID="lblcls" runat="server"></asp:Label>
            <asp:TextBox ID="txtclass" runat="server" locked="true" ReadOnly="true" Width="120"></asp:TextBox>
            <asp:Label ID="lblsub" runat="server"></asp:Label>
            <asp:TextBox ID="txtsubject" runat="server" locked="true" ReadOnly="true" Width="100"></asp:TextBox>
            <asp:Label ID="lblchapter" runat="server"></asp:Label>
            <asp:TextBox ID="txtchapter" runat="server" locked="true" ReadOnly="true" Width="50px"></asp:TextBox>
            <asp:Label ID="lblpapermarks" runat="server"></asp:Label>
            <asp:TextBox ID="txtpapermarks" runat="server" locked="true" ReadOnly="True" Width="50"></asp:TextBox>
            <asp:Label ID="lblpassmarks" runat="server"></asp:Label>
            <asp:TextBox ID="txtpassmarks" runat="server" locked="true" ReadOnly="true" Width="50"></asp:TextBox>
        </div>
        <asp:Label ID="lblmsg" runat="server" Font-Bold="true" ForeColor="White" Font-Size="Larger" CssClass="offset7"></asp:Label>
       <div Class=" container img-rounded" style="margin-left:10%;margin-top: 30px; width:800px;background-color:silver">
       <asp:Panel ID="pnlExam" runat="server" style="margin-left:10px;" Visible="false">
           
           <asp:Label ID="lblQuestionNo" Font-Bold="true" runat="server"></asp:Label>
            <asp:Label ID="lblQuestionDetail" Font-Bold="true" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblmarks" Font-Bold="true" runat="server"></asp:Label><br /><br />
           <asp:Image ID="imgDisplayImage" Visible="false" runat="server" Height="130" Width="150" /><br /><br />
            <asp:RadioButton ID="rdAnswer1" runat="server" GroupName="rdQuestion"/>
            <asp:RadioButton ID="rdAnswer2" runat="server" GroupName="rdQuestion"/>
            <asp:RadioButton ID="rdAnswer3" runat="server" GroupName="rdQuestion"/>
            <asp:RadioButton ID="rdAnswer4" runat="server" GroupName="rdQuestion"/>
           <asp:Button ID="btnnextquestion" runat="server" Text="Next" style="margin-left:380px;"  CssClass="btn btn-info" OnClick="btnnextquestion_Click"/>
        </asp:Panel>
          
       </div>
        <asp:Button ID="btnsubmit" runat="server" Text="Submit" Visible="false" Width="150px" OnClick="btnsubmit_Click"
            CssClass="btn btn-success " Font-Bold="true" Font-Size="X-Large"  style="text-align:center;margin-left:38%" />
    
       <div style="height:200px;"></div>        
    </div>
</asp:Content>
