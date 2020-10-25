 <%@ Page Title="Teacher Sessisons" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="TeacherSetSessions.aspx.cs" Inherits="VirtualClassroom_final.UI.TeacherSetSessions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="margin-top:30px;">          
          <div class="col-md-4 col-md-offset-4" style="margin-top:35px;">
                <asp:Label ID="lblscheduleclass" runat="server" CssClass="label label-success"></asp:Label>
            </div>     
        <div class="col-md-12" runat="server">        
            <asp:Timer ID="ctlTimer" runat="server" Interval="1000" ontick="Timer1_Tick"></asp:Timer>    
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                 <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ctlTimer" eventname="Tick"/>                     
                    </Triggers>   
                <ContentTemplate>                 
            <asp:GridView ID="grdvwShowSessions" runat="server" CaptionAlign="Top" PageSize="10" AllowPaging="true" CssClass="table table-responsive table-hover"
                AutoGenerateColumns="False" CellPadding="3" BackColor="White"
                CellSpacing="2" GridLines="None"  OnPageIndexChanging="grdvwShowSessions_PageIndexChanging" OnRowCommand="grdvwShowSessions_RowCommand"
                OnRowDataBound="grdvwShowSessions_RowDataBound"
                EmptyDataText="No Sessions have been scheduled">              
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label ID="lbluserid" style="display:none;" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                               <div class="col-md-10 col-md-offset-1 img-rounded" style="font:bold;background-color:lightgrey">
                                  <asp:Label ID="lblClassDate" CssClass="badge" style="font-size:x-large;" runat="server" Text='<%# Eval("date") %>'></asp:Label>               
                                  <asp:Label ID="lblname" runat="server" CssClass="label label-primary" style="font-size:large;" Text='<%# Eval("board") %>'></asp:Label> 
                                  <asp:Label ID="lblemail" runat="server" style="font-size:large;" CssClass="label label-primary" Text='<%# Eval("classname") %>'></asp:Label>
                                  <asp:Label ID="lblgrade" runat="server" CssClass="label label-primary" style="font-size:large;" Text='<%# Eval("subject") %>'></asp:Label>
                                  <asp:Label ID="lblcontact" runat="server" CssClass="label label-primary" style="font-size:large;" Text='<%# Eval("name") %>'></asp:Label>
                                  <span class="glyphicon glyphicon-time"></span> <asp:Label ID="lbltimefrom" runat="server" style="font-size:large;" CssClass="label label-primary" Text='<%# Eval("timefrom") %>'></asp:Label>
                                  <asp:Label ID="lbltimeto" runat="server" CssClass="label label-primary" style="font-size:large;" Text='<%# Eval("timeto") %>'></asp:Label>
                                  <asp:LinkButton ID="lnkbtnjoinsession" runat="server" CommandName="joinsession" CommandArgument='<%#Eval("sessionlink") %>'></asp:LinkButton>
                                    
                              <div class="pull-right form-inline">
                                   <asp:Button ID="btnCancelSession" runat="server" CommandName="cancel" CommandArgument="<%# Container.DataItemIndex %>" Text="Cancel Session" CssClass="btn-link form-control" />
                                   <asp:Button ID="btnRescheduleSession" runat="server" CommandName="reschedule" CommandArgument="<%# Container.DataItemIndex %>" Text="Reschedule Session" CssClass=" btn-link form-control" />
                              </div>   
                             </div>                           
                      </ItemTemplate>
                    </asp:TemplateField>                                        
                </Columns>                         
                <PagerStyle BackColor="#851010" ForeColor="Black" HorizontalAlign="Center" />      
            </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
