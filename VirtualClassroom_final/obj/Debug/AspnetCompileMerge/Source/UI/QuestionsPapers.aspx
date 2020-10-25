<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="QuestionsPapers.aspx.cs" Inherits="VirtualClassroom_final.UI.QuestionsPapers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width:100%;height:100%; margin-bottom:100px;">
    <%--   <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
              <asp:UpdatePanel ID="updPanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>      
            <div class="" style="margin-left:25px; margin-top:45px;" ><br /><br />
              <asp:Label ID="Label1" runat="server" Text="Download Question Papers" Font-Bold="true" CssClass="text-info" align="center" Font-Size="Medium" ForeColor="Green" ></asp:Label>
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
                    </td>
                <td>
                          <asp:Label ID="Label2" runat="server" Text="Subject Name" Font-Bold="true" Font-Size="Medium" ForeColor="white"></asp:Label>    
                       <asp:DropDownList ID="ddlsubject" runat="server" Width="200" Font-Bold="true" Font-Size="Large" AutoPostBack="True" CssClass="btn-success" ForeColor="White"
                      OnSelectedIndexChanged="ddlsubject_SelectedIndexChanged" style="border-color:Gray; margin-left:10px;">
                      </asp:DropDownList>
                 </td> 
                  <asp:Label ID="lblmsg" runat="server"></asp:Label>       
               </tr>
             </table> 
    </div>

    <div class="pull-left" style="margin-top:40px;margin-left: 20px">
        <asp:GridView ID="grddownloadmaterial"   runat="server" Width="290px" AutoGenerateColumns="False" FooterStyle-BackColor="AntiqueWhite" Font-Size="Small"
          BorderStyle="None"  EmptyDataText="There are no Question Papers available. Please try again later."  OnRowDataBound="grddownloadmaterial_RowDataBound">
            <RowStyle BackColor="#DCDCDC" />           
            <PagerStyle BackColor="Red" ForeColor="Black" HorizontalAlign="Center" />
            <HeaderStyle BackColor="AliceBlue" Font-Bold="True" ForeColor="Black" />
            <EmptyDataRowStyle BackColor="#eeeeee" BorderColor="Black"
                    BorderStyle="Solid" BorderWidth="1px" Font-Size="Large" ForeColor="#851010"
                    HorizontalAlign="Center" />
              <Columns>
            <asp:TemplateField HeaderText="Title Name" HeaderStyle-CssClass="text-left text-info" ControlStyle-CssClass="text-left">
                <ItemTemplate>
                  
                    <asp:Literal ID="ltrFilename" runat="server" Text='<% #Eval("filename") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Download">
                    <ItemTemplate>
<%--                        <asp:ImageButton ID="btndownload" ImageUrl="../img/download1.jpg" runat="server" Width="25" Height="25" OnClick="btndownload_Click" OnClientClick="aspnetForm.target='_blank'"/>--%>
                          <asp:Literal ID="ltr" runat="server"></asp:Literal>
                    </ItemTemplate>
             </asp:TemplateField>
            <asp:BoundField DataField="filename" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden"/>          
         
        </Columns>
     </asp:GridView>       
    </div>
       <%-- <div class="" style=" height:360px; width:500px; margin-top:48px; margin-left:450px;">
              <asp:PlaceHolder ID="plchldrControl" runat="server" Visible="false">
              </asp:PlaceHolder>
        </div>--%>
                 </ContentTemplate>
      <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlclass" />
            <asp:AsyncPostBackTrigger ControlID="ddlsubject" />
          
         </Triggers>
   </asp:UpdatePanel>
    </div>

</asp:Content>
