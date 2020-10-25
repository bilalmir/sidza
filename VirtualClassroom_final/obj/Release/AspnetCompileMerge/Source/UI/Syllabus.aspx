<%@ Page Title="SIDZA-Syllabus" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" 
     MetaKeywords="JKBOSE syllabus,CBSE syllabus,download syllabus,all streams syllabus,study material,all classes,all standards" CodeBehind="Syllabus.aspx.cs" Inherits="VirtualClassroom_final.UI.Syllabus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <asp:UpdatePanel ID="updPanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>     
  <div class="row"  style="margin-top:50px;">
    <div class="col-md-10 col-md-offset-1">              
           <h3 style="font-size:Large;color:green;font:bold;">Download Syllabus</h3>
               <table class="table table-bordered table-responsive">
                   <tr>
                       <td>        
                     <asp:Label ID="lableclass" runat="server" Text="Class Name" Font-Bold="true" Font-Size="Medium" ForeColor="white"></asp:Label>    
                      <asp:DropDownList ID="ddlclass" runat="server" Font-Size="Medium" AutoPostBack="True" CssClass="btn-success form-control" ForeColor="White"
                      OnSelectedIndexChanged="ddlclass_SelectedIndexChanged"  style="border-color:Gray;">
                    </asp:DropDownList>       
                    </td>
                <td>
                          <asp:Label ID="Label2" runat="server" Text="Subject Name" Font-Bold="true" Font-Size="Medium" ForeColor="white"></asp:Label>    
                       <asp:DropDownList ID="ddlsubject" runat="server" Font-Size="Large" AutoPostBack="True" CssClass="btn-success form-control" ForeColor="White"
                      OnSelectedIndexChanged="ddlsubject_SelectedIndexChanged" style="border-color:Gray;">
                      </asp:DropDownList>
                 </td> 
                  <asp:Label ID="lblmsg" runat="server"></asp:Label>       
               </tr>
             </table> 
   </div>
</div>
   <div class="row" style="margin-top:10px;margin-left:10px;margin-bottom:10px;">
    <div class="col-md-3">
        <asp:GridView ID="grddownloadmaterial"  EmptyDataText="No Syllabus is available."  runat="server" Width="290px" AutoGenerateColumns="False" FooterStyle-BackColor="AntiqueWhite" Font-Size="Small"
          BorderStyle="None"   OnRowDataBound="grddownloadmaterial_RowDataBound">
            <RowStyle BackColor="#DCDCDC" />           
            <PagerStyle BackColor="Red" ForeColor="Black" HorizontalAlign="Center" />
            <HeaderStyle BackColor="AliceBlue" Font-Bold="True" ForeColor="Black" />
            <EmptyDataRowStyle BackColor="#eeeeee" BorderColor="Black"
                    BorderStyle="Solid" BorderWidth="1px" Font-Size="Large" ForeColor="#851010"
                    HorizontalAlign="Center" />
              <Columns>
            <asp:TemplateField HeaderText="Title Name" HeaderStyle-CssClass="text-left text-info" ControlStyle-CssClass="text-left">
                <ItemTemplate>
                  
                    <asp:Literal ID="ltrFilename" runat="server" Text='<% #Eval("filename") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Preview">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkbtnFile" runat="server" Text="&nbsp;&nbsp;&nbsp;Preview&nbsp;&nbsp;&nbsp;" 
                        OnClick="lnkbtnFile_Click"></asp:LinkButton> 
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Download">
                    <ItemTemplate>
<%--                        <asp:ImageButton ID="btndownload" ImageUrl="../img/download1.jpg" runat="server" Width="25" Height="25" OnClick="btndownload_Click"/>--%>
                        <asp:Literal ID="ltr" runat="server"></asp:Literal>
                    </ItemTemplate>
             </asp:TemplateField>
            <asp:BoundField DataField="filename" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden"/>          
         
        </Columns>
     </asp:GridView>       
    </div>
    </div>
    <div class="col-md-9">
       <div id="showpdf" runat="server" ></div>
    </div>
                 </ContentTemplate>
      <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlclass" />
            <asp:AsyncPostBackTrigger ControlID="ddlsubject" />
          
         </Triggers>
   </asp:UpdatePanel>
</asp:Content>
