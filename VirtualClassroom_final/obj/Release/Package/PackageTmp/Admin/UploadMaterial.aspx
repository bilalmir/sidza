<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" EnableViewStateMac="true" MaintainScrollPositionOnPostback="true" CodeBehind="UploadMaterial.aspx.cs" Inherits="VirtualClassroom_final.Admin.UploadMaterial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <%-- <asp:ScriptManager ID="scriptmanager" runat="server" ></asp:ScriptManager>  --%>
  <div class="row" style="margin-top:150px;margin-bottom:90px;">
      <div class="col-md-10 col-md-offset-1" >
         
          <table align="center">
              <tr>
                  <td>
                       <asp:Label ID="lblmsg" runat="server" Font-Bold="true" Font-Size="Large" CssClass="label label-primary"></asp:Label><br />
                  </td>
              </tr>
             
              <tr>
                  <td>
                      <asp:Label ID="lblselectype" runat="server" Text="Select type of material : &nbsp;&nbsp;&nbsp;" CssClass="text-info" ></asp:Label>
                  </td>
                  <td class="pull-right">
                       <asp:Literal ID="ltrmat" runat="server" Text="Study Material" ></asp:Literal>
                       <asp:RadioButton ID="rdobtnMaterial" runat="server"   GroupName="Material" AutoPostBack="true"
                            OnCheckedChanged="rdobtnMaterial_CheckedChanged"/>
                      <asp:Literal ID="Literal1" runat="server" Text="Question Papers / Syllabus"></asp:Literal>
                      <asp:RadioButton ID="rdobtnquestionpapers" runat="server"  GroupName="Material"
                           AutoPostBack="true" OnCheckedChanged="rdobtnMaterial_CheckedChanged"/>
                  </td>
              </tr>
               <tr>
                  <td>
                         <asp:Label ID="lblclassname" runat="server" CssClass="text-info" Text="Class Name:" Visible="false"></asp:Label>
                  </td>
                  <td>
                                 <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlclass_SelectedIndexChanged" AutoPostBack="true" Visible="false"></asp:DropDownList>
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
                      <asp:Label ID="lbltitle" runat="server" CssClass="text-info" Text="Title Name:" Visible="false" ></asp:Label>
             
                </td>
                <td>
                      <asp:DropDownList ID="ddltitle" runat="server" CssClass="form-control" Visible="false"  OnSelectedIndexChanged="ddltitle_SelectedIndexChanged" AutoPostBack="true">
                </asp:DropDownList>
            
                </td>
              </tr>
              <tr>
                  <td>
                       <asp:Label ID="lbltype" runat="server" Text="Type Of Material" Visible="false" CssClass="text-info" ></asp:Label>
                    </td>
                  <td>
                       <asp:DropDownList ID="ddlTypeUpload" CssClass="form-control" runat="server" Font-Bold="true" Visible="false"
                      AutoPostBack="True" OnSelectedIndexChanged="ddlTypeUpload_SelectedIndexChanged">
                       </asp:DropDownList>
             
                  </td>
              </tr>
              <tr>
                  <td>
                    
                      <asp:Label ID="lblbrowseFile" runat="server" Text="Browse file" CssClass="text-info" Visible="false" ></asp:Label>      
                  </td>
                  <td>
                       <asp:FileUpload ID="Upldmtrl" runat="server" Visible="false" AllowMultiple="true"/>
                     
                  </td>
              </tr>
             
              <tr>
                  <td colspan="2" align="center">
                       <asp:Button ID="btnupload" runat="server" Text="Upload" Visible="false" OnClick="btnupload_Click"
                    CssClass="btn btn-primary" Font-Bold="true" />
                  </td>
              </tr>             
          </table>                                                
       
           
           <br />             
          <table align="center">
           <tr>
                    <td style="font-size:larger"><u>Manage Uploaded Material</u></td>
                </tr>
                </table>
               <br />                   
          <div align="center" class="table table-responsive">       
            <asp:GridView ID="gvclass" runat="server" CaptionAlign="Top" PageSize="10" AllowPaging="true"
                AutoGenerateColumns="False" Height="100px" BackColor="White"
                BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                CellSpacing="2" GridLines="Vertical"  OnPageIndexChanging="gvclass_PageIndexChanging"
                EmptyDataText="There is no material available" OnRowCancelingEdit="gvclass_RowCancelingEdit" OnRowDeleting="gvclass_RowDeleting" OnRowEditing="gvclass_RowEditing" OnRowUpdating="gvclass_RowUpdating">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label ID="lblmaterialID"  runat="server" Text='<%# Eval("id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Type Name">
                                 <ItemTemplate>
                            <asp:Label ID="lbltype" runat="server" Text='<%# Eval("type") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Class Name">
                                 <ItemTemplate>
                            <asp:Label ID="lblclassname" runat="server" Text='<%# Eval("classname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Subject Name">
                                 <ItemTemplate>
                            <asp:Label ID="lblsubjectname" runat="server" Text='<%# Eval("subjectname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Chapter Name">
                                 <ItemTemplate>
                            <asp:Label ID="lblchaptername" runat="server" Text='<%# Eval("lessonname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="File Name">
                                 <ItemTemplate>
                            <asp:Label ID="lblfilename" runat="server" Text='<%# Eval("filename") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>                                
                               <asp:TextBox ID="txtfilename" runat="server" Visible="false" Text='<%#Bind("filename") %>'></asp:TextBox>
                               <asp:FileUpload ID="UpldmtrlMat"  runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>                       
                    <asp:CommandField HeaderText="Edit/Remove" ShowDeleteButton="True" ShowEditButton="true"
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
          <br />
          <table align="center">
           <tr>
                    <td style="font-size:larger"><u>Manage Question Papers and Syllabus</u></td>
                </tr>
                </table>
               <br />                           
          <div align="center" class="table table-responsive">
            <asp:GridView ID="articlegrdvw" runat="server" CaptionAlign="Top" PageSize="10" AllowPaging="true"
                AutoGenerateColumns="False" Height="100px" BackColor="White"
                BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                CellSpacing="2" GridLines="Vertical"  OnPageIndexChanging="articlegrdvw_PageIndexChanging"
                EmptyDataText="There are no Questions or Syllabus available" OnRowCancelingEdit="articlegrdvw_RowCancelingEdit" OnRowDeleting="articlegrdvw_RowDeleting" OnRowEditing="articlegrdvw_RowEditing" OnRowUpdating="articlegrdvw_RowUpdating">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label ID="lblquestionID"  runat="server" Text='<%# Eval("id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Type Name">
                                 <ItemTemplate>
                            <asp:Label ID="lblqtype" runat="server" Text='<%# Eval("type") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Class Name">
                                 <ItemTemplate>
                            <asp:Label ID="lblclassname" runat="server" Text='<%# Eval("classname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>               
                <asp:TemplateField HeaderText="Subject Name">
                                 <ItemTemplate>
                            <asp:Label ID="lblsubjectname" runat="server" Text='<%# Eval("subjectname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>    
                    <asp:TemplateField HeaderText="File Name">
                                 <ItemTemplate>
                            <asp:Label ID="lblquesfilename" runat="server" Text='<%# Eval("filename") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>                                
                               <asp:TextBox ID="txtqfilename" runat="server" Visible="false" Text='<%#Bind("filename") %>'></asp:TextBox>
                               <asp:FileUpload ID="Upldmtrlquest"  runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>     
                  
                    <asp:CommandField HeaderText="Edit/Remove" ShowDeleteButton="True" ShowEditButton="true"
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
