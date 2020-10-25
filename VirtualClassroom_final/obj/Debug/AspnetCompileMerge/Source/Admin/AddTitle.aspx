<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="AddTitle.aspx.cs" Inherits="VirtualClassroom_final.Admin.AddTitle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top:30px;margin-bottom:90px;">
      
         <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
               <ContentTemplate>
      
        <table align="center">
            <tr>
                  <td colspan="2">
                       <asp:Label ID="lblmsg2" runat="server" CssClass="label-important" Font-Bold="true"
                            ForeColor="White"></asp:Label> 
                  </td>
              </tr><br />
            <tr>
                <td>
                     <asp:Label ID="lblclass" runat="server" Text="Class Name:"></asp:Label>
              
                </td>
                <td>
                      <asp:DropDownList ID="ddlclass2" runat="server" OnSelectedIndexChanged="ddlclass2_SelectedIndexChanged" AutoPostBack="true">
                      </asp:DropDownList>
              
                </td>
            </tr>
              <tr>
                <td>
                      <asp:Label ID="lblsubject2" runat="server" Text="Subject Name:"></asp:Label>
             
                </td>
                <td>
                           <asp:DropDownList ID="ddlsubject2" runat="server" OnSelectedIndexChanged="ddlsubject2_SelectedIndexChanged" AutoPostBack="true" >
                          </asp:DropDownList>
             
                </td>
            </tr>
              <tr>
                <td>
                      <asp:Label ID="lblchapter1" runat="server" Text="Chapter Name:"></asp:Label>
             
                </td>
                <td>
                      <asp:DropDownList ID="ddllesson" runat="server">
                </asp:DropDownList>
            
                </td>
            </tr>
            <tr>
                <td>
                       <asp:Label ID="Label3" runat="server" Text="Title Name:"></asp:Label>
            
                </td>
                <td>
                      <asp:TextBox ID="txttitle" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txttitle"
                    ErrorMessage="Title Name Required" ValidationGroup="btnAddTitle" ForeColor="Red"></asp:RequiredFieldValidator>
              
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="btnAddTitle" runat="server" Text="Add Title" CssClass="btn btn-success"
                    ValidationGroup="btnAddTitle" OnClick="btnAddTitle_Click" />
                </td>
            </tr>
              
        </table>
<br />
                  <div align="center">
            <asp:GridView ID="gvclass" runat="server" Width="574px" CaptionAlign="Top"
                AutoGenerateColumns="False" Height="100px" BackColor="White"
                BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                CellSpacing="2" GridLines="Vertical"
                EmptyDataText="There are no Subjects" OnRowCancelingEdit="gvclass_RowCancelingEdit" OnRowDeleting="gvclass_RowDeleting" OnRowEditing="gvclass_RowEditing" OnRowUpdating="gvclass_RowUpdating">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:TemplateField HeaderText="Title ID">
                        <ItemTemplate>
                            <asp:Label ID="lbltitleid"  runat="server" Text='<%# Eval("titleid") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Class Name">
                        <ItemTemplate>
                            <asp:Label ID="lblclassname"  runat="server" Text='<%# Eval("classname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Subject Name">
                        <ItemTemplate>
                            <asp:Label ID="lblsubjectname"  runat="server" Text='<%# Eval("subjectname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Chapter Name">
                        <ItemTemplate>
                            <asp:Label ID="lbllessonname"  runat="server" Text='<%# Eval("lessonname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Title Name">
                                 <ItemTemplate>
                            <asp:Label ID="lbltitlename" runat="server" Text='<%# Eval("titlename") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txttitlename" runat="server" Height="25px" Text='<%# Bind("titlename") %>'></asp:TextBox>

                        </EditItemTemplate>
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
            </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlclass2" />
            <asp:AsyncPostBackTrigger ControlID="ddlsubject2" />
             <asp:AsyncPostBackTrigger ControlID="ddllesson" />
        </Triggers>
    </asp:UpdatePanel>
                
    </div>
</asp:Content>
