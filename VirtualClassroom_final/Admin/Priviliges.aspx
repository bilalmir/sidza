<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Priviliges.aspx.cs" Inherits="VirtualClassroom_final.UI.Priviliges" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="row" style="margin-top:150px;margin-bottom:90px;">
      <div class="col-md-8 col-md-offset-2" >
          <div>
   <asp:Label ID="lblchk" runat="server" Font-Bold="true" ForeColor="White" CssClass="label label-success pull-right"></asp:Label>
           </div>
     <div class="table">
     <asp:DropDownList ID="ddlrole" runat="server" onselectedindexchanged="ddlrole_SelectedIndexChanged" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
      <asp:Button ID="btnAddPrivileges" runat="server" Text="AddPrivileges" Font-Bold="true" onclick="btnAddPrivileges_Click" Visible="false" CssClass="btn btn-success pull-right" />
    </div>
   <div class="table table-responsive">
      <asp:GridView ID="grdpages" runat="server" AutoGenerateColumns="false" Visible="false" Width="600">
        <Columns >
         <asp:BoundField DataField="pagename" HeaderText="Pagename" />
        <asp:TemplateField >
        <ItemTemplate>
        <asp:CheckBox ID="chkpage" runat="server" CssClass="form-control" AutoPostBack="true" />
        </ItemTemplate>
        </asp:TemplateField>
        </Columns>
     </asp:GridView>
    </div>
</div>
</div>
</asp:Content>
