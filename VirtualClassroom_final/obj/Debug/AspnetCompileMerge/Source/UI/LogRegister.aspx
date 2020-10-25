<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="LogRegister.aspx.cs" Inherits="VirtualClassroom_final.UI.LogRegister" %>
 <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div  style="margin-top:80px;margin-bottom:50px;">
             <table class="text-center">
                 <tr>
                     <td class="pull-left">      
                         <div Style="margin-top:8px;border-style:solid;border-color:green; margin-left: 34px;width:640px;height:358px;">
                               <video controls Class="" poster="/img/poster.jpg" >
                                      <source src="../Upload/Videos/Introductry Video.mp4" type="video/mp4" />
                               </video>
                         </div>                  
                        
                       
                     </td>
                     <%--Slide show content here --%>
                     <td class="pull-right">      
                        <div id="wowslider-container2" class="badge" style="border-style:solid;border-color:green;">
                        <div class="ws_images">
                            <ul>
		                        <li><img src="../Scripts/data2/images/1.jpg" alt="" title="" id="wows2_0"/></li>
		                        <li><img src="../Scripts/data2/images/2.jpg" alt="" title="" id="wows2_1"/></li>
		                        <li><img src="../Scripts/data2/images/3.jpg" alt="" title="" id="wows2_2"/></li>
		                        <li><img src="../Scripts/data2/images/4.jpg" alt="" title="" id="wows2_3"/></li>
	                        </ul>
                        </div>
	                        <div class="ws_bullets">
                               <div>
		                        <a href="#" title=""><span><img src="../Scripts/data2/tooltips/1.jpg" alt=""/>1</span></a>
		                        <a href="#" title=""><span><img src="../Scripts/data2/tooltips/2.jpg" alt=""/>2</span></a>
		                        <a href="#" title=""><span><img src="../Scripts/data2/tooltips/3.jpg" alt=""/>3</span></a>
		                        <a href="#" title=""><span><img src="../Scripts/data2/tooltips/4.jpg" alt=""/>4</span></a>
	                           </div>
	                        </div>
                         
                        </div>	
                        <script type="text/javascript" src="../Scripts/engine2/wowslider.js"></script>
                        <script type="text/javascript" src="../Scripts/engine2/script.js"></script>
                       
                     </td>
                 </tr>
             </table>
            <br />
       <div style="width:98.5%;align-self:center;margin-left:5px;text-align:center;border-style:double;border-color:blue;border-width:5px; vertical-align:bottom"><br /><br />
           <div style="background-color:#228B22;width:99.9%;"><br />
              <asp:Label ID="lbl" runat="server" style="font-size:60px;color:white;" CssClass="badge badge-success"> DOWNLOAD   STUDY   MATERIAL   HERE</asp:Label><br /><br />
           </div>
            <br />
            <ul class="inline text-center">
                    <li class="">
                          <asp:HyperLink ID="HyperLink3" runat="server" ForeColor="white" Font-Size="Larger" CssClass="badge badge-success" NavigateUrl="~/UI/studymaterial.aspx">CLASS 12th</asp:HyperLink>
                    </li>
                    <li><a class="divider"></a></li>
                    <li class="">
                           <asp:HyperLink ID="HyperLink4" runat="server" ForeColor="white" Font-Size="Larger" CssClass="badge badge-success" NavigateUrl="~/UI/studymaterial.aspx">CLASS 11th</asp:HyperLink>
                    </li>
                    <li><a class="divider"></a></li>
                    <li class="">
                        <asp:HyperLink ID="HyperLink11" runat="server" ForeColor="white" Font-Size="Larger" CssClass="badge badge-success" NavigateUrl="~/UI/studymaterial.aspx">CLASS 10th</asp:HyperLink>
                    </li>
                    <li><a class="divider"></a></li>
                    <li class="">
                        <asp:HyperLink ID="HyperLink12" runat="server" ForeColor="white" Font-Size="Larger" CssClass="badge badge-success" NavigateUrl="~/UI/studymaterial.aspx">CLASS 9th</asp:HyperLink>
                    </li>
                </ul>
           <br />
        </div>
<br />
      <div style="text-align:center; width:99.9%;height:400px;">     
          <div class="pull-left" style="margin-left:4px;width:48%;height:390px;border-style:double;border-width:5px;border-color:blueviolet;">           
              <br />
                 <asp:HyperLink ID="HyperLink14" runat="server" ForeColor="White" Font-Size="Large" CssClass="label-inverse badge">ARTICLES</asp:HyperLink><br />
              <hr style="width:99.1%;border:solid;border-color:wheat;"/>
              <marquee direction="up" scrollamount="1" scrolldelay="3" style="margin-left:18%; white-space: nowrap; overflow: hidden;"
                   onmouseover="this.stop();" onmouseout="this.start();">
                  <asp:Panel ID="pnlarticles" runat="server">                  
                  </asp:Panel>
              </marquee>
                                    
          </div>

              <div class="pull-right" style="width:49.9%;height:390px;border-style:double;border-width:5px;border-color:blueviolet;">
              <br />
                <asp:HyperLink ID="HyperLink13" runat="server" ForeColor="White" Font-Size="Large" CssClass="label-inverse badge" >LATEST  NEWS</asp:HyperLink><br />
              <hr style="width:99.1%;border:solid;border-color:wheat;"/>
               <marquee direction="Up" scrollamount="1" scrolldelay="1"  style="margin-left:18%; white-space: nowrap; overflow: hidden;"                     
                    onmouseover="this.stop();" onmouseout="this.start();">
                   <asp:Panel ID="pnllatestnews" runat="server">                      
                   </asp:Panel>
               </marquee>   
                                   
          </div>        
      </div>
      <%--<div style="background-image:url('/img/bg-body.jpg');height:200px;">
          
      </div> --%>
     </div>   
       
  </asp:Content>