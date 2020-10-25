 <%@ Page Title="Teacher Sessisons" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="TeacherSessions.aspx.cs" Inherits="VirtualClassroom_final.UI.TeacherSetSessions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .CFont{
            font-size:16px;
        }
    </style>
    <div class="row" style="margin-top:30px;">          
          <div class="col-md-4 col-md-offset-1" style="margin-top:35px;">
                <h3><asp:Label ID="lblscheduleclass" runat="server" CssClass="label label-success" Text="List of class Session(s)"></asp:Label></h3>
            </div>     
        <div class="col-md-10 col-md-offset-1" runat="server">        
           <%-- <asp:Timer ID="ctlTimer" runat="server" Interval="1000" ontick="Timer1_Tick"></asp:Timer>   --%> 
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                 <Triggers>
                       <%-- <asp:AsyncPostBackTrigger ControlID="ctlTimer" eventname="Tick"/>  --%>                   
                    </Triggers>   
                <ContentTemplate>                 
            <asp:GridView ID="grdvwShowSessions" runat="server" CaptionAlign="Top" PageSize="10" AllowPaging="true" CssClass="table table-responsive table-hover"
                AutoGenerateColumns="False" CellPadding="3"  PagerSettings-Mode="NextPrevious"
                CellSpacing="2" GridLines="None"  OnPageIndexChanging="grdvwShowSessions_PageIndexChanging" OnRowCommand="grdvwShowSessions_RowCommand"
                OnRowDataBound="grdvwShowSessions_RowDataBound"
                EmptyDataText="No Sessions have been scheduled"> <AlternatingRowStyle BackColor="#DCDCDC" />   
                <HeaderStyle CssClass="info" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label ID="lbluserid" style="display:none;" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date of Schedule">
                        <ItemTemplate>                              
                                  <asp:Label ID="lblClassDate" CssClass="badge" style="font-size:x-large;" runat="server" Text='<%# Eval("date") %>'></asp:Label> 
                            </ItemTemplate>
                    </asp:TemplateField> 
                     <asp:TemplateField HeaderText="Student Name">
                        <ItemTemplate>
                            <span class="glyphicon glyphicon-user"></span>  
                                  <asp:Label ID="lblcontact" runat="server"  Text='<%# Eval("name") %>'></asp:Label>
                          </ItemTemplate>
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Grade">
                        <ItemTemplate>   
                            <span class="glyphicon glyphicon-certificate"></span>
                                  <asp:Label ID="lblemail" runat="server"  Text='<%# Eval("classname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Name of Subject">
                        <ItemTemplate> 
                            <span class="glyphicon glyphicon-book"></span>
                                  <asp:Label ID="lblgrade" runat="server"  Text='<%# Eval("subject") %>'></asp:Label>
                      </ItemTemplate>
                    </asp:TemplateField> 
                     <asp:TemplateField HeaderText="Name of Board">
                        <ItemTemplate>    
                            <span class="glyphicon glyphicon-blackboard"></span>
                                  <asp:Label ID="lblname" runat="server"  Text='<%# Eval("board") %>'></asp:Label> 
                          </ItemTemplate>
                    </asp:TemplateField>    

                     <asp:TemplateField>
                        <ItemTemplate>
                                  <span class="glyphicon glyphicon-time" id="tmIcon" runat="server"></span> <asp:Label ID="lbltimefrom" runat="server" style="font-size:large;"  Text='<%# Eval("timefrom") %>'></asp:Label>
                                  <asp:Label ID="lbltimeto" runat="server"  style="font-size:large;" Text='<%# Eval("timeto") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField> 
                    <asp:TemplateField>
                        <ItemTemplate>
                                  <asp:LinkButton ID="lnkbtnjoinsession" runat="server" CommandName="joinsession" CommandArgument='<%#Eval("sessionlink") %>'></asp:LinkButton>
                                   <asp:Label ID="lblExpiredSession" runat="server" CssClass="label label-danger CFont" Visible="false"></asp:Label>
                                  <asp:Button ID="btnCancelSession" runat="server" CommandName="cancel" CommandArgument="<%# Container.DataItemIndex %>" Text="Cancel Session" CssClass="btn-link" />
                                  <asp:Button ID="btnRescheduleSession" runat="server" CommandName="reschedule" CommandArgument="<%# Container.DataItemIndex %>" Text="Reschedule Session" CssClass=" btn-link" />                                                     
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
