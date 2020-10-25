<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="SetObjectivePaper.aspx.cs" Inherits="VirtualClassroom_final.UI.SetObjectivePaper" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">   
    <script type="text/x-mathjax-config">
     MathJax.Hub.Config({
         showProcessingMessages: false,
        tex2jax: { inlineMath: [['$','$'],['\\(','\\)']] }
  });
</script>
    <script type="text/javascript" src="../MathJax-2.7.2/MathJax.js?config=TeX-MML-AM_HTMLorMML"></script>
<script>
    var Preview = {
        delay: 150,        // delay after keystroke before updating

        preview: null,     // filled in by Init below
        buffer: null,      // filled in by Init below

        timeout: null,     // store setTimout id
        mjRunning: false,  // true when MathJax is processing
        mjPending: false,  // true when a typeset has been queued
        oldText: null,     // used to check if an update is needed

        //
        //  Get the preview and buffer DIV's
        //
        Init: function () {
            document.getElementById("MathPreview").style.visibility = 'block';
            
            this.preview = document.getElementById("MathPreview");
            this.buffer = document.getElementById("MathBuffer");
        },

        //
        //  Switch the buffer and preview, and display the right one.
        //  (We use visibility:hidden rather than display:none since
        //  the results of running MathJax are more accurate that way.)
        //
        SwapBuffers: function () {
            var buffer = this.preview, preview = this.buffer;
            this.buffer = buffer; this.preview = preview;
            buffer.style.visibility = "hidden"; buffer.style.position = "absolute";
            preview.style.position = ""; preview.style.visibility = "";
        },

        //
        //  This gets called when a key is pressed in the textarea.
        //  We check if there is already a pending update and clear it if so.
        //  Then set up an update to occur after a small delay (so if more keys
        //    are pressed, the update won't occur until after there has been 
        //    a pause in the typing).
        //  The callback function is set up below, after the Preview object is set up.
        //
        Update: function () {
            if (this.timeout) { clearTimeout(this.timeout) }
            this.timeout = setTimeout(this.callback, this.delay);
        },

        //
        //  Creates the preview and runs MathJax on it.
        //  If MathJax is already trying to render the code, return
        //  If the text hasn't changed, return
        //  Otherwise, indicate that MathJax is running, and start the
        //    typesetting.  After it is done, call PreviewDone.
        //  
        CreatePreview: function () {
            Preview.timeout = null;
            if (this.mjPending) return;
            var text = document.getElementById("ContentPlaceHolder1_txtquestion").value;
            if (text === this.oldtext) return;
            if (this.mjRunning) {
                this.mjPending = true;
                MathJax.Hub.Queue(["CreatePreview", this]);
            } else {
                this.buffer.innerHTML = this.oldtext = text;
                this.mjRunning = true;
                MathJax.Hub.Queue(
              ["Typeset", MathJax.Hub, this.buffer],
              ["PreviewDone", this]
                );
            }
        },

        //
        //  Indicate that MathJax is no longer running,
        //  and swap the buffers to show the results.
        //
        PreviewDone: function () {
            this.mjRunning = this.mjPending = false;
            this.SwapBuffers();
        }

    };

    //
    //  Cache a callback to the CreatePreview action
    //
    Preview.callback = MathJax.Callback(["CreatePreview", Preview]);
    Preview.callback.autoReset = true;  // make sure it can run more than once
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
  <div class="row" style="margin-top:150px;margin-bottom:90px;">
      <div class="col-md-10 col-md-offset-1" >
    <div id="info" class="" runat="server" >         
        <asp:Label ID="lblclass1" runat="server" CssClass="label label-info" Text="Class Name"></asp:Label>
        <asp:Label ID="lblclass2" runat="server" CssClass="label label-success" Font-Bold="true" ></asp:Label>
        <asp:DropDownList ID="ddlclass" CssClass="form-control" runat="server"  Font-Bold="true" Font-Size="Medium" 
         AutoPostBack="True" OnSelectedIndexChanged="ddlclass_SelectedIndexChanged"></asp:DropDownList>
        <asp:Label ID="lblsubject1" CssClass="label label-info" runat="server" Text="Subject Name"></asp:Label>
        <asp:Label ID="lblsubject2" CssClass="label label-success" runat="server" Font-Bold="true" ></asp:Label>
        <asp:DropDownList ID="ddlsubject" CssClass="form-control" runat="server"  Font-Bold="true" Font-Size="Medium" 
          AutoPostBack="True" OnSelectedIndexChanged="ddlsubject_SelectedIndexChanged"></asp:DropDownList>    
        <asp:Label ID="lblchapter1" CssClass="label label-info" runat="server" Text="Subject Name"></asp:Label>
        <asp:Label ID="lblchapter2" CssClass="label label-success" runat="server" Font-Bold="true"></asp:Label>
        <asp:DropDownList ID="ddlchapter" runat="server" CssClass="form-control"  Font-Bold="true" Font-Size="Medium" ></asp:DropDownList>         
        <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click"
            Font-Bold="true" Font-Size="Larger" CssClass="btn btn-success" ValidationGroup="btnsubmit"
            Style="width: 200px;" />
        <br />
        <asp:Label ID="lblmsgques" CssClass="label label-success" runat="server"></asp:Label>
    </div>
    <br />
    <div id="btn" runat="server" visible="false" class="table table-responsive" style="margin-top: 10px;">
        <asp:Label ID="lbladd" runat="server" CssClass="label label-info" Text="Click Add to enter Questions:" Visible="false"></asp:Label>
        <br />
        <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btnsave_Click" CssClass="btn btn-primary"
            Font-Bold="true" ForeColor="White" ValidationGroup="btnsave" />
        <asp:Button ID="btnadd" runat="server" Text="Add" OnClick="btnadd_Click" CssClass="btn btn-primary"
            Font-Bold="true" ForeColor="White" />
        <asp:Button ID="btncancel" runat="server" Text="Cancel" OnClick="btncancel_Click" ClientIDMode="Static" 
            CssClass="btn btn-primary" Font-Bold="true" ForeColor="White" />
    
    </div>
      <div id="divQuest" runat="server" class="" style="margin-top: 10px;">
      <%--  <asp:Label ID="lblqsno" runat="server"></asp:Label>--%>
     
      <asp:TextBox ID="txtquestion" runat="server" placeholder="Enter Question here" TextMode="MultiLine" onkeyup="Preview.Update()" Columns="70" Width="400"  Height="30" Visible="false"></asp:TextBox>
      <a href="AsciiMath.html" runat="server" id="lnkhlp" target="_blank" visible="false">Click here for help</a>
      <div id="MathPreview" style="border:1px solid; padding: 3px; width:50%; margin-top:5px;visibility:hidden;"></div>
      <div id="MathBuffer" style="border:1px solid; padding: 3px; width:50%; margin-top:5px;visibility:hidden; position:absolute; top:0; left: 0"></div>
      <script>
        Preview.Init();
    </script>
     
        
     <table class="">
       <tr>
            <td>
                 <asp:Image ID="imgquest" runat="server" Visible="false" Height="200px" Width="210px"/>
                  <asp:FileUpload ID="upldQuest" runat="server" CssClass="form-control" Visible="false" />       
                  <asp:Button ID="btnQuestUpload" runat="server" Visible="false" OnClick="btnQuestUpload_Click" CssClass="btn btn-default" Text="Upload..." />
   
            </td>
        </tr>
        <tr>
            <td>
                    <asp:Label ID="lblmarks" CssClass="label label-info" runat="server" Visible="false"></asp:Label>
        <asp:TextBox ID="txtmarks" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtmarks"
            ErrorMessage="***" ForeColor="Red" Font-Size="Small" ValidationGroup="btnsave"></asp:RequiredFieldValidator>    
            </td>
        </tr>        
        <tr>
                <td>
                    <asp:Label ID="lblanswer1" CssClass="label label-info" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="txtanswer1" CssClass="form-control" runat="server" Visible="false"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtanswer1"
                        ErrorMessage="***" ForeColor="Red" Font-Size="Small" ValidationGroup="btnsave"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblanswer2" CssClass="label label-info" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="txtanswer2" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtanswer2"
                        ErrorMessage="***" ForeColor="Red" Font-Size="Small" ValidationGroup="btnsave"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblanswer3" CssClass="label label-info" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="txtanswer3" runat="server" Visible="false" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtanswer3"
                        ErrorMessage="***" ForeColor="Red" Font-Size="Small" ValidationGroup="btnsave"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblanswer4" CssClass="label label-info" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="txtanswer4" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtanswer4"
                        ErrorMessage="***" ForeColor="Red" Font-Size="Small" ValidationGroup="btnsave"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblanswerkey" CssClass="label label-info" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="txtanswerkey" CssClass="form-control" runat="server" Visible="false"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtanswerkey"
                        ErrorMessage="***" ForeColor="Red" Font-Size="Small" ValidationGroup="btnsave"></asp:RequiredFieldValidator>
                </td>
            </tr>          
        </table><br />
  </div>
  <asp:Label ID="lblmsg" style="margin-top:20px;" runat="server" Font-Bold="true" ForeColor="White" Font-Size="Large" CssClass="label label-inverse"></asp:Label><br />
     <asp:Label ID="Label1" runat="server" CssClass="label label-warning pull-right" Font-Size="Larger" Font-Bold="true" ForeColor="White"></asp:Label>
      <div align="center" class="table table-responsive">
            <h3>Information about Examination Subjects and their Chapters</h3>
            <asp:GridView ID="grdvwPaper" runat="server"  CaptionAlign="Top" PageSize="5" AllowPaging="true"
                AutoGenerateColumns="False" Height="100px" CellPadding="4" GridLines="None"
                EmptyDataText="No information about Examination Chapters" OnRowCancelingEdit="grdvwPaper_RowCancelingEdit"  OnPageIndexChanging="grdvwPaper_PageIndexChanging"
                OnRowDeleting="grdvwPaper_RowDeleting" OnRowEditing="grdvwPaper_RowEditing" OnRowUpdating="grdvwPaper_RowUpdating" ForeColor="#333333">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="Paper ID">
                        <ItemTemplate>
                            <asp:Label ID="lbllpaperid"  runat="server" Text='<%# Eval("paperid") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Cllass Name">
                        <ItemTemplate>
                            <asp:Label ID="lbllclassname"  runat="server" Text='<%# Eval("classname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Subject Name">
                        <ItemTemplate>
                            <asp:Label ID="lbllsubjectname"  runat="server" Text='<%# Eval("subjectname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Chapter Name">
                        <ItemTemplate>
                            <asp:Label ID="lbllchaptername"  runat="server" Text='<%# Eval("chaptername") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>                
                    <asp:CommandField HeaderText="Edit/Remove" ShowDeleteButton="True"
                        ShowEditButton="True" DeleteText="Remove" CausesValidation="false"/>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <EmptyDataRowStyle BackColor="#eeeeee" BorderColor="Black"
                    BorderStyle="Solid" BorderWidth="1px" Font-Size="Large" ForeColor="#851010"
                    HorizontalAlign="Center" />
                <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C"/>
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
      <div align="center" class="table table-responsive">
            <h3>Available Questions for all Classes</h3>
            <asp:GridView ID="gvclass" runat="server"  CaptionAlign="Top" PageSize="5" AllowPaging="true"
                AutoGenerateColumns="False" Height="100px" Width="99%" CellPadding="4" GridLines="None"
                EmptyDataText="There are no Questions" OnRowCancelingEdit="gvclass_RowCancelingEdit" OnRowDeleting="gvclass_RowDeleting" OnPageIndexChanging="gvclass_PageIndexChanging"
                OnRowEditing="gvclass_RowEditing" OnRowUpdating="gvclass_RowUpdating" ForeColor="#333333">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="Paper ID">
                        <ItemTemplate>
                            <asp:Label ID="lblpaperid"  runat="server" Text='<%# Eval("paperid") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Question ID">
                        <ItemTemplate>
                            <asp:Label ID="lblquestionid"  runat="server" Text='<%# Eval("questionid") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Class Name">
                        <ItemTemplate>
                            <asp:Label ID="lblclassname"  runat="server" Text='<%# Eval("classname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Subject Name">
                        <ItemTemplate>
                            <asp:Label ID="lblsubjectname"  runat="server" Text='<%# Eval("subjectname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Chapter Name">
                        <ItemTemplate>
                            <asp:Label ID="lblchaptername"  runat="server" Text='<%# Eval("chaptername") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Image Path">
                        <ItemTemplate>
                            <asp:Label ID="lblimagePath" runat="server" Text='<%# Eval("image") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Questions">
                                 <ItemTemplate>
                            <asp:Label ID="lblquestion" runat="server" Text='<%# Eval("question") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtquestion" runat="server" Height="25px" Text='<%# Bind("question") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Answer">
                        <ItemTemplate>
                            <asp:Label ID="lblans1"  runat="server" Text='<%# Eval("answer1") %>'></asp:Label>
                        </ItemTemplate>
                          <EditItemTemplate>
                            <asp:TextBox ID="txtanswer1" runat="server" Height="25px" Text='<%# Bind("answer1") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>            
                    <asp:TemplateField HeaderText="Answer">
                        <ItemTemplate>
                            <asp:Label ID="lblans2"  runat="server" Text='<%# Eval("answer2") %>'></asp:Label>
                        </ItemTemplate>
                         <EditItemTemplate>
                            <asp:TextBox ID="txtanswer2" runat="server" Height="25px" Text='<%# Bind("answer2") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>    
                      <asp:TemplateField HeaderText="Answer">
                        <ItemTemplate>
                            <asp:Label ID="lblans3"  runat="server" Text='<%# Eval("answer3") %>'></asp:Label>
                        </ItemTemplate>
                           <EditItemTemplate>
                            <asp:TextBox ID="txtanswer3" runat="server" Height="25px" Text='<%# Bind("answer3") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>    
                      <asp:TemplateField HeaderText="Answer">
                        <ItemTemplate>
                            <asp:Label ID="lblans4"  runat="server" Text='<%# Eval("answer4") %>'></asp:Label>
                        </ItemTemplate>
                           <EditItemTemplate>
                            <asp:TextBox ID="txtanswer4" runat="server" Height="25px" Text='<%# Bind("answer4") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>    
                      <asp:TemplateField HeaderText="Answer Key">
                        <ItemTemplate>
                            <asp:Label ID="lblanskey"  runat="server" Text='<%# Eval("answerkey") %>'></asp:Label>
                        </ItemTemplate>
                           <EditItemTemplate>
                            <asp:TextBox ID="txtanswerkey" runat="server" Height="25px" Text='<%# Bind("answerkey") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>    

                    <asp:CommandField HeaderText="Edit/Remove" ShowDeleteButton="True"
                        ShowEditButton="True" DeleteText="Remove" CausesValidation="false"/>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <EmptyDataRowStyle BackColor="#eeeeee" BorderColor="Black"
                    BorderStyle="Solid" BorderWidth="1px" Font-Size="Large" ForeColor="#851010"
                    HorizontalAlign="Center" />
                <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C"/>
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
   </div>
  </div>   
</asp:Content>
