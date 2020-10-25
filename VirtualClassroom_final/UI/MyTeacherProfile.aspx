<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="MyTeacherProfile.aspx.cs" Inherits="VirtualClassroom_final.UI.MyTeacherProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function openfileDialogChange() {
            $('#ContentPlaceHolder1_flechImage').click();
        }
  </script>
 <script type="text/javascript">
     function ChangeFile(fileUpload) {
           if (fileUpload.value != '') {               
               $('#ContentPlaceHolder1_btnChangeProfilepic').click();
           }
       }
</script>
     <script type="text/javascript">
         function openfileDialogUpload() {
             $('#ContentPlaceHolder1_FleUplImage').click();
         }
     </script>  
 <script type="text/javascript">
           function UploadFile(fileUpload) {
               if (fileUpload.value != '') {
                   $('#ContentPlaceHolder1_btnUploadProfilepic').click();
               }
           }
</script>
 <script type="text/javascript">
     $(document).ready(function () {        
         $("#ContentPlaceHolder1_ContactNo").keypress(function (e) {            
             if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {               
                 alert("Only Digits Are Allowed");
                 return false;
             }
         });
     });    
 </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row" style="margin-top:60px;">
         <div class="col-md-8 col-md-offset-2">   
              <div class="modal-dialog" id="ShowProfile" runat="server">
               <div class="modal-content">
               <div class="modal-header">
                    <div align="center"  >
                    <h3 class="modal-title" >Teacher Profile</h3> 
                      </div>
               </div>
               <div class="modal-body">              
                  <div align="Center" >
                      <img src="../img/profile.png" runat="server" id="imgteacher" width="100" height="120" class="img-thumbnail img-responsive" />
                  </div><div>&nbsp;</div>
                    <div class="form-control">  
                    <b>  Name : <asp:Label runat="server" id="lblName"  text=""/> </b>
                    </div> <div>&nbsp;</div>
                    <div class="form-control">  
                     <b> Email :  <asp:Label runat="server" bg="danger" id="lblEmail"  text=""/> </b>
                    </div><div>&nbsp;</div>
                    <div class="form-control">  
                    <b>  Subject :  <asp:Label runat="server" id="lblsubject"  text=""/> </b>
                    </div><div>&nbsp;</div>
                    <div class="form-control">  
                    <b>  Contact No :  <asp:Label runat="server" id="lblContact"  text=""/> </b>
                    </div><div>&nbsp;</div>
                    <div class="form-control">  
                    <b>  Qualification :  <asp:Label runat="server" id="lblqualification"  text=""/> </b>
                    </div><div>&nbsp;</div>
                    <div class="form-control">  
                    <b>  Address :  <asp:Label runat="server" id="lbladdress"  text=""/> </b>
                    </div>
                 </div>
               <div class="modal-footer">                 
                       <div>
                           <a href="TeacherEditProfile.aspx" style="color:green;" id="lnkeditprofile" runat="server" data-toggel="modal"> <span> Edit Profile </span > </a>
                        </div>
                   </div>            
              </div>
             </div>                                 
                       
          </div>
       </div>      
</asp:Content>