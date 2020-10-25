<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="FeedBack.aspx.cs" Inherits="VirtualClassroom_final.Admin.FeedBack" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">       
        <div align="center">
            <table align="center">
               <tr>
                  <td colspan="2">
                       <asp:Label ID="lblmsg" runat="server" CssClass="label-important" Font-Bold="true"
                            ForeColor="White"></asp:Label> 
                  </td>
               </tr>
                <tr>
                    <td style="font-size:larger">Queries and Reviews</td>
                </tr>
                </table><br />
            <asp:GridView ID="gvFeedback" runat="server" CaptionAlign="Top"
                AutoGenerateColumns="False" Height="100px" BackColor="White" 
                BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                CellSpacing="2" GridLines="Vertical" OnRowDeleting="gvFeedback_RowDeleting"
                EmptyDataText="There Are no reviews">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:TemplateField HeaderText="ID" Visible="False">
                        <ItemTemplate>
                             <asp:Label ID="lblfeedbackID"  runat="server" Text='<%# Eval("FeedbackID") %>'></asp:Label>                           
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                             <asp:Label ID="lblFeedBackName"  runat="server" Text='<%# Eval("Name") %>'></asp:Label>                           
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                                <asp:Label ID="lblFeedBackEmail"  runat="server" Text='<%# Eval("Email") %>'></asp:Label>                           
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contact">
                        <ItemTemplate>
                                <asp:Label ID="lblFeedBackContact"  runat="server" Text='<%# Eval("Contact") %>'></asp:Label>                           
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Message" HeaderStyle-Width="400px">
                        <ItemTemplate>
                             <asp:Label ID="lblFeedBackMessage"  runat="server" Text='<%# Eval("Message") %>'></asp:Label>  
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField  HeaderText="Remove Feedback" ShowDeleteButton ="true" DeleteText="Remove" CausesValidation="false"/>
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
   
</asp:Content>
