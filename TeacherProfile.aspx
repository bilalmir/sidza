<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="TeacherProfile.aspx.cs" Inherits="VirtualClassroom_final.UI.TeacherProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row" style="margin-top:50px;">
         <div class="col-md-8 col-md-offset-2">
             <div class="modal-dialog">
                 <div class="modal-content">
                     <div class="modal-header">
                         <h2 class="modal-title">Teacher Profile</h2>
                     </div>
                     <div class="modal-body">
                         <div>
                             <asp:Image ID="imgteacherImage" runat="server" />
                             <span class="label label-primary">Name: </span><asp:Label ID="lblteachername" runat="server" CssClass="label label-info"></asp:Label>
                              <span class="label label-primary">Subject: </span><asp:Label ID="lblteachersubject" runat="server" CssClass="label label-info"></asp:Label>
                         </div>
                         <div>
                              <span class="label label-primary">Qualification: </span>
                             <div>
                                 <asp:Label ID="lblteacherqualification1" runat="server" CssClass="label label-info"></asp:Label><br />
                                 <asp:Label ID="lblteacherqualification2" runat="server" CssClass="label label-info"></asp:Label><br />
                                 <asp:Label ID="lblteacherqualification3" runat="server" CssClass="label label-info"></asp:Label><br />
                                 <asp:Label ID="lblteacherqualification4" runat="server" CssClass="label label-info"></asp:Label>
                            </div>
                         </div>
                          <div>
                              <span class="label label-primary">Subject Taught: </span>
                             <div>
                                 <asp:Label ID="lblteachersubject1" runat="server" CssClass="label label-info"></asp:Label><br />
                                 <asp:Label ID="Label2" runat="server" CssClass="label label-info"></asp:Label><br />
                                 <asp:Label ID="Label3" runat="server" CssClass="label label-info"></asp:Label><br />
                                 <asp:Label ID="Label4" runat="server" CssClass="label label-info"></asp:Label>
                            </div>
                         </div>
                         <div>
                             <span class="label label-primary">Contact Details: </span>
                             <div class="form-inline">
                                  <span class="label label-primary">Address: </span><asp:Label ID="lblteacheraddress" runat="server" CssClass="label label-info"></asp:Label><br />
                                  <span class="label label-primary">Contact No: </span><asp:Label ID="lblteachercontact" runat="server" CssClass="label label-info"></asp:Label><br />
                                  <span class="label label-primary">Email: </span><asp:Label ID="lblteacheremail" runat="server" CssClass="label label-info"></asp:Label>
                            </div>
                         </div>
                     </div>
                     <div class="modal-footer"></div>
                 </div>
             </div>
         </div>
     </div>
</asp:Content>
