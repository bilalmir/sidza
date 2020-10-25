<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" MaintainScrollPositionOnPostback="true" CodeBehind="AddChapter.aspx.cs" Inherits="VirtualClassroom_final.Admin.AddChapter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top:30px;margin-bottom:90px;">
       <asp:UpdatePanel ID="updateDetails" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
        <div class="">
            
          <table align="center">
              <tr>
                  <td colspan="2">
                       <asp:Label ID="lblmsg2" runat="server" CssClass="label-important" Font-Bold="true"
                            ForeColor="White"></asp:Label> 
                  </td>
              </tr><br />
              <tr>
                  <td>
                       <asp:Label ID="Label2" runat="server" Text="Class Name:"></asp:Label>
                  </td>
                  <td>
                         <asp:DropDownList ID="ddlclass1" runat="server" OnSelectedIndexChanged="ddlclass1_SelectedIndexChanged" AutoPostBack="true">
                        </asp:DropDownList>
                     
                  </td>
              </tr>
              <tr>
                  <td>
                         <asp:Label ID="lblSubject1" runat="server" Text="Subject Name:"></asp:Label>
                  </td>
                  <td>
                        <asp:DropDownList ID="ddlsubject1" runat="server"> </asp:DropDownList>
                     
                  </td>
              </tr>
              <tr>
                  <td>
                         <asp:Label ID="lblChapter" runat="server" Text="Chapter Name:"></asp:Label>
                      
                  </td>
                  <td>
                       <asp:TextBox ID="txtchapter" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtchapter"
                            ErrorMessage="Chapter Name Required" ValidationGroup="btnAddChapter" ForeColor="Red"></asp:RequiredFieldValidator>
                    
                  </td>
              </tr>
              <tr>
                  <td colspan="2" align="center">
                       <asp:Button ID="btnAddChapter" runat="server" Text="Add Chapter" CssClass="btn btn-success"
                    ValidationGroup="btnAddChapter" OnClick="btnAddChapter_Click" />
                  </td>
              </tr>
               
          </table>           
     
        </div><br />  
                  <div align="center">
            <asp:GridView ID="gvclass" runat="server"  CaptionAlign="Top"
                AutoGenerateColumns="False" Height="100px" BackColor="White"
                BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                CellSpacing="2" GridLines="Vertical"
                EmptyDataText="There are no Subjects" OnRowCancelingEdit="gvclass_RowCancelingEdit" OnRowDeleting="gvclass_RowDeleting" OnRowEditing="gvclass_RowEditing" OnRowUpdating="gvclass_RowUpdating">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:TemplateField HeaderText="Chapter ID">
                        <ItemTemplate>
                            <asp:Label ID="lbllessonid"  runat="server" Text='<%# Eval("lessonid") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Class Name">
                        <ItemTemplate>
                            <asp:Label ID="lblclassname"  runat="server" Text='<%# Eval("classname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Subject Name">
                        <ItemTemplate>
                            <asp:Label ID="lblsubjectid"  runat="server" Text='<%# Eval("subjectname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Chapter Name">
                                 <ItemTemplate>
                            <asp:Label ID="lbllessonname" runat="server" Text='<%# Eval("lessonname") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtlessonname" runat="server" Height="25px" Text='<%# Bind("lessonname") %>'></asp:TextBox>

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
            <asp:AsyncPostBackTrigger ControlID="ddlclass1"  EventName="SelectedIndexChanged"/>
            <asp:AsyncPostBackTrigger ControlID="ddlsubject1"  EventName="SelectedIndexChanged"/>
           
         </Triggers>
        </asp:UpdatePanel>

    </div>
</asp:Content>

