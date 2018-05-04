<%@ Page Title="SIDZA- Video Lectures" Language="C#" MasterPageFile="~/UI/Home.Master" Async="true" AutoEventWireup="true"
    MetaKeywords="CBSE lectures,JKBOSE lectures,video,science,mathematics,physics,chemistry,watch videos"   CodeBehind="VideoLectures.aspx.cs" Inherits="VirtualClassroom_final.UI.VideoLectures" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   
  
    <div  class="row" style="margin-top:30px;">
      <div class="col-md-4 col-md-offset-1">
                      <h3 style="font-size:x-large;color:green;">Watch Video Lectures</h3>          
             <table class="table table-bordered">
                 <tr>                   
                    <td> <div class="pagination-centered">
                      <asp:Label ID="lableclass" runat="server" Text="Class Name" Font-Size="Medium" ForeColor="green"></asp:Label>
                        <asp:DropDownList ID="ddlclass" runat="server" Width="200"  Font-Bold="true" Font-Size="Larger" AutoPostBack="True" CssClass="btn-success pull-right" ForeColor="White"
                              OnSelectedIndexChanged="ddlclass_SelectedIndexChanged"  style="border-color:Gray;"></asp:DropDownList>
                           </div>
                    </td>
                </tr>
                <tr>                    
                    <td>
                        <div class="pagination-centered"> 
                         <asp:Label ID="Label4" runat="server" Text="Subject Name" Font-Size="Medium" ForeColor="green"></asp:Label>
                          <asp:DropDownList ID="ddlsubject" runat="server" Width="200"  Font-Bold="true" Font-Size="Larger" AutoPostBack="True" CssClass="btn-success pull-right" ForeColor="White"
                         OnSelectedIndexChanged="ddlsubject_SelectedIndexChanged" style="border-color:Gray;"></asp:DropDownList>  </div>
                                       
                    </td>
                </tr>
                <tr>                    
                    <td> 
                      <div class="pagination-centered"> 
                        <asp:Label ID="Label3" runat="server" Text="Chapter Name" Font-Size="Medium" ForeColor="green"></asp:Label> 
                         <asp:DropDownList ID="ddllesson" runat="server" Width="200"  Font-Bold="true" Font-Size="Larger" AutoPostBack="True" CssClass="btn-success pull-right" ForeColor="White"
                       OnSelectedIndexChanged="ddllesson_SelectedIndexChanged"  style="border-color:Gray;"></asp:DropDownList>
                          </div>
                    </td>
                </tr>
            </table>                   
    </div>
      <div class="col-xs-7"></div>
        
</div>
<div class="row"  style="margin-top:10px;margin-left:10px;margin-bottom:30px;">
 <div class="col-md-9">
  <h3 style="color:green;margin-bottom:5px;" runat="server" id="h3" visible="false">Watch Here<span class="glyphicon glyphicon-hand-down"></span> </h3>
    <cc1:Accordion id="Accordion1" runat="server" SuppressHeaderPostbacks="true" OnItemDataBound="Accordion1_ItemDataBound"> 
         <HeaderTemplate> 
          <div style="margin-top:8px;"> 
            <span class="glyphicon glyphicon-play-circle"></span> <asp:LinkButton  runat="server" Id="lbHeaderId" style="color:green;font-size:16px;" Text='<%#Eval("title") %>'></asp:LinkButton> </div>
         </HeaderTemplate>        
        <ContentTemplate> 
              <asp:HiddenField runat="server" id="hdnfilename" value='<%#Eval("filename") %>'></asp:HiddenField> 
          <asp:GridView ID="grdvvid" EmptyDataText="There are no Videos available."  runat="server"  AutoGenerateColumns="False" OnRowDataBound="grdvvid_RowDataBound" >
          <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                       <%--<asp:Literal ID="vidltr" style="height:500px;width:900px;" class='img-responsive img-rounded' runat="server"></asp:Literal>--%>
                       <asp:Label ID="vidltr"  runat="server"></asp:Label>
                       
                </ItemTemplate>
            </asp:TemplateField> 
            <asp:BoundField DataField="filename" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden"/>          
        </Columns>
     <EmptyDataTemplate>
           <asp:Label runat="server" Id="lbHeaderId" ForeColor="#851010" Font-Size="Large" Text=""> </asp:Label> 
     </EmptyDataTemplate>
     </asp:GridView> 

        </ContentTemplate>
    </cc1:Accordion>      
    
</div>
 <div class="col-md-3">
     <%--Space for Ads --%>
 </div>
</div>
</asp:Content>
