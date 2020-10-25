<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminWelcome.aspx.cs" Inherits="VirtualClassroom_final.UI.AdminWelcome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%--    <script type="text/javascript">
        $(document).ready(function () {
            $('#lnkclass').click(function () {
                $('#my-modal').modal();
            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#lnksubject').click(function () {
                $('#my-modal2').modal();
            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#lnkChapter').click(function () {
                $('#my-modal3').modal();
            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#lnkTitle').click(function () {
                $('#my-modal4').modal();
            });
        });
    </script>
    <script type="text/javascript">

        //function disableback() {
        //    window.history.forward();
        //}
        //window.onload = disableback;
        //window.onpageshow = function disable(e) { if (e.persistant) { disableback(); } }
        //window.onunload = disableback;
    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblmsg2" runat="server"  CssClass="label-important" style="text-align:center;" Font-Bold="true"
        ForeColor="White"></asp:Label>        
       <asp:Label ID="lblmsg" runat="server" style="margin-left:30%;" CssClass="label-important" Font-Bold="true"  ForeColor="White"></asp:Label>
        <asp:Image runat="server" ImageUrl="~/img/Bookkeeping-Admin-Services-Barnsley-South-Yorkshire-Admin-Page.jpg" CssClass="hero-unit thumbnail" style="width:1250px;" />
        
 
    <asp:HiddenField ID="hdnadmininfo" runat="server" />
  <%--  <div class="modal hide fade" id="my-modal">
        <div class="modal-header">
            <button class="close" data-dismiss="modal">
                &times;</button>
            <h2>
                Add class</h2>
        </div>
        <div class="modal-body">            
                <table>
                    <tr>
                        <td >
                            <asp:Label ID="Label4" runat="server" Text="Class Name"></asp:Label>
                        </td>
                        <td >
                             <asp:TextBox ID="txtClass" runat="server" placeholder="Class Name"></asp:TextBox>
                        </td>
                        <td>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtClass"
                            ErrorMessage="Class Name Required" ValidationGroup="btnAddClass" ForeColor="Red"></asp:RequiredFieldValidator>
               
                        </td>
                    </tr>                    
                    <tr>
                        <td colspan="3" align="center">
                             <asp:Button ID="btnAddClass" runat="server" Text="Add Class" CssClass="btn btn-success"
                    ValidationGroup="btnAddClass" OnClick="btnAddClass_Click" />
                           
                        </td>
                    </tr>
                </table>
                
               
            
        </div>
        <div class="modal-footer">
            <a href="" class="btn btn-primary">Close</a>
        </div>
    </div>
    <div class="modal hide fade" id="my-modal2">
        <div class="modal-header">
            <button class="close" data-dismiss="modal">
                &times;</button>
            <h2>
                Add Subject</h2>
        </div>
        <div class="modal-body">
            <table>
                <tr>
                    <td>
                         <asp:Label ID="Label1" runat="server" Text="Class Name:"></asp:Label>
                    </td>
                    <td>
                          <asp:DropDownList ID="ddlClass" runat="server">
                            </asp:DropDownList>
                    </td>
                </tr>
                <tr>            
                    <td>
                        <asp:Label ID="lblSubject" runat="server" Text="Subject Name:"></asp:Label>
                    </td>
                    <td>
                          <asp:TextBox ID="txtSubject" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSubject"
                    ErrorMessage="Subject Name Required" ValidationGroup="btnAddSubject" ForeColor="Red"></asp:RequiredFieldValidator>
          
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                         <asp:Button ID="btnAddSubject" runat="server" Text="Add Subject" CssClass="btn btn-success"
                    ValidationGroup="btnAddSubject" OnClick="btnAddSubject_Click" />
                    </td>
                    
                </tr>
            </table>      
              
               </div>
        <div class="modal-footer">
            <a href="" class="btn btn-primary">Close</a>
            </div>
           
        </div>

    <div class="modal hide fade" id="my-modal3">
        <div class="modal-header">
            <button class="close" data-dismiss="modal">
                &times;</button>
            <h2>
                Add Chapter</h2>
        </div>
        <div class="modal-body">
             <asp:UpdatePanel ID="updPanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                 
             <table>
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
                              <asp:DropDownList ID="ddlsubject1" runat="server">
                        </asp:DropDownList>
                 
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
                      
              </table>       
         </ContentTemplate>
      <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlclass1" />
            <asp:AsyncPostBackTrigger ControlID="ddlsubject1" />
         </Triggers>
   </asp:UpdatePanel>   
            <table>
                  <tr>
                    <td colspan="2" align="center">
                         <asp:Button ID="btnAddChapter" runat="server" Text="Add Chapter" CssClass="btn btn-success"
                    ValidationGroup="btnAddChapter" OnClick="btnAddChapter_Click" />
                    </td>
                </tr>        
            </table>
        </div>
        <div class="modal-footer">
            <a href="" class="btn btn-primary">Close</a>
            </div>
           
        </div>

    <div class="modal hide fade" id="my-modal4">
        <div class="modal-header">
            <button class="close" data-dismiss="modal">
                &times;</button>
            <h2>
                Add Title</h2>
        </div>
        <div class="modal-body">
             <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
               <ContentTemplate>    
          <table>
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
                         <asp:DropDownList ID="ddllesson" runat="server"></asp:DropDownList>
                  </td>

              </tr>
               <tr>
                  <td>
                        <asp:Label ID="Label3" runat="server" Text="Title Name:"></asp:Label>
                    
                  </td>
                  <td>
                         <asp:TextBox ID="txttitle" runat="server"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txttitle"
                    ErrorMessage="Title Name Required" ValidationGroup="btnAddTitle" ForeColor="Red"></asp:RequiredFieldValidator> <br />
                  
                  </td>

              </tr>
              
          </table>  
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlclass2" />
            <asp:AsyncPostBackTrigger ControlID="ddlsubject2" />
             <asp:AsyncPostBackTrigger ControlID="ddllesson" />
        </Triggers>
    </asp:UpdatePanel>
           <table>
                <tr>
                  <td colspan="2">
                         <asp:Button ID="btnAddTitle" runat="server" Text="Add Title" CssClass="btn btn-success"
                    ValidationGroup="btnAddTitle" OnClick="btnAddTitle_Click" />
                  
                  </td>   

               </tr>
           </table>
        </div>
        <div class="modal-footer">
            <a href="" class="btn btn-primary">Close</a>
            </div>
           
        </div>--%>

</asp:Content>
