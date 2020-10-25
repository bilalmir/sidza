<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="ActiveUsers.aspx.cs" Inherits="VirtualClassroom_final.UI.ActiveUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Activeuser" runat="server" style="margin-bottom:90px;">
       <table align="center"><tr><td><asp:Label ID="lblmsgg"  runat="server"></asp:Label></td></tr></table>  <br />
    <asp:UpdatePanel ID="update" runat="server">
        <ContentTemplate>
          <asp:GridView ID="GridView2" runat="server"  
             AutoGenerateColumns="False" Height="100px" BackColor="White"
                BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                CellSpacing="2" GridLines="Vertical"
                EmptyDataText="There are no Subjects" Visible="True" OnRowDeleting="GridView2_RowDeleting"
                 ForeColor="black" Caption="Active Users" CssClass="container">
               <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:TemplateField HeaderText="UserID">
                    <ItemTemplate >
                        <asp:Label ID="Lbluserid" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                         </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField  HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label ID="Lblname" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                         </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField  HeaderText="Email">
                    <ItemTemplate>
                        <asp:Label ID="lblemail" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                         </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField  HeaderText= "Limit">
                    <ItemTemplate>
                        <asp:Label ID="lbllimit" runat="server" Text='<%# Eval("limit") %>'></asp:Label>
                         </ItemTemplate>
                </asp:TemplateField>
                        <%--<asp:Label ID="lbllock" runat="server" Text='<%# Eval("lock") %>' ></asp:Label>--%>
                  <asp:CommandField HeaderText="Remove" ShowDeleteButton="True"
                        DeleteText="Remove" CausesValidation="false"/>
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
        </ContentTemplate>
    </asp:UpdatePanel>  
    </div>
</asp:Content>
