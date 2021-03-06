﻿<%@ Page Title="SIDZA-Home Page" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true"
     MetaKeywords="online learning,online education,learning portal,CBSE learning,JKBOSE learning" CodeBehind="LogRegister.aspx.cs" Inherits="VirtualClassroom_final.UI.LogRegister" %>
 <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <%--    <link rel="Stylesheet" href="../Styles/Site.css" />
    <link rel="stylesheet" type="text/css" href="../Scripts/engine2/style.css" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="row" style="margin-top:50px;margin-left:10px;">
               <div class="col-md-6 img-responsive img-rounded">    
                         <div>
                               <video controls Class="img-responsive img-rounded" poster="/img/poster.jpg" style="height:362px;" >
                                      <source src="../Upload/Videos/Introductry Video.mp4" type="video/mp4" />
                               </video>
                         </div>                        
                </div>
               <div class="col-md-6 img-responsive img-rounded">
                  <div id="myCarousel" class="carousel slide">
                <ol class="carousel-indicators">
                  <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                  <li data-target="#myCarousel" data-slide-to="1"></li>
                  <li data-target="#myCarousel" data-slide-to="2"></li>
                  <li data-target="#myCarousel" data-slide-to="3"></li>
                  <li data-target="#myCarousel" data-slide-to="4"></li>
                </ol>
                <div class="carousel-inner img-responsive img-rounded" style="height:362px;">
                  <div class="item active">
                    <img src="../img/1.jpg" class="img-responsive img-rounded" alt="">                  
                  </div>
                  <div class="item">
                    <img src="../img/2.jpg" class="img-responsive img-rounded" alt="">                    
                  </div>
                  <div class="item">
                    <img src="../img/3.jpg" class="img-responsive img-rounded" alt="">                    
                  </div>
                  <div class="item">
                    <img src="../img/4.jpg" class="img-responsive img-rounded" alt="">                    
                  </div>
                 <div class="item">
                    <img src="../img/5.jpg" class="img-responsive img-rounded" alt="">                    
                  </div>
                </div>
              </div>                    
                </div>                   
     </div> 
     <div class="row" style="margin-top:50px;margin-left:10px;">
       <div class="col-md-6">
           <div class="img-responsive img-rounded">
               <iframe  width="640" height="360" style="display:block;max-height:100%;max-width:100%" src="https://www.youtube.com/embed/1uuk3qSM__I?&autoplay=0"   frameborder="0" allowfullscreen></iframe>
           </div>
       </div>
       <div class="col-md-6">
          <div class="img-responsive img-rounded">
              <iframe width="640" height="360" style="display:block;max-height:100%;max-width:100%" src="https://www.youtube.com/embed/R4lt1Ak7X6U?&autoplay=0"  frameborder="0" allowfullscreen></iframe>
          </div>
       </div>
   </div><br />
   <div class="row">
         <div class="col-md-7 offset3">
             <div class="well-lg" style="background-color:forestgreen;">
               <p style="font-size:25px;color:white;text-align:center">DOWNLOAD STUDY MATERIAL HERE</p>
             </div>
             <div class="" style="background-color:forestgreen;">           
                  <ul class="nav navbar-nav well-lg">
                    <li><a href="studymaterial.aspx" runat="server" class="img-rounded" style="font-size:large;color:white;background-color:forestgreen;"><span class="glyphicon glyphicon-book"></span> CLASS 12th</a></li>
                    <li><a class="divider"></a></li>
                    <li><a href="studymaterial.aspx" runat="server" class="img-rounded" style="font-size:large;color:white;background-color:forestgreen;"><span class="glyphicon glyphicon-book"></span> CLASS 11th</a></li>
                    <li><a class="divider"></a></li>
                    <li><a href="studymaterial.aspx" runat="server" class="img-rounded" style="font-size:large;color:white;background-color:forestgreen;"><span class="glyphicon glyphicon-book"></span> CLASS 10th</a></li>
                    <li><a class="divider"></a></li>
                    <li><a href="studymaterial.aspx" runat="server" class="img-rounded" style="font-size:large;color:white;background-color:forestgreen;"><span class="glyphicon glyphicon-book"></span> CLASS 9th</a></li>
                </ul>   
         </div>          
          </div>           
   </div>  
<br />
   <div class="row" style="margin-left:10px;">     
          <div class="col-md-6 img-rounded" style="height:400px;border-style:solid;border-width:2px;border-color:green;">           
              <div class="well-sm">
                  <h3 class="label-success badge"  style="font-size:large;color:white;">ARTICLES</h3>
              </div>
              <hr style="border:solid;border-color:wheat;"/>
                  <marquee direction="up" scrollamount="1" scrolldelay="3" style="white-space: nowrap; overflow: hidden;"
                   onmouseover="this.stop();" onmouseout="this.start();">
                  <asp:Panel ID="pnlarticles" runat="server">                  
                  </asp:Panel>
              </marquee>                                    
          </div>
         
          <div class="col-md-6 img-rounded" style="height:400px;border-style:solid;border-width:2px;border-color:green;">
              <div class="well-sm">
                  <h3 class="label-success badge"  style="font-size:large;color:white">NEWS</h3>
              </div>
              <hr style="border:solid;border-color:wheat;"/>
               <marquee direction="Up" scrollamount="1" scrolldelay="1"  style="white-space: nowrap; overflow: hidden;"                     
                    onmouseover="this.stop();" onmouseout="this.start();">
                   <asp:Panel ID="pnllatestnews" runat="server">                      
                   </asp:Panel>
               </marquee>                                      
          </div>        
   </div>
    <br />
<div class="row" style="margin-left:10px;">
    <div class="col-md-12 img-rounded">
        <nav class="navbar navbar-default">                 
           <div class="navbar-collapse" style="background-color:forestgreen;">               
                  <ul class="nav navbar-nav" style="background-color:forestgreen;font-size:12px;">
                        <li class="offset4"><a href="About.aspx" runat="server" style="color:white;align-items:center;"><span class="glyphicon glyphicon-info-sign"></span>&nbsp;&nbsp;About Us</a></li>                       
                        <li class=""><a href="ContactUs.aspx" runat="server" style="color:white;align-items:center;"><span class="glyphicon glyphicon-earphone"></span>&nbsp;&nbsp;Contact Us</a></li>                      
                        <li class=""><a href="Disclaimer.aspx" runat="server" style="color:white;align-items:center;"><span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp;Disclaimer</a></li>
                      <li class=""><a href="PrivacyPolicy.aspx" runat="server" style="color:white;align-items:center;"><span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp;Privacy Policy</a></li>
                    </ul>                    
               
           </div>    
        </nav>
         <h6>Designed and Maintained By: <a href="#">Peace4solutions</a></h6>
       </div>    
</div>                  
  </asp:Content>