<%@ Page Title="Teacher Profile" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="TeacherProfile.aspx.cs" Inherits="VirtualClassroom_final.UI.TeacherProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="margin-top: 50px;">
        <div class="col-md-4 col-md-offset-4" >
          <h2><asp:Label ID="lblconfirmation" runat="server" CssClass="label label-success"></asp:Label></h2>
        </div>
        <div class="col-md-4 col-md-offset-4">
            <div class="modal-header">
                <h2 class="modal-title">Teacher Profile</h2>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <asp:Image ID="imgteacherImage" runat="server" Width="150" Height="170" class="img-thumbnail img-responsive" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-2">
            <div class="modal-body">
                <h2><span class="label label-success">Personal Information</span></h2>               
                <h3>
                    <span >Name: </span>&nbsp;&nbsp;&nbsp;<asp:Label ID="lblteachername" runat="server" ></asp:Label><br />
                    <span >Subject: </span>&nbsp;&nbsp;&nbsp;<asp:Label ID="lblteachersubject" runat="server" ></asp:Label><br />
                </h3>
            </div>
        </div>
        <div class="col-md-4">
            <div class="modal-body">
                <h2><span class="label label-success">Qualification</span></h2>               
                <h3>
                    <asp:Label ID="lblteacherqualification1" runat="server" ></asp:Label><br />
                    <asp:Label ID="lblteacherqualification2" runat="server" ></asp:Label><br />
                    <asp:Label ID="lblteacherqualification3" runat="server" ></asp:Label><br />
                </h3>
            </div>
        </div>
   
        <div class="col-md-4 col-md-offset-2">
            <div class="modal-body">
                <h2><span class="label label-success">Subjects Taught</span></h2>               
                <h3>
                    <asp:Label ID="lblteachersubject1" runat="server" ></asp:Label><br />
                    <asp:Label ID="Label2" runat="server" ></asp:Label><br />
                    <asp:Label ID="Label3" runat="server" ></asp:Label><br />
                    <asp:Label ID="Label4" runat="server" ></asp:Label><br />
                </h3>
            </div>
        </div>
        <div class="col-md-4">
            <div class="modal-body">
                <h2><span class="label label-success">Contact Details</span></h2>               
                <h3>
                    <span >Address: </span>&nbsp;&nbsp;&nbsp;<asp:Label ID="lblteacheraddress" runat="server" ></asp:Label><br />
                    <span >Contact No: </span>&nbsp;&nbsp;&nbsp;<asp:Label ID="lblteachercontact" runat="server" ></asp:Label><br />
                    <span >Email: </span>&nbsp;&nbsp;&nbsp;<asp:Label ID="lblteacheremail" runat="server" ></asp:Label>
                </h3>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-3">
            <div class="modal-footer">
                <a href="#" data-target="#sendemail" data-toggle="modal" class="btn btn-default" data-backdrop="false">Email / Message to Teacher</a>
                <asp:Button ID="btnclose" runat="server" Text="Close" CssClass="btn btn-default" PostBackUrl="~/UI/OnlineTutor.aspx" />

            </div>
        </div>
    </div>
    <div class="modal fade" id="sendemail" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <Button  Class="close btn-link">X</Button>
                    <h4 class="modal-title">Email this Teacher</h4>
                </div>
                <div class="modal-body">
                    <div>
                        <asp:TextBox ID="txtname" runat="server" placeholder="enter name" CssClass="form-control"></asp:TextBox>
                    </div>
                    <span>&nbsp;</span>
                    <div>
                        <asp:TextBox ID="txtgrade" runat="server" placeholder="enter grade" CssClass="form-control"></asp:TextBox>
                    </div>
                    <span>&nbsp;</span>
                    <div>
                        <asp:TextBox ID="txtemail" runat="server" placeholder="enter email" CssClass="form-control"></asp:TextBox>
                    </div>
                    <span>&nbsp;</span>
                    <div>
                        <asp:TextBox ID="txtcontact" runat="server" placeholder="enter contact" CssClass="form-control"></asp:TextBox>
                    </div>
                    <span>&nbsp;</span>
                    <div>
                        <asp:TextBox ID="txtmessage" runat="server" placeholder="enter message" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    </div>

                </div>
                <div class="modal-footer">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname"
                        CssClass=" pull-right" ErrorMessage="* Name Required" ForeColor="Red" Font-Size="Smaller"
                        Display="Dynamic" ValidationGroup="btnsend"></asp:RequiredFieldValidator><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtemail"
                        CssClass=" pull-right" ErrorMessage="* Email Required" ForeColor="Red" Font-Size="Smaller"
                        Display="Dynamic" ValidationGroup="btnsend"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="rglrexprsn" runat="server" ForeColor="Red" ControlToValidate="txtemail"  Display="Dynamic"
                        ErrorMessage="* Wrong Email Format" CssClass=" pull-right" ValidationExpression='\w+([-+.&#039;]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*'
                        ValidationGroup="btnsend" Font-Size="Smaller"></asp:RegularExpressionValidator><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtcontact"
                        CssClass=" pull-right" ErrorMessage="* Contact Required" ForeColor="Red" Font-Size="Smaller"
                        Display="Dynamic" ValidationGroup="btnsend"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="btnsend" CssClass=" pull-right" ForeColor="Red"  Display="Dynamic"
                        ControlToValidate="txtcontact" runat="server" ErrorMessage="Only Numbers allowed" Font-Size="Smaller"
                        ValidationExpression="\d+"></asp:RegularExpressionValidator><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtmessage"
                        CssClass="pull-right " ErrorMessage="* Enter your message" ForeColor="Red" Font-Size="Smaller"
                        Display="Dynamic" ValidationGroup="btnsend"></asp:RequiredFieldValidator><br />
                    <asp:Button ID="btnsend" runat="server" ValidationGroup="btnsend" Text="Send email" CssClass="btn btn-default" OnClick="btnsend_Click" />

                </div>
            </div>
        </div>
    </div>


</asp:Content>
