using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logic.BL;
using System.Data;
using System.IO;
using System.Reflection;
using HtmlAgilityPack;
using DocumentFormat.OpenXml.Packaging;
using OpenXmlPowerTools;
using System.Xml.Linq;
using System.Drawing.Imaging;


namespace VirtualClassroom_final.Admin
{
    public partial class UploadMaterial : System.Web.UI.Page
    {
        public static string show = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminemail"] != null)
            {
                if (show == "upload")
                {
                    lblmsg.Text = "Upload Successfull !!";
                    show = string.Empty;
                }
                else if (show == "failure")
                {
                    lblmsg.Text = "Upload Unsuccessfull!!";
                    show = string.Empty;
                }
                else if (show == "Delete")
                {
                    lblmsg.Text = "Material Deleted Successfully !!";
                    show = string.Empty;
                }
                else if (show == "Update")
                {
                    lblmsg.Text = "Material Updated Successfully !!";
                    show = string.Empty;
                }
              
            }
            else
            {
                Response.Redirect("~/Admin/AdminLogin.aspx", true);
            }
            if (!IsPostBack)
            {
               fillgrid();
               fillQgrid();
            }
          
        }
       
        protected void fillgrid()
        {
            DataSet ds = UserBL.FetchDocumentMaterial();
            gvclass.DataSource = ds;
            gvclass.DataBind();
        }
        protected void fillQgrid()
        {
            DataSet ds1 = UserBL.FetchDocumentMaterial1();
            articlegrdvw.DataSource = ds1;
            articlegrdvw.DataBind();

        }       
        protected void ddlclass_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblSubject.Visible = true;
            ddlsubject.Visible = true;

