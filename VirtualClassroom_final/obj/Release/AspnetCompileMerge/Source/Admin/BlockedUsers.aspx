<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="BlockedUsers.aspx.cs" Inherits="VirtualClassroom_final.UI.BlockedUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="row" style="margin-top:150px;margin-bottom:90px;">
      <div class="col-md-10 col-md-offset-1" >
      <table class="table table-responsive" align="center">
          <tr>
              <td>
                  <asp:Label ID="lblmessage" runat="server" CssClass="label label-success offset6" Font-Bold="true" Font-Size="Larger"></asp:Label>
              </td>
          </tr>
      </table>
   <div class="table table-responsive">
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="false" 
             Caption ="Blocked Users" BackColor="White"
                BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                CellSpacing="2" GridLines="Vertical"
                EmptyDataText="There are no Blocked Users"
               onrowediting="GridView3_RowEditing"  onrowupdating="GridView3_RowUpdating" 
            DataKeyNames="id"  Visible="True" CssClass="container"
            onrowcancelingedit="GridView3_RowCancelingEdit">    
         <AlternatingRowStyle BackColor="#DCDCDC" />  
              <Columns>
                <asp:TemplateField HeaderText="UserID">
                <ItemTemplate>
                 <asp:Label ID="Lbluserid" runat="server" Text='<%# Eval("id") %>' ></asp:Label>
                 </ItemTemplate>
                 </asp:TemplateField>

                 <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                <asp:Label ID="Lblname" runat="server" Text='<%# Eval("name") %>' ></asp:Label>
                 </ItemTemplate>
                 </asp:TemplateField>

                <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                <asp:Label ID="lblemail" runat="server" Text='<%# Eval("email") %>' ></asp:Label>
                 </ItemTemplate>
                 </asp:TemplateField>

                <asp:TemplateField  HeaderText="Limit">
                <ItemTemplate>
                <asp:Label ID="lbllimit" runat="server" Text='<%# Eval("limit") %>' ></asp:Label> 
                 </ItemTemplate>
                 </asp:TemplateField>

                <asp:TemplateField HeaderText="Lock">
                <ItemTemplate>
                <asp:Label ID="lbllock" runat="server" Text='<%# Eval("lock") %>' ></asp:Label>
                 </ItemTemplate>
                <EditItemTemplate >
                <asp:Textbox ID="txtlock" runat="server" placeholder="set 0 to unlock" Text='<%# Eval("lock") %>' ></asp:Textbox>
                <%--<asp:Label ID="lblemail" runat="server" Text='<%# Eval("email") %>' ></asp:Label>--%>
                </EditItemTemplate>
                 </asp:TemplateField>
                <asp:CommandField  ShowEditButton ="true"/>
             </Columns>
         <EmptyDataRowStyle BackColor="#eeeeee" BorderColor="Black"
                    BorderStyle="Solid" BorderWidth="1px" Font-Size="Large" ForeColor="#851010"
                    HorizontalAlign="Center" />
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#851010" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#851010" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
   </div>
   <div class="table table-responsive" style="margin-top:20px;">
<img src="../img/hjh.jpg" id="imgnot" visible="false" alt="" runat="server" />
        <asp:Button ID="Btncounter" runat="server" Visible="false" Width="27px" />
        </div>
  </div>
</div>
</asp:Content>
