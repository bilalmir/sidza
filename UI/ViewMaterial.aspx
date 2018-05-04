<%@ Page Title="SIDZA- View Material" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" 
    MetaKeywords="CBSE subjects,JKBOSE subjects,science,physics,chemistry,biology,mathematics,material,9th,10th,11th,12th,subjects,textual material,study material" 
      CodeBehind="ViewMaterial.aspx.cs" Inherits="VirtualClassroom_final.UI.ViewMaterial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%--    <script type="text/javascript">
        function seturl (title) {
            var name = '';
            name = document.getElementById('<%= hdnfilename.ClientID%>').value; 
            //alert(name);
           // alert(title);
            if (history.pushState) {
                //var newurl = window.location.protocol + "//" + window.location.host + window.location.pathname + name;
                //window.history.replaceState({ path: newurl }, '', '');
                //window.history.replaceState({ path: newurl }, '', newurl);
                
                window.history.pushState(null, null, window.location.pathname+name);
            }
            //var url = name;
            //if (typeof (history.pushState) != "undefined") {
            //    var obj = { Title: title, Url: url };
            //    history.replaceState(obj, obj.Title,obj.Url);
            //    //alert(obj.Title+" "+obj.Url);
            //}
            //else {
            //    alert("Browser does not support HTML5.");
            //}
        }   
    </script>--%>
  <script>
      function resizeIframe(obj) {
          obj.style.height = 0;
          obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';       
    }
 </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:UpdatePanel ID="updPanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>    
   <div  class="row" style="margin-top:50px;">
      <div class="col-md-10 col-md-offset-1">                    
        <h3 style="font-size:Large;color:green;font:bold;">View Material</h3>
                <table class="table table-bordered table-responsive">                    
                    <tr>
                        <td> <div class="pagination-centered">
                            <asp:Label ID="lableclass" runat="server" Text="Class Name" Font-Bold="true" Font-Size="Medium" ForeColor="green"></asp:Label>    
                     <asp:DropDownList ID="ddlclass" runat="server" AutoPostBack="True" CssClass="btn-success pull-right form-control" ForeColor="White"
                      OnSelectedIndexChanged="ddlclass_SelectedIndexChanged" style="border-color:Gray;">
                    </asp:DropDownList>                    
                            </div>
                        </td>
                        <td><div class="pagination-centered">
                             <asp:Label ID="Label2" runat="server" Text="Subject Name" Font-Size="Medium" Font-Bold="true" ForeColor="green"></asp:Label>    
                      <asp:DropDownList ID="ddlsubject" runat="server" AutoPostBack="True"  CssClass="btn-success pull-right form-control" ForeColor="White"
                      OnSelectedIndexChanged="ddlsubject_SelectedIndexChanged" style="border-color:Gray;">
                      </asp:DropDownList>
                            </div>
                        </td>
                        <td><div class="pagination-centered">
                             <asp:Label ID="Label3" runat="server" Text="Chapter Name" Font-Size="Medium" Font-Bold="true" ForeColor="green"></asp:Label>    
                   <asp:DropDownList ID="ddllesson" runat="server" AutoPostBack="True" CssClass="btn-success pull-right form-control" ForeColor="White"
                       OnSelectedIndexChanged="ddllesson_SelectedIndexChanged" style="border-color:Gray;">
                    </asp:DropDownList>
                            </div>
                        </td>
                    </tr>
                </table>
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>       
      </div>
   </div>     
 <div class="row"  style="margin-top:10px;margin-left:10px;margin-bottom:10px;">
     <div class="col-md-3">
                    <asp:HiddenField ID="hdnfilename" runat="server" />
        <asp:GridView ID="grddownloadmaterial" EnableViewState="true"   runat="server" AutoGenerateColumns="False" FooterStyle-BackColor="AntiqueWhite" Font-Size="Small"
          BorderStyle="None" EmptyDataText="There is no material available yet. Please try again later."  OnRowDataBound="grddownloadmaterial_RowDataBound">
            <RowStyle />           
            <PagerStyle BackColor="Red" ForeColor="Black" HorizontalAlign="Center" />
            <HeaderStyle BackColor="AliceBlue" Font-Bold="True" Font-Size="Large" ForeColor="Black" />
            <EmptyDataRowStyle BackColor="#eeeeee" BorderColor="Black"
                    BorderStyle="Solid" BorderWidth="1px" Font-Size="Large" ForeColor="#851010"
                    HorizontalAlign="Center" />
              <Columns>
            <asp:TemplateField HeaderText="Title Name" HeaderStyle-CssClass="text-left text-info"  ControlStyle-CssClass="text-left">
                <ItemTemplate>
                    <%-- <asp:LinkButton ID="lnkbtnFile" Font-Bold="true" runat="server" Text="&nbsp;&nbsp;&nbsp;Preview&nbsp;&nbsp;&nbsp;"  OnClick="lnkbtnFile_Click"></asp:LinkButton>       --%>
                    <asp:Literal ID="ltrcontentlink"  runat="server"></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="filename" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden"/>                   
        </Columns>
     </asp:GridView>       
    </div>
    <div class="col-md-9"  id="showpdf" runat="server"> 
        <asp:Literal ID="ltriframe" runat="server"></asp:Literal>         
    </div>
</div>
      </ContentTemplate>          
      <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlclass" />
            <asp:AsyncPostBackTrigger ControlID="ddlsubject" />
            <asp:AsyncPostBackTrigger ControlID="ddllesson" />
         </Triggers>
                  
   </asp:UpdatePanel>
        
     
</asp:Content>
