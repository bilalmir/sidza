<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UploadArticles.aspx.cs" Inherits="VirtualClassroom_final.Admin.UploadArticles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div style="align-content:center;align-self:center;margin-top:5px;margin-bottom:90px;">         
      <div class="container" style="align-items:center;align-self:center;">
       
          <table align="center">   
              <tr>
                  <td>
                       <asp:Label ID="lblmsg" runat="server" Font-Bold="true" ForeColor="White" Font-Size="Large" CssClass="label label-inverse"></asp:Label><br />
                  </td>
              </tr>
             
               <tr>
                  <td>
                       <asp:Label ID="lbltype" runat="server" Text="Select Type"  CssClass="text-info" ></asp:Label>
                    </td>
                  <td>
                       <asp:DropDownList ID="ddlTypeUpload" runat="server" Width="150"></asp:DropDownList>
             
                  </td>
              </tr>
              <tr>
                  <td>                    
                      <asp:Label ID="lblbrowseFile" runat="server" Text="Browse file" CssClass="text-info"  ></asp:Label>      
                  </td>
                  <td>
                       <asp:FileUpload ID="Upldmtrl"  runat="server"  />
                  </td>
              </tr>              
              <tr>
                  <td colspan="2" align="center">
                       <asp:Button ID="btnupload" runat="server" Text="Upload"  OnClick="btnupload_Click"
                    CssClass="btn btn-info" Font-Bold="true" />
                  </td>
              </tr>             
          </table>                
          <br /><br />                                
      </div>
        <br />        
          <div align="center">
            <asp:GridView ID="gvclass" runat="server"  CaptionAlign="Top"
                AutoGenerateColumns="False" Height="100px" BackColor="White"
                BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                CellSpacing="2" GridLines="Vertical"
                EmptyDataText="There are no Articles" OnRowCancelingEdit="gvclass_RowCancelingEdit" OnRowDeleting="gvclass_RowDeleting" OnRowEditing="gvclass_RowEditing" OnRowUpdating="gvclass_RowUpdating">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label ID="lblarticleID"  runat="server" Text='<%# Eval("id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                                 <ItemTemplate>
                            <asp:Label ID="lbltitle" runat="server" Text='<%# Eval("title") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtarticlename" runat="server" Height="25px"
                                Text='<%# Bind("title") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Type Name">
                                 <ItemTemplate>
                            <asp:Label ID="lbltype" runat="server" Text='<%# Eval("type") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Link Date">
                                 <ItemTemplate>
                            <asp:Label ID="lbllinkexpiry" runat="server" Text='<%# Eval("linkexpiry") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>            
                  
                    <asp:CommandField HeaderText="Edit/Remove" ShowDeleteButton="True"
                        ShowEditButton="True" DeleteText="Remove" CausesValidation="false"/>
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
 </div>
      

</asp:Content>
