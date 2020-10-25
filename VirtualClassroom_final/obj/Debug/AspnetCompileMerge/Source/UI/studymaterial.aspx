<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="studymaterial.aspx.cs" Inherits="VirtualClassroom_final.UI.studymaterial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align:center;height:100%;width:100%;" class="container">    
        <table align="center" style="margin-top:150px;border:double;border-color:blue;border-width:4px;">
            <tr>
                <td>
                     <asp:HyperLink ID="lnk" runat="server" NavigateUrl="~/UI/QuestionsPapers.aspx" BorderColor="YellowGreen" BorderStyle="Solid" BorderWidth="1px"
                                ForeColor="Green" Font-Size="X-Large" Text="Download Question Papers Here"
                                CssClass="btn btn-link"></asp:HyperLink>
                </td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/UI/Syllabus.aspx" BorderColor="YellowGreen" BorderStyle="Solid" BorderWidth="1px" 
              ForeColor="Green" Font-Size="X-Large" Text="Download Syllabus Here"
                CssClass="btn btn-link"></asp:HyperLink>
                </td>
            </tr>
        </table>        
        
                
                   
            
       
    </div>
</asp:Content>
