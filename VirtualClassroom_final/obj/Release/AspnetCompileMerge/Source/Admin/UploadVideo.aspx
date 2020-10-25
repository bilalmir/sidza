<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" Async="true" EnableViewStateMac="true" AutoEventWireup="true" CodeBehind="UploadVideo.aspx.cs" Inherits="VirtualClassroom_final.Admin.UploadVideo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="row" style="margin-top:150px;margin-bottom:90px;">
      <div class="col-md-8 col-md-offset-2" >
          <table align="center">
              <tr>
                  <td>
                       <asp:Label ID="lblmsg" runat="server" Font-Bold="true" Font-Size="Large" CssClass="label label-inverse"></asp:Label><br />
                  </td>
              </tr>
             
               <tr>
                  <td>
                         <asp:Label ID="lblclassname" runat="server" CssClass="text-info" Text="Class Name:" ></asp:Label>
                  </td>
                  <td>
                        <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlclass_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList>
                  </td>
              </tr>
              <tr>
                  <td>
                       <asp:Label ID="lblSubject" runat="server" CssClass="text-info" Text="Subject Name:" Visible="false"></asp:Label>
                  </td>
                  <td>
                       <asp:DropDownList ID="ddlsubject" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlsubject_SelectedIndexChanged" AutoPostBack="true"  Visible="false" > </asp:DropDownList>            
                  </td>
              </tr>
              <tr>
                  <td>
                      <asp:Label ID="lblchapter" runat="server" CssClass="text-info" Text="Chapter Name:" Visible="false" ></asp:Label>
             
                </td>
                <td>
                      <asp:DropDownList ID="ddllesson" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddllesson_SelectedIndexChanged" Visible="false"  AutoPostBack="true">
                </asp:DropDownList>
            
                </td>
              </tr>              
              <tr>
                  <td>
                    
                      <asp:Label ID="lblbrowseFile" runat="server" Text="Browse file" CssClass="text-info" Visible="false" ></asp:Label>      
                  </td>
                  <td>
                       <asp:FileUpload ID="Upldmtrl"  runat="server" CssClass="form-control" Visible="false" AllowMultiple="true"/>
                     
                  </td>
              </tr>
             <tr>
                  <td>
                    
                      <asp:Label ID="lblVidDescription" runat="server" Text="Video Description"  CssClass="text-info" Visible="false" ></asp:Label>      
                  </td>
                  <td>
                       <asp:TextBox ID="txtVidDescription" runat="server" CssClass="form-control" Visible="false" TextMode="MultiLine" ></asp:TextBox>
                  </td>
              </tr>
              <tr>
                  <td colspan="2" align="center">
                       <asp:Button ID="btnupload" runat="server" Text="Upload" Visible="false" OnClick="btnupload_Click" CssClass="btn btn-primary" Font-Bold="true" />
                  </td>
              </tr>
              <tr>
                  <td colspan="2" align="center">                  
                    
                                   <asp:Label ID="lblprogress" runat="server" Font-Bold="true" ForeColor="White" Font-Size="Large"  CssClass="label label-inverse"></asp:Label>
                                   <asp:Label ID="lbluploadfailed" runat="server" Font-Bold="true" ForeColor="White" Font-Size="Large"  CssClass="label label-inverse"></asp:Label>                                    
                          
                     
                  </td>
              </tr>
          </table> 
          <br />
        <div align="center" class="table table-responsive">
            <asp:GridView ID="grdvVideo" runat="server" CaptionAlign="Top" PageSize="10" AllowPaging="true"
                AutoGenerateColumns="False" Height="100px" BackColor="White"
                BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                CellSpacing="2" GridLines="Vertical" OnPageIndexChanging="grdvVideo_PageIndexChanging" OnRowEditing="grdvVideo_RowEditing"
                 OnRowCancelingEdit="grdvVideo_RowCancelingEdit" OnRowUpdating="grdvVideo_RowUpdating"
                EmptyDataText="There are no uploaded videos"  OnRowDeleting="grdvVideo_RowDeleting">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label ID="lblvideoid"  runat="server" Text='<%# Eval("id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Class Name">
                       <ItemTemplate>
                            <asp:Label ID="lblvidclassname" runat="server" Text='<%# Eval("classname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>               
                <asp:TemplateField HeaderText="Subject Name">
                                 <ItemTemplate>
                            <asp:Label ID="lblvidsubjectname" runat="server" Text='<%# Eval("subjectname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Video Code">
                        <ItemTemplate>
                            <asp:Label ID="lblvidCode" runat="server" Text='<%# Eval("filename") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>    
                    <asp:TemplateField HeaderText="File Name">
                                 <ItemTemplate>
                            <asp:Label ID="lblvidfilename" runat="server" Text='<%# Eval("title") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                             <asp:FileUpload ID="UpldYoutube"  runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>                       
                    <asp:CommandField HeaderText="Remove" ShowDeleteButton="True" ShowEditButton="true"
                        DeleteText="Remove" CausesValidation="false"/>
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
  </div>
</asp:Content>
