<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="MyTeachers.aspx.cs" Inherits="VirtualClassroom_final.UI.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

    <asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="margin-top:30px;" >
        <div class="col-md-8 col-md-offset-2" id="showprofile" runat="server" visible="true">     
               
            <asp:GridView ID="grdvwShowTeacherProfile" runat="server" CaptionAlign="Top" PageSize="10" AllowPaging="true" CssClass="table table-responsive"
                AutoGenerateColumns="False" Height="100px" BackColor="White"  CellPadding="3"
                CellSpacing="2" GridLines="None" OnRowCommand="grdvwShowTeacherProfile_RowCommand"
                EmptyDataText="There are no tutors available" OnSelectedIndexChanged="grdvwShowTeacherProfile_SelectedIndexChanged">
                          <AlternatingRowStyle BackColor="#DCDCDC" />
                 <Columns>
                    
                       <asp:TemplateField HeaderStyle-CssClass="invisible" ItemStyle-CssClass="invisible">
                        <ItemTemplate>
                            <asp:Label ID="lbluserid"  runat="server" Text='<%# Eval("id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField>
                                 <ItemTemplate>
                            <asp:Image ID="imgTeacherImage" width="100" height="120" runat="server" ImageUrl='<%# Eval("profileimage") %>' CssClass=" img-thumbnail img-responsive"/>                                    
                        </ItemTemplate>                        
                    </asp:TemplateField>
                     <asp:TemplateField ItemStyle-CssClass="pull-left">
                                 <ItemTemplate>
                           <div  style="font-size:larger;font-weight:bold"><span>Name: </span><asp:Label ID="lblusername" runat="server" CssClass="label label-info" Text='<%# Eval("name") %>'></asp:Label></div>                        
                            <div style="margin-top:20px;font-size:larger;font-weight:bold"><span>Subject: </span><asp:Label ID="lblusersubject" runat="server" CssClass="label label-info" Text='<%# Eval("teacherSubject") %>'></asp:Label></div>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField ItemStyle-CssClass="text-center">
                                 <ItemTemplate>
                                    <asp:Button ID="btnTeacherProfile" runat="server" CommandName="showprofile"  CommandArgument="<%# Container.DataItemIndex %>" Text="View Profile" CssClass="btn btn-success form-control" />
                                    <span>&nbsp&nbsp</span>
                                    <asp:Button ID="btnSemdMesg" runat="server" Text="Send Message" CssClass="btn btn-success form-control" />
                                 </ItemTemplate>
                          </asp:TemplateField>                       
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
