<%@ Page Title="SIDZA-Home Page" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true"
    MetaKeywords="online learning,online education,learning portal,CBSE learning,JKBOSE learning" CodeBehind="LogRegister.aspx.cs" Inherits="VirtualClassroom_final.UI.LogRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="../Scripts/jquery-1.9.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>

    <%--    <link rel="Stylesheet" href="../Styles/Site.css" />
    <link rel="stylesheet" type="text/css" href="../Scripts/engine2/style.css" />--
     
      <script type="text/javascript">
          $(document) {
              $('#lnkMyteacher').show();
          });
      </script> --%>
    <style>
        .carousel-inner > .item > img, .carousel-inner > .item > a > img {
            display: block;
            height: 400px;
            min-width: 100%;
            width: 100%;
            max-width: 100%;
            line-height: 1;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 60px;"></div>
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-5">

                <video controls class="img-rounded" poster="/img/poster.jpg" style="height: 400px; width: 100%; border: solid; border-color: green;">
                    <source src="../Upload/Videos/Introductry Video.mp4" type="video/mp4" />
                </video>

            </div>
            <div class="col-md-7">
                <div id="myCarousel" class="carousel slide img-rounded" data-ride="carousel" <%-- style="height: 362px; width: 700px;"--%>>
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                        <li data-target="#myCarousel" data-slide-to="3"></li>
                        <li data-target="#myCarousel" data-slide-to="4"></li>
                    </ol>
                    <div class="carousel-inner  img-rounded" <%-- style="height: 362px; width: 700px;"--%>>
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
    </div>
    <div>&nbsp;</div>
    <div class="row">
        <div class="col-md-4">
            <label>Watch Our sample Lectures</label>
            <div class="img-responsive img-rounded">
                <iframe width="640" height="360" style="display: block; max-height: 100%; max-width: 100%" src="https://www.youtube.com/embed/1uuk3qSM__I?&autoplay=0" frameborder="0" allowfullscreen></iframe>
            </div>
        </div>
        <div class="col-md-4">
            <label>Sample Lecture</label>
            <div class="img-responsive img-rounded">
                <iframe width="640" height="360" style="display: block; max-height: 100%; max-width: 100%" src="https://www.youtube.com/embed/R4lt1Ak7X6U?&autoplay=0" frameborder="0" allowfullscreen></iframe>
            </div>
        </div>
        <div class="col-md-4">
            <div class="well-lg">
                <p class="dwnld">DOWNLOAD STUDY MATERIAL HERE</p>
            </div>
            <div class="text-center">
                <div><a href="studymaterial.aspx" runat="server" style="font-size: large; color: green;"><span class="glyphicon glyphicon-hand-right">&nbsp;</span>CLASS 12th</a></div>
                <br />
                <div><a href="studymaterial.aspx" runat="server" style="font-size: large; color: green;"><span class="glyphicon glyphicon-hand-right">&nbsp;</span>CLASS 11th</a></div>
                <br />
                <div><a href="studymaterial.aspx" runat="server" style="font-size: large; color: green;"><span class="glyphicon glyphicon-hand-right">&nbsp;</span>CLASS 10th</a></div>
                <br />
                <div><a href="studymaterial.aspx" runat="server" style="font-size: large; color: green;"><span class="glyphicon glyphicon-hand-right">&nbsp;</span>CLASS 09th</a></div>
            </div>
        </div>
    </div>
    <br />
    <div class="row" style="padding-left: 20px;">
        <div class="col-md-6 col-md-6 img-rounded" style="height: 400px; border-style: solid; border-width: 2px; border-color: green;">
            <div class="well-sm">
                <h3 class="label-success badge" style="font-size: large; color: white;">ARTICLES</h3>
            </div>
            <hr style="border: solid; border-color: wheat;" />
            <marquee direction="up" scrollamount="1" scrolldelay="3" style="white-space: nowrap; overflow: hidden;"
                onmouseover="this.stop();" onmouseout="this.start();">
                  <asp:Panel ID="pnlarticles" runat="server">                  
                  </asp:Panel>
              </marquee>
        </div>

        <div class="col-md-6 col-md-6 img-rounded" style="height: 400px; border-style: solid; border-width: 2px; border-color: green;">
            <div class="well-sm">
                <h3 class="label-success badge" style="font-size: large; color: white">NEWS</h3>
            </div>
            <hr style="border: solid; border-color: wheat;" />
            <marquee direction="Up" scrollamount="1" scrolldelay="1" style="white-space: nowrap; overflow: hidden;"
                onmouseover="this.stop();" onmouseout="this.start();">
                   <asp:Panel ID="pnllatestnews" runat="server">                      
                   </asp:Panel>
               </marquee>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-12 img-rounded text-justify">
            <div class="algn">
                <nav class="navbar navbar-default nav-justified">
                    <div class="navbar-collapse" style="background-color: forestgreen;">
                        <ul class="nav navbar-nav" style="background-color: forestgreen; font-size: 12px;">
                            <li class=""><a href="About.aspx" runat="server" style="color: white; align-items: center;"><span class="glyphicon glyphicon-info-sign"></span>&nbsp;&nbsp;About Us</a></li>
                            <li class=""><a href="ContactUs.aspx" runat="server" style="color: white; align-items: center;"><span class="glyphicon glyphicon-earphone"></span>&nbsp;&nbsp;Contact Us</a></li>
                            <li class=""><a href="Disclaimer.aspx" runat="server" style="color: white; align-items: center;"><span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp;Terms and Conditions</a></li>
                            <li class=""><a href="PrivacyPolicy.aspx" runat="server" style="color: white; align-items: center;"><span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp;Privacy Policy</a></li>
                            <li class=""><a href="TeacherRegistration.aspx" runat="server" style="color: white; align-items: center;"><span class="glyphicon glyphicon-book"></span>&nbsp;&nbsp;Become a Teacher</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
            <h6>Developed and Maintained By: <a href="#">Peace4solutions </a></h6>
        </div>
    </div>
    <style>
        .dwnld {
            font-size: 25px;
            color: green;
            text-align: center;
            border: solid;
            border-color: green;
        }
        .algn{
            align-items:center;
        }
    </style>
</asp:Content>
