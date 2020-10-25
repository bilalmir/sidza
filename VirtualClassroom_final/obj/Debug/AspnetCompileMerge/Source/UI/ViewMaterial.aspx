<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="ViewMaterial.aspx.cs" Inherits="VirtualClassroom_final.UI.ViewMaterial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height:100%;margin-bottom:200px;">
    <%--   <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
              <asp:UpdatePanel ID="updPanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>      
            <div class="" style="margin-left:25px; margin-top:20px;" ><br /><br />
              <asp:Label ID="Label1" runat="server" Text="View Material" Font-Bold="true" style="margin-left:0px;" CssClass="text-info" align="center" Font-Size="Large" ForeColor="Green" ></asp:Label><br /><br />
                <table style="background-color:grey;border-style:double;border-color:blueviolet;border-width:3px;">
                    <tr>
                        <td colspan="3"></td>
                    </tr>
                    <tr>
                        <td> 
                            <asp:Label ID="lableclass" runat="server" Text="Class Name" Font-Bold="true" Font-Size="Medium" ForeColor="white"></asp:Label>    
                     <asp:DropDownList ID="ddlclass" runat="server" Width="200" Font-Bold="true" Font-Size="Medium" AutoPostBack="True" CssClass="btn-success" ForeColor="White"
                      OnSelectedIndexChanged="ddlclass_SelectedIndexChanged"  style="border-color:Gray; margin-left:10px;">
                    </asp:DropDownList>                    
                     &nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                             <asp:Label ID="Label2" runat="server" Text="Subject Name" Font-Size="Medium" Font-Bold="true" ForeColor="white"></asp:Label>    
                      <asp:DropDownList ID="ddlsubject" runat="server" Width="200" Font-Bold="true" Font-Size="Large" AutoPostBack="True" CssClass="btn-success" ForeColor="White"
                      OnSelectedIndexChanged="ddlsubject_SelectedIndexChanged" style="border-color:Gray; margin-left:10px;">
                      </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                             <asp:Label ID="Label3" runat="server" Text="Chapter Name" Font-Size="Medium" Font-Bold="true" ForeColor="white"></asp:Label>    
                   <asp:DropDownList ID="ddllesson" runat="server" Width="200" Font-Bold="true" Font-Size="Large" AutoPostBack="True" CssClass="btn-success" ForeColor="White"
                       OnSelectedIndexChanged="ddllesson_SelectedIndexChanged"  style="border-color:Gray; margin-left:10px;">
                    </asp:DropDownList>
                  
                        </td>
                    </tr>
                </table>
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>       
       
    </div>

    <div class="pull-left" style="margin-top:8px;margin-left:20px">
        <asp:GridView ID="grddownloadmaterial"   runat="server" Width="290px" AutoGenerateColumns="False" FooterStyle-BackColor="AntiqueWhite" Font-Size="Small"
          BorderStyle="None" EmptyDataText="There is no material available yet. Please try again later."  OnRowDataBound="grddownloadmaterial_RowDataBound">
            <RowStyle BackColor="#DCDCDC" />           
            <PagerStyle BackColor="Red" ForeColor="Black" HorizontalAlign="Center" />
            <HeaderStyle BackColor="AliceBlue" Font-Bold="True" ForeColor="Black" />
            <EmptyDataRowStyle BackColor="#eeeeee" BorderColor="Black"
                    BorderStyle="Solid" BorderWidth="1px" Font-Size="Large" ForeColor="#851010"
                    HorizontalAlign="Center" />
              <Columns>
            <asp:TemplateField HeaderText="Title Name" HeaderStyle-CssClass="text-left text-info" ControlStyle-CssClass="text-left">
                <ItemTemplate>
                   <asp:Label ID="lblfilename" Font-Size="Medium" CssClass="label label-info" runat="server" Text='<% #Eval("filename") %>'></asp:Label>
                    <%--<asp:Literal ID="ltrFilename" runat="server" Text='<% #Eval("filename") %>'></asp:Literal>--%>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="View Material" HeaderStyle-CssClass="text-info" HeaderStyle-BorderWidth="">
                <ItemTemplate>
                     <asp:LinkButton ID="lnkbtnFile" runat="server" Text="&nbsp;&nbsp;&nbsp;Preview&nbsp;&nbsp;&nbsp;" 
                        OnClick="lnkbtnFile_Click"></asp:LinkButton>       
                    <%--<button data-dialogmodal-bind="#content" data-topoffset="0" data-top="10%" data-type="modal">Preview</button>--%>
                    <asp:Literal ID="ltrmaterial" runat="server"></asp:Literal>  
                </ItemTemplate>
            </asp:TemplateField>
           <%--  <asp:TemplateField HeaderText="Download">
                    <ItemTemplate>
                        <asp:ImageButton ID="btndownload" ImageUrl="../img/download1.jpg" runat="server" Width="25" Height="25" OnClick="btndownload_Click"/>
                    </ItemTemplate>
             </asp:TemplateField>--%>
            <%-- <asp:TemplateField HeaderText="Watch Here"  ControlStyle-Width="40" ControlStyle-CssClass="text-center muted" HeaderStyle-CssClass="text-left text-info">
                <ItemTemplate>
                        <asp:ImageButton ID="imgbtn" runat="server" ImageUrl="../img/Play.jpg" Height="30px" Width="720px" OnClick="imgbtn_Click" />         
                </ItemTemplate>
            </asp:TemplateField>--%>
            <asp:BoundField DataField="filename" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden"/>          
         
        </Columns>
     </asp:GridView>       
    </div>
    
         <div id="showpdf" runat="server" >           
           </div>
                 </ContentTemplate>          
      <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlclass" />
            <asp:AsyncPostBackTrigger ControlID="ddlsubject" />
            <asp:AsyncPostBackTrigger ControlID="ddllesson" />
         </Triggers>
                  
   </asp:UpdatePanel>
        
    </div>

</asp:Content>
