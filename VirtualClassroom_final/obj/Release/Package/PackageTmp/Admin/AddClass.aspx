<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="AddClass.aspx.cs" Inherits="VirtualClassroom_final.Admin.AddClass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="row" style="margin-top:150px;margin-bottom:90px;">
    <div class="col-md-8 col-md-offset-2">    
         <asp:UpdatePanel ID="updateDetails" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
       <div class="">
           <table align="center">
               <tr>
                   <td>
                        <asp:Label ID="lblmsg" runat="server" CssClass="label-important" Font-Bold="true"></asp:Label>
                   </td>
               </tr>
               <tr>              
                   <td>
                    <asp:TextBox ID="txtClass" runat="server" CssClass="form-control" placeholder="Class Name"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtClass"
                        ErrorMessage="Class Name Required" ValidationGroup="btnAddClass" ForeColor="Red"></asp:RequiredFieldValidator>            
                   </td>
                </tr>
               <tr>
                  
                   <td>
                       <asp:Button ID="btnAddClass" runat="server" Text="Add Class" CssClass="btn btn-success"
                                        ValidationGroup="btnAddClass" OnClick="btnAddClass_Click" />
                      
                 </td>
                </tr>
                
           </table>
            
                
       </div>
       <br />
                           
          <div align="center" class="table table-responsive">
            <asp:GridView ID="gvclass" runat="server" Width="574px" CaptionAlign="Top"
                AutoGenerateColumns="False" Height="100px" BackColor="White"
                BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                CellSpacing="2" GridLines="Vertical"
                EmptyDataText="There are no classes" OnRowCancelingEdit="gvclass_RowCancelingEdit" OnRowDeleting="gvclass_RowDeleting" OnRowEditing="gvclass_RowEditing" OnRowUpdating="gvclass_RowUpdating">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:TemplateField HeaderText="Class ID">
                        <ItemTemplate>
                            <asp:Label ID="lblclassid"  runat="server" Text='<%# Eval("classid") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Class Name">
                                 <ItemTemplate>
                            <asp:Label ID="lblclassname" runat="server" Text='<%# Eval("classname") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtclassname" runat="server" Height="25px"
                                Text='<%# Bind("classname") %>' Width="41px"></asp:TextBox>

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
        </asp:UpdatePanel>
 </div>
 </div>
</asp:Content>
