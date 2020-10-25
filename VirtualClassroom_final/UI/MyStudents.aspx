<%@ Page Title="My Students" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="MyStudents.aspx.cs" Inherits="VirtualClassroom_final.UI.MyStudents" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="aa" %>
<%@ Register TagPrefix="Ajaxified" Assembly="Ajaxified" Namespace="Ajaxified" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            $('#ContentPlaceHolder1_imgPopup').click(function () {
                $('#ContentPlaceHolder1_CalendarExtender1').show();
            });
        });
    </script>

    <script type="text/javascript">
        function clientShowing(sender) {
            //sender is reference to the timepicker object
        }
        function clientShown(sender) {
            //sender is reference to the timepicker object
        }
        function clientHiding(sender) {
            //sender is reference to the timepicker object
        }
        function clientHidden(sender) {
            //sender is reference to the timepicker object
        }
        function selectionChanged(sender) {
            alert(sender._selectedTime);
        }
    </script>
    <script type='text/javascript'>
        function openModal() {
            $('[id*=dvshowSchedule]').modal('show');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="margin-top: 30px;">
        <h3>
            <asp:Label ID="lblscheduleclass" runat="server" CssClass="label label-success"></asp:Label></h3>
        <div class="col-md-4 col-md-offset-1" style="margin-top: 35px;">
            <h3>
                <asp:Label ID="Label1" runat="server" Text="List of Students"></asp:Label></h3>

        </div>

        <div class="col-md-9 col-md-offset-1" id="showprofile" runat="server">
            <asp:GridView ID="grdvwShowTeachers" runat="server" CaptionAlign="Top" PageSize="10" AllowPaging="true" CssClass="table table-responsive table-hover"
                AutoGenerateColumns="False" Height="100px" CellPadding="3" PagerSettings-Mode="NextPrevious"
                CellSpacing="2" GridLines="None" OnPageIndexChanging="grdvwShowTeachers_PageIndexChanging" OnRowCommand="grdvwShowTeachers_RowCommand"
                EmptyDataText="There are no tutors available">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <HeaderStyle CssClass="info" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label ID="lbluserid" Style="display: none;" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <span class="	glyphicon glyphicon-user"></span>
                            <asp:Label ID="lblname" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <span class="glyphicon glyphicon-envelope"></span>
                            <asp:Label ID="lblemail" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Grade">
                        <ItemTemplate>
                            <span class="glyphicon glyphicon-certificate"></span>
                            <asp:Label ID="lblgrade" runat="server" Text='<%# Eval("grade") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contact">
                        <ItemTemplate>
                            <span class="glyphicon glyphicon-earphone"></span>
                            <asp:Label ID="lblcontact" runat="server" Text='<%# Eval("contact") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div class="pull-right">
                                <span class="glyphicon glyphicon-time"></span>
                                <asp:Button ID="btnSessionHistory" runat="server" CommandName="sessionhistory" CommandArgument="<%# Container.DataItemIndex %>" Text="Session History" CssClass="btn-link" />
                                <span>&nbsp;&nbsp;</span>
                                <span class="glyphicon glyphicon-send"></span>
                                <a href="#" data-target="#sendmessage" data-toggle="modal" data-backdrop="false" class="btn-link" id="A1" runat="server">Send Message</a>
                                <span>&nbsp;&nbsp;</span>
                                <span class="glyphicon glyphicon-modal-window"></span>
                                <%--<a href="#" data-target="#dvshowSchedule" data-toggle="modal"  data-backdrop="false"  class="btn-link" id="btnScheduleClass" runat="server"></a>--%>
                                <asp:LinkButton ID="lnkScheduleClass" runat="server" Text="Schedule Class" class="btn-link" OnClick="lnkBtnEdit_Click"></asp:LinkButton>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>

            <div class="modal fade" id="dvshowSchedule" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Schedule Class</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <asp:DropDownList ID="drpdwnSubjectList" runat="server" CssClass="form-control"></asp:DropDownList>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" runat="server" ControlToValidate="txtemail"
                                    ErrorMessage="* Email Name Required" ValidationGroup="btnSetClassSchedule" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="Enter student email"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" runat="server" ControlToValidate="txtemail"
                                    ErrorMessage="* Email Name Required" ValidationGroup="btnSetClassSchedule" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtgrade" runat="server" CssClass="form-control" placeholder="Enter Grade of the Student"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ControlToValidate="txtgrade"
                                    ErrorMessage="* Student grade required" ValidationGroup="btnSetClassSchedule" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txttopic" runat="server" CssClass="form-control" placeholder="Enter topic details"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ControlToValidate="txttopic"
                                    ErrorMessage="* Topic name required" ValidationGroup="btnSetClassSchedule" ForeColor="Red"></asp:RequiredFieldValidator>
                                <%--    <asp:TextBox ID="txtdate" runat="server" CssClass="form-control" placeholder="Enter date here" ValidationGroup="btnSetClassSchedule"></asp:TextBox>
                             <aa:CalendarExtender ID="CalendarExtender1" PopupButtonID="imgPopup" runat="server" TargetControlID="txtDate"
                          Format="dd/MM/yyyy"></aa:CalendarExtender><button class="glyphicon glyphicon-calendar" id="imgPopup"></button>                            
                        
                            <input type="date" ID="date1" runat="server" class="glyphicon glyphicon-calendar form-control " />
                                --%>
                                <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" runat="server" ControlToValidate="txtDate"
                                    ErrorMessage="* Date Required" ValidationGroup="btnSetClassSchedule" ForeColor="Red"></asp:RequiredFieldValidator>
                                <label>Start Time :</label>
                                <asp:TextBox ID="txtStartTim" runat="server" TextMode="Time" CssClass="form-control"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Display="Dynamic" runat="server" ControlToValidate="txtStartTim"
                                    ErrorMessage="* Start Time Required" ValidationGroup="btnSetClassSchedule" ForeColor="Red"></asp:RequiredFieldValidator>
                                <label>End Time :</label>
                                <asp:TextBox ID="txtEndTime" runat="server" TextMode="Time" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="Dynamic" runat="server" ControlToValidate="txtEndTime"
                                    ErrorMessage="* End Time Required" ValidationGroup="btnSetClassSchedule" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btnSetClassSchedule" runat="server" CssClass="btn btn-primary" ValidationGroup="btnSetClassSchedule" Text="Schedule Now" OnClick="btnSetClassSchedule_Click" />
                                <button class=" btn btn-primary" data-dismiss="modal">Cancel</button>
                            </div>
                        </div>
                    </div>
                </div>

                <%--          <div class="modal fade" id="sendmessage" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <asp:Button ID="Button1" runat="server" CssClass="close btn-link" Text="close"/>
                        <h4 class="modal-title">Email this Teacher</h4> 
                    </div>
                    <div class="modal-body">
                        <div><asp:TextBox ID="txtname" runat="server" placeholder="enter name" CssClass="form-control"></asp:TextBox></div>
                        <div><asp:TextBox ID="TextBox1" runat="server" placeholder="enter grade" CssClass="form-control"></asp:TextBox></div>
                        <div><asp:TextBox ID="TextBox2" runat="server" placeholder="enter email" CssClass="form-control"></asp:TextBox></div>
                        <div><asp:TextBox ID="txtcontact" runat="server" placeholder="enter contact" CssClass="form-control"></asp:TextBox></div>
                        <div><asp:TextBox ID="txtmessage" runat="server" placeholder="enter message" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></div>
                    </div>
                    <div class="modal-footer">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"  ControlToValidate="txtname"
                            CssClass=" pull-right" ErrorMessage="* Name Required" ForeColor="Red" Font-Size="Smaller"
                            Display="Dynamic" ValidationGroup="btnsend"></asp:RequiredFieldValidator><br />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"  ControlToValidate="txtemail"
                            CssClass=" pull-right" ErrorMessage="* Email Required" ForeColor="Red" Font-Size="Smaller"
                            Display="Dynamic" ValidationGroup="btnsend"></asp:RequiredFieldValidator><br />
                         <asp:RegularExpressionValidator ID="rglrexprsn" runat="server" ForeColor="Red"  ControlToValidate="txtemail"
                            ErrorMessage="* Wrong Email Format" CssClass=" pull-right" ValidationExpression='\w+([-+.&#039;]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*'
                            ValidationGroup="btnsend" Font-Size="Smaller"></asp:RegularExpressionValidator><br />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"  ControlToValidate="txtcontact"
                            CssClass=" pull-right" ErrorMessage="* Contact Required" ForeColor="Red" Font-Size="Smaller"
                            Display="Dynamic" ValidationGroup="btnsend"></asp:RequiredFieldValidator><br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="btnsend" CssClass=" pull-right" ForeColor="Red" 
                           ControlToValidate="txtcontact" runat="server"  ErrorMessage="Only Numbers allowed" Font-Size="Smaller"
                            ValidationExpression="\d+"></asp:RegularExpressionValidator><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"  ControlToValidate="txtmessage"
                        CssClass="pull-right " ErrorMessage="* Enter your message" ForeColor="Red" Font-Size="Smaller"
                        Display="Dynamic" ValidationGroup="btnsend"></asp:RequiredFieldValidator><br />
                         <asp:Button ID="btnsend" runat="server" ValidationGroup="btnsend" Text="Send email" CssClass="btn btn-default"  OnClick="btnsend_Click"/>
                         
                    </div>
                </div>
            </div>--%>
            </div>

        </div>
    </div>

</asp:Content>
