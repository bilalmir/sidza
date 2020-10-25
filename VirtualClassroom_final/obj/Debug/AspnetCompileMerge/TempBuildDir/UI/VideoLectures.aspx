<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" Async="true" AutoEventWireup="true" CodeBehind="VideoLectures.aspx.cs" Inherits="VirtualClassroom_final.UI.VideoLectures" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"><br /><br />   
    <div style="margin-bottom:200px;width:600px;">
             <div class="" style="margin-left:10px; margin-top:25px;width:350px;">
                      <asp:Label ID="Label1" runat="server" Text="Watch Video Lectures" Font-Bold="true" CssClass="" align="center" Font-Size="X-Large" ForeColor="green" ></asp:Label><br /><br />
             <table style="border-style:double;border-color:blueviolet;border-width:3px;">
                 <tr>
                     <td colspan="2">&nbsp;</td>
                 </tr>
                <tr>
                    <td>
                        <asp:Label ID="lableclass" runat="server" Text="Class Name" Font-Size="Medium" ForeColor="green"></asp:Label>      
           
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlclass" runat="server" Width="200"  Font-Bold="true" Font-Size="Larger" AutoPostBack="True" CssClass="btn-success" ForeColor="White"
                              OnSelectedIndexChanged="ddlclass_SelectedIndexChanged"  style="border-color:Gray; margin-left:10px;"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                   <asp:Label ID="Label2" runat="server" Text="Subject Name" Font-Size="Medium" ForeColor="green"></asp:Label>             
                    </td>
                    <td>
                  <asp:DropDownList ID="ddlsubject" runat="server" Width="200"  Font-Bold="true" Font-Size="Larger" AutoPostBack="True" CssClass="btn-success" ForeColor="White"
                         OnSelectedIndexChanged="ddlsubject_SelectedIndexChanged" style="border-color:Gray; margin-left:10px;"></asp:DropDownList>
             
                    </td>
                </tr>
                <tr>
                    <td>
                  <asp:Label ID="Label3" runat="server" Text="Chapter Name" Font-Size="Medium" ForeColor="green"></asp:Label>                  

                    </td>
                    <td>
                 <asp:DropDownList ID="ddllesson" runat="server" Width="200"  Font-Bold="true" Font-Size="Larger" AutoPostBack="True" CssClass="btn-success" ForeColor="White"
                       OnSelectedIndexChanged="ddllesson_SelectedIndexChanged"  style="border-color:Gray; margin-left:10px;"></asp:DropDownList>
                    </td>
                </tr>

            </table>
                 
                  <asp:Label ID="lblmsg" runat="server"></asp:Label>       
       
    </div>

    <div class="pull-left" style="margin-top:55px;margin-left: 20px; width:400px;">
        <asp:GridView ID="grddownloadmaterial"  EmptyDataText="There are no Videos available. Please try again later."  runat="server"  AutoGenerateColumns="False" FooterStyle-BackColor="AntiqueWhite" Font-Size="Small"
         RowHeaderColumn="3" BorderStyle="None" OnRowDataBound="grddownloadmaterial_RowDataBound"  >
            <RowStyle BackColor="#DCDCDC" />           
            <PagerStyle BackColor="Red" ForeColor="Black" HorizontalAlign="Center" />
            <HeaderStyle BackColor="AliceBlue" Font-Bold="True" ForeColor="Black" />
            <EmptyDataRowStyle BackColor="#eeeeee" BorderColor="Black"
                    BorderStyle="Solid" BorderWidth="1px" Font-Size="Large" ForeColor="#851010"
                    HorizontalAlign="Center" />

              <Columns>
            <asp:TemplateField HeaderText="Title Name" HeaderStyle-CssClass="text-left text-info" ControlStyle-CssClass="text-left text">
                <ItemTemplate>
                      <%--<asp:Literal ID="ltrFilename" runat="server" Text='<% #Eval("title") %>'></asp:Literal>--%>
                    <asp:Label ID="lblfilename" runat="server" Font-Size="Medium"   Text='<%#Eval("title")%>'></asp:Label>
                 </ItemTemplate>
            </asp:TemplateField>
            <%-- <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                <ItemTemplate>
                     <asp:LinkButton ID="lnkbtnFile" runat="server" Text='<% #Eval("filename") %>' 
                        OnClick="lnkbtnFile_Click"></asp:LinkButton>       
                </ItemTemplate>
            </asp:TemplateField>--%>
             <asp:TemplateField HeaderText="Watch Here"  ControlStyle-CssClass="icon-align-center text-center" HeaderStyle-CssClass="text-left text-info">
                <ItemTemplate>
                      <%--  <asp:ImageButton ID="imgbtn" CssClass="icon-align-center" runat="server" ImageUrl="../img/Play.jpg" Height="30px" OnClick="imgbtn_Click" />   --%>
                     <asp:Literal ID="ltr" runat="server"></asp:Literal>      
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="filename" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden"/>          
        </Columns>
     </asp:GridView> 
       
    </div>
    <div class="" style=" height:360px; width:642px; margin-top:-155px; margin-left:425px;">
          <asp:PlaceHolder ID="plchldrControl" runat="server" Visible="false">
          </asp:PlaceHolder>
    </div>
  
    </div>

   <%-- <asp:Image runat="server" ImageUrl="~/img/elearning_image.jpg" />--%>
</asp:Content>