            int classid = Convert.ToInt32(ddlClass.SelectedValue);
            Session["classid"] = classid;
            ddlsubject.DataSource = UserBL.FetchSubject(classid);
            ddlsubject.DataValueField = "subjectid";
            ddlsubject.DataTextField = "subjectname";
            ddlsubject.DataBind();
            ddlsubject.Items.Insert(0, new ListItem("-Select Subject-", "0"));
           


        }
        protected void rdobtnMaterial_CheckedChanged(object sender, EventArgs e)
        {
            lblclassname.Visible = true;
            ddlClass.Visible = true;

            ddlClass.DataSource = UserBL.FetchClass();
            ddlClass.DataValueField = "classid";
            ddlClass.DataTextField = "classname";
            ddlClass.DataBind();
            ddlClass.Items.Insert(0, new ListItem("-Select Class-", "0"));
        }
        protected void ddlsubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdobtnMaterial.Checked==true )
            {
                lblchapter.Visible = true;
                ddllesson.Visible = true;
                int subjectid = Convert.ToInt32(ddlsubject.SelectedValue);
                Session["subjectid"] = subjectid;
                ddllesson.DataSource = UserBL.FetchLesson(subjectid);
                ddllesson.DataValueField = "lessonid";
                ddllesson.DataTextField = "lessonname";
                ddllesson.DataBind();
                ddllesson.Items.Insert(0, new ListItem("-Select Chapter-", "0"));
            }
            else if (rdobtnquestionpapers.Checked == true)
            {
                int subjectid = Convert.ToInt32(ddlsubject.SelectedValue);
                Session["subjectid"] = subjectid;
                ddlTypeUpload.DataSource = UserBL.FetchType();               // fetch type of upload
                ddlTypeUpload.DataValueField = "typeid";
                ddlTypeUpload.DataTextField = "type";
                ddlTypeUpload.DataBind();             
                ddlTypeUpload.Items.Insert(0, new ListItem("-Select type-", "0"));
                lbltype.Visible = true;
                ddlTypeUpload.Visible = true;
            }
           
        }

        protected void ddllesson_SelectedIndexChanged(object sender, EventArgs e)
        {
            lbltitle.Visible = true;
            ddltitle.Visible = true;
            
           
            int lessonid = Convert.ToInt32(ddllesson.SelectedValue);
            Session["lessonid"] = lessonid;
            ddltitle.DataSource = UserBL.FetchTitle(lessonid);
            ddltitle.DataValueField = "titleid";
            ddltitle.DataTextField = "titlename";
            ddltitle.DataBind();
            ddltitle.Items.Insert(0, new ListItem("-Select Chapter-", "0"));

            ddlTypeUpload.DataSource = UserBL.FetchType();               // fetch type of upload
            ddlTypeUpload.DataValueField = "typeid";
            ddlTypeUpload.DataTextField = "type";          
            ddlTypeUpload.DataBind();         
            ddlTypeUpload.Items.Insert(0, new ListItem("-Select type-", "0"));
        }
        protected void ddlTypeUpload_SelectedIndexChanged(object sender, EventArgs e)
        {
                Session["typeid"] = Convert.ToInt32(ddlTypeUpload.SelectedValue);
                lblbrowseFile.Visible = true;
                Upldmtrl.Visible = true;
                btnupload.Visible = true;          
            
        }
     
        private void Htmlconversion(string doc,string destination,string Title)
        {
            try
            {
                FileInfo fileInfo = new FileInfo(doc);
                byte[] byteArray = File.ReadAllBytes(fileInfo.FullName);
                using (MemoryStream memoryStream = new MemoryStream())
                {
                  
                    memoryStream.Write(byteArray, 0, byteArray.Length);
                    using (WordprocessingDocument wDoc = WordprocessingDocument.Open(memoryStream, true))
                    {
                        int imageCounter = 0;
                        //var pageTitle = fileInfo.FullName;
                        var pageTitle = Title;
                        var part = wDoc.CoreFilePropertiesPart;
                        if (part != null)
                            pageTitle = (string)part.GetXDocument().Descendants(DC.title).FirstOrDefault() ?? Title;

                     

                        WmlToHtmlConverterSettings settings = new WmlToHtmlConverterSettings()
                        {
                            AdditionalCss = "body { margin: 1cm auto; max-width: 20cm; padding: 0; }",
                            PageTitle = pageTitle,
                            FabricateCssClasses = true,
                            CssClassPrefix = "pt-",
                            RestrictToSupportedLanguages = false,
                            RestrictToSupportedNumberingFormats = false,
                            ImageHandler = imageInfo =>
                            {
                                ++imageCounter;
                                string extension = imageInfo.ContentType.Split('/')[1].ToLower();
                                ImageFormat imageFormat = null;
                                if (extension == "png") imageFormat = ImageFormat.Png;
                                else if (extension == "gif") imageFormat = ImageFormat.Gif;
                                else if (extension == "bmp") imageFormat = ImageFormat.Bmp;
                                else if (extension == "jpeg") imageFormat = ImageFormat.Jpeg;
                                else if (extension == "tiff")
                                {
                                    extension = "gif";
                                    imageFormat = ImageFormat.Gif;
                                }
                                else if (extension == "x-wmf")
                                {
                                    extension = "wmf";
                                    imageFormat = ImageFormat.Wmf;
                                }

                                if (imageFormat == null) return null;

                                string base64 = null;
                                try
                                {
                                    using (MemoryStream ms = new MemoryStream())
                                    {
                                        imageInfo.Bitmap.Save(ms, imageFormat);
                                        var ba = ms.ToArray();
                                        base64 = System.Convert.ToBase64String(ba);
                                    }
                                }
                                catch (Exception)
                                { }

                                ImageFormat format = imageInfo.Bitmap.RawFormat;
                                ImageCodecInfo codec = ImageCodecInfo.GetImageDecoders()
                                                          .First(c => c.FormatID == format.Guid);
                                string mimeType = codec.MimeType;

                                string imageSource =
                                       string.Format("data:{0};base64,{1}", mimeType, base64);

                                XElement img = new XElement(Xhtml.img,
                                      new XAttribute(NoNamespace.src, imageSource),
                                      imageInfo.ImgStyleAttribute,
                                      imageInfo.AltText != null ?
                                           new XAttribute(NoNamespace.alt, imageInfo.AltText) : null);
                                return img;
                            }
                        };

                        XElement htmlElement = WmlToHtmlConverter.ConvertToHtml(wDoc, settings);
                        var html = new XDocument(new XDocumentType("html", null, null, null),htmlElement);                    
                        html.Save(destination, SaveOptions.DisableFormatting);
                    }
                }
            }
            catch (Exception ex)
            {
                CreateLog err = new CreateLog();
                CreateLog.CreateLogFiles();
                err.ErrorLog(Server.MapPath("/Logs/ErrorLog.txt"), ex.Source);
            
            }
        }
        protected void btnupload_Click(object sender, EventArgs e)
        {
            try
            {
                int classid = (int)Session["classid"];                
                int typeid = Int32.Parse(ddlTypeUpload.SelectedValue); 
                Session["typeid"]=typeid;
                string fileext = System.IO.Path.GetExtension(Upldmtrl.FileName).ToLower(); // stores extension of the uploaded file.               
                string filename = Upldmtrl.FileName;                // store name of the uploade file in filename.
                if (ddlTypeUpload.SelectedItem.ToString()=="QUESTION PAPER")
                {
                    int subjectid = (int)Session["subjectid"];
                    ddlTypeUpload.ClearSelection();
                    Upldmtrl.SaveAs(Server.MapPath("/Upload/QuestionPapers/") + Upldmtrl.FileName);
                    string str = Server.MapPath("/Upload/QuestionPapers/") + Upldmtrl.FileName;
                    int filesize = Upldmtrl.PostedFile.ContentLength;
                    if (UserBL.QuestionPaperUpload(typeid, classid, subjectid, filesize, ("/Upload/QuestionPapers/") + filename))
                    {
                        fillQgrid();
                        show = "upload";
                        Response.Redirect(Request.RawUrl);
                    }
                    else
                    {
                        show = "failure";
                        Response.Redirect(Request.RawUrl);
                    }

                }

                else if (ddlTypeUpload.SelectedItem.ToString() == "SYLLABUS")
                {
                    int subjectid = (int)Session["subjectid"];
                    ddlTypeUpload.ClearSelection();
                    Upldmtrl.SaveAs(Server.MapPath("/Upload/Syllabus/") + Upldmtrl.FileName);
                    string str = Server.MapPath("/Upload/Syllabus/") + Upldmtrl.FileName;
                    int filesize = Upldmtrl.PostedFile.ContentLength;
                    if (UserBL.SyllabusUpload(typeid, classid, subjectid, filesize, ("/Upload/Syllabus/") + filename))
                    {
                        fillQgrid();
                        show = "upload";
                        Response.Redirect(Request.RawUrl);
                    }
                    else
                    {
                        show = "failure";
                        Response.Redirect(Request.RawUrl);
                    }

                }
               
                else if (ddlTypeUpload.SelectedItem.ToString()=="DOCUMENT")
                {
                    int lessonid = (int)Session["lessonid"];
                    int subjectid = (int)Session["subjectid"];
                                      
                    Upldmtrl.SaveAs(Server.MapPath("/Upload/pdf/") + Upldmtrl.FileName);                    
                    string file = Server.MapPath("/Upload/pdf/") + Upldmtrl.FileName;
                    string f = Upldmtrl.FileName;
                   
                    Session["Docfile"] = file;
                    int filesize = Upldmtrl.PostedFile.ContentLength;

                    var fname = Path.ChangeExtension(f, "html");
                    string path = Server.MapPath("/Upload/pdf/") + fname;
                    Htmlconversion(file,path,fname);
                   // replaceinFile(path);                    

                    if (UserBL.Material(typeid, classid, subjectid, lessonid, filesize, ("/Upload/pdf/") + fname))
                    {
                        string FileToDelete = Session["Docfile"].ToString();
                        File.Delete(FileToDelete);                      
                        ddlTypeUpload.ClearSelection();
                        fillgrid();
                        show = "upload";
                        Response.Redirect(Request.RawUrl);
                    }
                    else
                    {
                       // lblmsg.Text = " Upload UnSucessful";
                        ddlTypeUpload.ClearSelection();
                        show = "failure";
                        Response.Redirect(Request.RawUrl);
                    }
                }
            }
            catch (Exception ex)
            {
                CreateLog err = new CreateLog();
                CreateLog.CreateLogFiles();
                err.ErrorLog(Server.MapPath("/Logs/ErrorLog.txt"), ex.Message);
            }
            finally
            {
                ddlTypeUpload.ClearSelection();
                lblclassname.Visible = false;
                ddlClass.Visible = false;
                lblSubject.Visible = false;
                ddlsubject.Visible = false;
                lblchapter.Visible = false;
                ddllesson.Visible = false;
                lbltitle.Visible = false;
                ddltitle.Visible = false;
                lblbrowseFile.Visible = false;
                Upldmtrl.Visible = false;
                btnupload.Visible = false;
                lbltype.Visible = false;
                ddlTypeUpload.Visible = false;
              
            }
        }


        protected void ddltitle_SelectedIndexChanged(object sender, EventArgs e)
        {
            lbltype.Visible = true;
            ddlTypeUpload.Visible = true;
        }
        protected void gvclass_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvclass.EditIndex = -1;
            fillgrid();
        }
        protected void gvclass_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = gvclass.Rows[e.RowIndex];
            Label id = (Label)row.FindControl("lblmaterialID");
            int materialid = Int32.Parse(id.Text);
            Label lblfilename = (Label)row.FindControl("lblfilename");
            string qry = "delete from tblmaterial where id='" + materialid + "'";
            if (UserBL.deleteDetail(qry))
            {
                System.IO.File.Delete(Server.MapPath(lblfilename.Text));
              
               //lblfilename.Text = lblfilename.Text.Substring(0,lblfilename.Text.Length-5);
               //lblfilename.Text += "_files";
               // foreach (string file in Directory.GetFiles(Server.MapPath(lblfilename.Text)))
               // {
               //     File.Delete(file);
               // }
               // Directory.Delete(Server.MapPath(lblfilename.Text));
                fillgrid();
                show = "Delete";
                Response.Redirect(Request.RawUrl);
            }

        }
        protected void gvclass_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvclass.Rows[e.RowIndex];
            Label id = (Label)row.FindControl("lblmaterialID");
            int materialid = Int32.Parse(id.Text);
            FileUpload material = (FileUpload)row.FindControl("UpldmtrlMat");
            if (material.HasFile)
            {
                Label type = (Label)row.FindControl("lbltype");
                TextBox file = (TextBox)row.FindControl("txtfilename");
                string filepath = file.Text.ToString();
                System.IO.File.Delete(Server.MapPath(filepath));
                string qry = string.Empty;
                var fname="";
                string filename1 = string.Empty;
                if (type.Text.ToString() == "DOCUMENT")
                {
                    material.SaveAs(Server.MapPath("/Upload/pdf/") + material.FileName);
                    string newfile = Server.MapPath("/Upload/pdf/") + material.FileName;
                    string f = material.FileName;
                    Session["newDocfile"] = newfile;
                    fname = Path.ChangeExtension(f, "html");
                    string path = Server.MapPath("/Upload/pdf/") + fname;
                    Htmlconversion(newfile, path, fname);
                    //replaceinFile(path);                    
                    //qry = "update tblmaterial set filename='/Upload/pdf/" + fname + "' where id='" + materialid + "'";
                    filename1 = "/Upload/pdf/" + fname;
                }
                if (UserBL.UpdateMaterial(filename1,materialid))
                {
                    string FileToDelete = Session["newDocfile"].ToString();
                    File.Delete(FileToDelete);       
                    gvclass.EditIndex = -1;
                    fillgrid();
                    show = "Update";
                    Response.Redirect(Request.RawUrl);
                }
            }
            else
            {
                Response.Redirect(Request.RawUrl);
            }
         

        }       
        protected void gvclass_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvclass.EditIndex = e.NewEditIndex;
            fillgrid();
        }
       
        protected void articlegrdvw_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            articlegrdvw.EditIndex = -1;
            fillQgrid();
        }
        protected void articlegrdvw_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = articlegrdvw.Rows[e.RowIndex];
            Label id = (Label)row.FindControl("lblquestionID");
            int artid = Int32.Parse(id.Text);
            string qry = "delete from tblquestionSyllabus where id='" + artid + "'";
            Label filename = (Label)row.FindControl("lblquesfilename");
            if (UserBL.deleteDetail(qry))
            {
                System.IO.File.Delete(Server.MapPath(filename.Text));
                fillQgrid();
                show = "Delete";
                Response.Redirect(Request.RawUrl);
            }

        }
        protected void articlegrdvw_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = articlegrdvw.Rows[e.RowIndex];
            Label id = (Label)row.FindControl("lblquestionID");
            int artid = Int32.Parse(id.Text);
            FileUpload materialquest = (FileUpload)row.FindControl("Upldmtrlquest");
            if (materialquest.HasFile)
            {
                Label type = (Label)row.FindControl("lblqtype");
                TextBox file = (TextBox)row.FindControl("txtqfilename");
                string filepath = file.Text.ToString();
                System.IO.File.Delete(Server.MapPath(filepath));
                string qry = string.Empty;

                if (type.Text.ToString() == "QUESTION PAPER")
                {
                    materialquest.SaveAs(Server.MapPath("/Upload/QuestionPapers/") + materialquest.FileName);
                    qry = "update tblquestionSyllabus set filename='/Upload/QuestionPapers/" + materialquest.FileName.Trim() + "' where id='" + artid + "'";

                }
                else if (type.Text.ToString() == "SYLLABUS")
                {
                    materialquest.SaveAs(Server.MapPath("/Upload/Syllabus/") + materialquest.FileName);
                    qry = "update tblquestionSyllabus set filename='/Upload/Syllabus/" + materialquest.FileName.Trim() + "' where id='" + artid + "'";

                }

                if (UserBL.UpdateDetails(qry))
                {
                    articlegrdvw.EditIndex = -1;
                    fillQgrid();
                    show = "Update";
                    Response.Redirect(Request.RawUrl);
                }
            }
            else
            {
                Response.Redirect(Request.RawUrl);
            }
           
        }
        protected void articlegrdvw_RowEditing(object sender, GridViewEditEventArgs e)
        {
            articlegrdvw.EditIndex = e.NewEditIndex;
            fillQgrid();
        }
        protected void gvclass_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvclass.PageIndex = e.NewPageIndex;
            fillgrid();
            gvclass.DataBind();
        }
        protected void articlegrdvw_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            articlegrdvw.PageIndex = e.NewPageIndex;
            fillQgrid();
            articlegrdvw.DataBind();
        }
       

    }
}