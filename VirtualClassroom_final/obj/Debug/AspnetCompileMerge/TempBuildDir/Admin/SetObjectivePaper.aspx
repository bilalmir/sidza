<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="SetObjectivePaper.aspx.cs" Inherits="VirtualClassroom_final.UI.SetObjectivePaper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <asp:Label ID="Label1" runat="server" CssClass="label label-warning pull-right" Font-Bold="true"
        ForeColor="White"></asp:Label>
    <asp:Label ID="lblchk" runat="server" Font-Bold="true" ForeColor="White" CssClass=" label-important pull-right"></asp:Label>
    <div id="info" runat="server" style="margin-top:30px;margin-left:100px;">
         
        <asp:Label ID="lblclass1" runat="server" Text="Class Name"></asp:Label>
        <asp:Label ID="lblclass2" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
        <asp:DropDownList ID="ddlclass" runat="server" Width="150" Font-Bold="true" Font-Size="Medium" AutoPostBack="True" OnSelectedIndexChanged="ddlclass_SelectedIndexChanged" >
        </asp:DropDownList>
        <asp:Label ID="lblsubject1" runat="server" Text="Subject Name"></asp:Label>
        <asp:Label ID="lblsubject2" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
        <asp:DropDownList ID="ddlsubject" runat="server" Width="150" Font-Bold="true" Font-Size="Medium" AutoPostBack="True" OnSelectedIndexChanged="ddlsubject_SelectedIndexChanged"></asp:DropDownList>    

        <asp:Label ID="lblchapter1" runat="server" Text="Subject Name"></asp:Label>
        <asp:Label ID="lblchapter2" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
        <asp:DropDownList ID="ddlchapter" runat="server" Width="150" Font-Bold="true" Font-Size="Medium" ></asp:DropDownList>    
       
            <asp:Label ID="lblpapermarks1" runat="server" Text="Paper Marks"></asp:Label>
            <asp:Label ID="lblpapermarks2" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
            <asp:TextBox ID="txtPapermarks" runat="server" Width="50"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPapermarks"
                ErrorMessage="***" ForeColor="Red" Font-Size="Small" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
            <asp:Label ID="lblpassmarks1" runat="server" Text="Pass Marks"></asp:Label>
            <asp:Label ID="lblpassmarks2" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
            <asp:TextBox ID="txtpassmarks" runat="server" Width="50"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpassmarks"
                ErrorMessage="***" ForeColor="Red" Font-Size="Small" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
       
        <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click"
            Font-Bold="true" Font-Size="Larger" CssClass="btn btn-success" ValidationGroup="btnsubmit"
            Style="margin-left: 500px;width: 200px;" />
        <br />
        <asp:Label ID="lblmsgques" runat="server"></asp:Label>
    </div>
    <br />
    <div id="btn" runat="server" visible="false" class="" style="margin-left: 60px;
        margin-top: 0px;">
        <asp:Label ID="lbladd" runat="server" Text="Click Add to enter Questions:" Visible="false"></asp:Label>
        <br />
        <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btnsave_Click" CssClass="btn btn-primary"
            Font-Bold="true" ForeColor="White" ValidationGroup="btnsave" />
        <asp:Button ID="btnadd" runat="server" Text="Add" OnClick="btnadd_Click" CssClass="btn btn-primary"
            Font-Bold="true" ForeColor="White" />
        <asp:Button ID="btncancel" runat="server" Text="Cancel" OnClick="btncancel_Click" ClientIDMode="Static" 
            CssClass="btn btn-primary" Font-Bold="true" ForeColor="White" />
        <asp:Button ID="btbview" runat="server" Text="View" OnClick="btbview_Click" ClientIDMode="Static" CssClass="btn btn-primary"
            Font-Bold="true" ForeColor="White" />
        <asp:Button ID="btbdelete" runat="server" Text="Delete" OnClick="btbdelete_Click"
            CssClass="btn btn-primary" Font-Bold="true" ForeColor="White" />
    </div>
      <div class="" style="margin-top: 10px;margin-left:30px">
        <asp:Label ID="lblqsno" runat="server"></asp:Label>
        <asp:Label ID="lblqs" runat="server"></asp:Label>
        <asp:Label ID="lblmrks" runat="server"></asp:Label>
        <asp:Image ID="imgqst" runat="server" Visible="false" Height="100px" Width="110px" />
        <asp:Label ID="lbloption1" runat="server"></asp:Label>
        <asp:Label ID="lbloption2" runat="server"></asp:Label>
        <asp:Label ID="lbloption3" runat="server"></asp:Label>
        <asp:Label ID="lbloption4" runat="server"></asp:Label>
        <asp:Panel ID="panel1" CssClass="" runat="server" Style="color:black;">
        </asp:Panel>
        <asp:Label ID="lblquesno" runat="server" Visible="false"></asp:Label>
        <asp:TextBox ID="txtquesno" runat="server" Visible="false" Width="15" Height="15"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtquesno"
            ErrorMessage="***" ForeColor="Red" Font-Size="Small" ValidationGroup="btnsave"></asp:RequiredFieldValidator>
        <asp:TextBox ID="txtquestion" runat="server" placeholder="Enter Question" Width="400"
            Height="30" Visible="false"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtquestion"
            ErrorMessage="***" ForeColor="Red" Font-Size="Small" ValidationGroup="btnsave"></asp:RequiredFieldValidator>
    <table>
        <tr>
            <td>
                 <asp:Image ID="imgquest" runat="server" AlternateText="Image Not Available" Visible="false" Height="100px" Width="110px"/>
                  <asp:FileUpload ID="upldQuest" runat="server" Visible="false" />       
                  <asp:Button ID="btnQuestUpload" runat="server" Visible="false" OnClick="btnQuestUpload_Click" Text="Upload..." />
   
            </td>
        </tr>
        <tr>
            <td>
                    <asp:Label ID="lblmarks" runat="server" Visible="false"></asp:Label>
        <asp:TextBox ID="txtmarks" runat="server" Visible="false" Width="20px" Height="20px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtmarks"
            ErrorMessage="***" ForeColor="Red" Font-Size="Small" ValidationGroup="btnsave"></asp:RequiredFieldValidator>
    
            </td>
        </tr>        
        <tr>
                <td>
                    <asp:Label ID="lblanswer1" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="txtanswer1" runat="server" Visible="false" Width="160px" Height="30px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtanswer1"
                        ErrorMessage="***" ForeColor="Red" Font-Size="Small" ValidationGroup="btnsave"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblanswer2" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="txtanswer2" runat="server" Visible="false" Width="160px" Height="30px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtanswer2"
                        ErrorMessage="***" ForeColor="Red" Font-Size="Small" ValidationGroup="btnsave"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblanswer3" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="txtanswer3" runat="server" Visible="false" Width="160px" Height="30px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtanswer3"
                        ErrorMessage="***" ForeColor="Red" Font-Size="Small" ValidationGroup="btnsave"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblanswer4" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="txtanswer4" runat="server" Visible="false" Width="160px" Height="30px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtanswer4"
                        ErrorMessage="***" ForeColor="Red" Font-Size="Small" ValidationGroup="btnsave"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblanswerkey" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="txtanswerkey" runat="server" Visible="false" Width="160px" Height="30px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtanswerkey"
                        ErrorMessage="***" ForeColor="Red" Font-Size="Small" ValidationGroup="btnsave"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
