<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="StudentProfile.aspx.cs" Inherits="VirtualClassroom_final.UI.StudentProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row" style="margin-top:60px;">
         <div class="col-md-8 col-md-offset-2">   
              <div class="modal-dialog">
               <div class="modal-content">
               <div class="modal-header">
                    <div align="center"  >
                    <h3 class="modal-title" >Student Profile</h3> 
                      </div>
               </div>

                <div class="modal-body">
              
                  <div align="Center" >
                      <img src="../img/profile.png" runat="server" id="imgStu" width="100" height="120" class="img-thumbnail img-responsive" />
                  </div><div>&nbsp;</div>
                    <div class="form-control">  
                    <b>  Name : <asp:Label runat="server" id="lblName"  text=""/> </b>
                    </div> <div>&nbsp;</div>
                    <div class="form-control">  
                     <b> Email :  <asp:Label runat="server" bg="danger" id="lblEmail"  text=""/> </b>
                    </div><div>&nbsp;</div>
                    <div class="form-control">  
                    <b>  Board :  <asp:Label runat="server" id="lblBoard"  text=""/> </b>
                    </div><div>&nbsp;</div>
                    <div class="form-control">  
                    <b>  Contact No :  <asp:Label runat="server" id="lblContact"  text=""/> </b>
                    </div>
                 </div>
                   <div class="modal-footer">
                 
                       <div>
                           <a href="StuEditProfile.aspx" style="color:green;" ID="lnkChangePic" runat="server" Font-Bold="true"> <span> Edit Profile </span > </a>
                        </div>
                   </div>
                             
           </div>
             </div> 
          </div>

       </div>      
</asp:Content>