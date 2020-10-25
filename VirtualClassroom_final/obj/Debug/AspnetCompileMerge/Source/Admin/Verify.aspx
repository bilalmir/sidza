<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="Verify.aspx.cs" Inherits="VirtualClassroom_final.UI.Verify" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container hero-unit thumbnail">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowDeleting="GridView1_RowDeleting"
            OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="id">
            <Columns>
                <asp:TemplateField HeaderText= "RoleId">
                    <ItemTemplate>
                        <asp:Label ID="lblid" runat="server" Text='<%# Eval("roleid") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText= "Name">
                    <ItemTemplate>
                        <asp:Label ID="Lblname" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                         </ItemTemplate>
                    </asp:TemplateField>
                 
                        <asp:TemplateField HeaderText= "Doc">
                    <ItemTemplate>
                        <asp:Label ID="lbldoc" runat="server" Text='<%# Eval("documents") %>'></asp:Label>
                           </ItemTemplate>
                    </asp:TemplateField>
                
                  <asp:TemplateField HeaderText= "Documents">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("documents") %>'
                            Text="Download"></asp:HyperLink>
                             </ItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText= "UserId">
                    <ItemTemplate>
                        <asp:Label ID="Lbluserid" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                      </ItemTemplate>
                    </asp:TemplateField>

                         <asp:TemplateField HeaderText= "Subjectid">
                    <ItemTemplate>
                        <asp:Label ID="lblsubjectid" runat="server" Text='<%# Eval("subjectid") %>'></asp:Label>
                      </ItemTemplate>
                    </asp:TemplateField>

                      <asp:TemplateField HeaderText= "Valid">
                    <ItemTemplate>
                        <asp:Label ID="lblisvalid" runat="server" Text='<%# Eval("isvalid") %>'></asp:Label>
                    </ItemTemplate>
                    
                    <EditItemTemplate>
                        <asp:TextBox ID="txtisvalid" runat="server" Text='<%# Eval("isvalid") %>'></asp:TextBox>
                    </EditItemTemplate>
               </asp:TemplateField>
                <asp:CommandField ShowEditButton="true"  />
            </Columns>
        </asp:GridView>
        <asp:Label ID="lblmessage" runat="server"></asp:Label>
    </div>
</asp:Content>
