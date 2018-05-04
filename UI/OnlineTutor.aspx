<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="OnlineTutor.aspx.cs" Inherits="VirtualClassroom_final.UI.OnlineTutor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .shape{
                  padding-left:14px;
                  padding-right:14px;
                  padding-top:10px;
                  padding-bottom:10px;
                  display: table-cell;
                  text-align: center;
                  vertical-align: middle;
                  border-radius: 50%;
                  background: black;
                  color:white;
                  font-size:25px;
                  opacity:0.9;         
        }
        .show{
            font-size:20px;color:white;background-color:black;opacity:0.9;padding:4px 4px 4px 4px;
        }
    </style>
  </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
  <div class="row" style="margin-top:30px;">
      <div class="col-md-12">
        <div class="img-responsive" style="background-image: url('../img/elearning.jpg');width:2000px;height:800px;max-height:100%;opacity:0.9;max-width:100%;margin-left:0px;">
            <div class="col-md-8 col-md-offset-2">
                <div style="color:white;font-size:43px;font:bold;margin-top:50px;text-align:center;background-color:black;opacity:0.9;" class="img-rounded">
                    <label class="img-rounded">GET YOUR PERSONAL TEACHER</label>
                </div>
            </div>
                <div class="col-md-8 col-md-offset-2 img-rounded" style="margin-top:15px;font-size:30px;font:bold;text-align:center;opacity:0.9">
                    <div class="img-rounded" style="background-color:black;color:white;">
                        <span class="glyphicon glyphicon-pencil pull-left"></span><span class="pull-left" style="padding-left:6px;">Learn </span>
                        <span class="glyphicon glyphicon-hd-video"></span><span style="padding-left:6px;">Live</span>  
                        <span class="pull-right" style="padding-left:6px;">Online</span> <span class="glyphicon glyphicon-facetime-video pull-right"></span> 
                    </div>                   
                </div>
              <div class="col-md-4 col-md-offset-4 " style="margin-top:15px;">
                          <iframe width="420" height="315" class="table-responsive" src="https://www.youtube.com/embed/1uuk3qSM__I?&autoplay=0"></iframe>
             </div>  
            <div class="col-md-8 col-md-offset-2 img-rounded" style="color:white;font:25px;background-color:black;opacity:0.9;text-align:center;">
                <h3>Getting help is easier than you think</h3>
            </div>
            <div class="col-md-6 col-md-offset-3" style="margin-top:15px;">                        
               <div class="img-rounded">
                   <div class="pull-left img-rounded shape">Select from our tutors</div>
                   <div class="pull-right img-rounded shape">Book your class</div>
               </div>
            </div>
           <div class="col-md-4 col-md-offset-4">
               <div style="margin-top:30px;" class="img-rounded">
                   <a href="#C4" class=" btn btn-info btn-lg" style="font-size:40px;color:black;opacity:0.8;width:100%;font:bolder;">Get Started</a>
               </div>             
            </div>
        </div>  
  </div>
</div>
    <div class="row" id="C4">
         <div class=" col-md-12" id="divRegistrationDialog" runat="server">
             <div class="img-responsive" style="background-image: url('../img/elearning.jpg');width:2000px;height:800px;max-height:100%;opacity:0.9;max-width:100%;margin-left:0px;">
              <div class=" col-md-6 col-md-offset-3">
                 <div   style="background-color:black;height:200px;margin-top:135px;opacity:0.7;" class="img-rounded">
                     <h2 class="text-center" style="color:white;opacity:0.9;"><strong>What would you like to sign up as?</strong></h2>
                     <p class="lead text-center" style="color:white;opacity:0.9;">Your one-stop network for teaching and online tutoring.</p>
                     <div align="center" class="" style="opacity:1;">
                         <a href="Register.aspx" runat="server" class="btn" style="color:white;background-color:green;font-size:26px;font:bold;">Student</a>
                         <a href="TeacherRegistration.aspx" runat="server" class="btn" style="color:white;background-color:green;font-size:26px;font:bold;">Teacher</a>
                     </div>
                 </div>
             </div>      
             </div>
      </div>    
  </div>
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div><h1 style="text-align:center;">Choose from our online tutors</h1></div>
            <div class="form-inline form-group">
                <span>View Teachers For</span>&nbsp;
                <asp:DropDownList ID="drpSearchTeacher" runat="server" CssClass="form-control"></asp:DropDownList>&nbsp;
                <asp:Button ID="btnSearchteacher" runat="server"  CssClass="btn btn-primary" Text="Search Tutor" OnClick="btnSearchteacher_Click"/>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-8 col-md-offset-2" id="showprofile" runat="server" visible="false">        
            <asp:GridView ID="grdvwShowTeachers" runat="server" CaptionAlign="Top" PageSize="10" AllowPaging="true" CssClass="table table-responsive"
                AutoGenerateColumns="False" Height="100px" BackColor="White"  CellPadding="3"
                CellSpacing="2" GridLines="None"  OnPageIndexChanging="grdvwShowTeachers_PageIndexChanging"
                EmptyDataText="There is no material available">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:TemplateField HeaderStyle-CssClass="invisible" ItemStyle-CssClass="invisible">
                        <ItemTemplate>
                            <asp:Label ID="lbluserid"  runat="server" Text='<%# Eval("id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField>
                                 <ItemTemplate>
                            <asp:Image ID="imgTeacherImage" width="100" height="120" runat="server" ImageUrl='<%# Eval("profileimage") %>' CssClass=" img-thumbnail img-responsive" />
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
                           <asp:Button ID="btnShowTeacherProfile" runat="server" Text="View Profile" CssClass="btn btn-success form-control" OnClick="btnShowTeacherProfile_Click" />
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
