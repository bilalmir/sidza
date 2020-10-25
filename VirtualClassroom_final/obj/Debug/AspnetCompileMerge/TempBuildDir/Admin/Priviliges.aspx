<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Priviliges.aspx.cs" Inherits="VirtualClassroom_final.UI.Priviliges" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<asp:Label ID="lblchk" runat="server" Font-Bold="true" ForeColor="White" CssClass="label label-success pull-right"></asp:Label>
<div class="container hero-unit" style="margin-top:10px;">

<asp:DropDownList ID="ddlrole" runat="server" 
        onselectedindexchanged="ddlrole_SelectedIndexChanged" AutoPostBack="true">
</asp:DropDownList>
<asp:Button ID="btnAddPrivileges" runat="server" 
        Text="AddPrivileges" Font-Bold="true" ForeColor="White" 
        onclick="btnAddPrivileges_Click" Visible="false" CssClass="btn btn-success pull-right" />

<asp:GridView ID="grdpages" runat="server" AutoGenerateColumns="false" Visible="false" Width="600">
<Columns >
 <asp:BoundField DataField="pagename" HeaderText="pagename" />
<asp:TemplateField >
<ItemTemplate>

<asp:CheckBox ID="chkpage" runat="server" AutoPostBack="true" />
</ItemTemplate>


</asp:TemplateField>


</Columns>
</asp:GridView>


</div>

</asp:Content>
