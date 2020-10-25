using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logic.BL;
using System.Data;
using HtmlAgilityPack;
using System.IO;
using System.Reflection;
using DocumentFormat.OpenXml.Packaging;
using OpenXmlPowerTools;
using System.Xml.Linq;
using System.Drawing.Imaging;

namespace VirtualClassroom_final.Admin
{
    public partial class UploadArticles : System.Web.UI.Page
    {
        public static string show = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
                        lblmsg.Text = "Artcile/News Deleted Successfully !!";
                        show = string.Empty;
                    }
                    else if (show == "Update")
                    {
                        lblmsg.Text = "Artcile/News Updated Successfully !!";
                        show = string.Empty;
                    }
                }
                else
                {
                    Response.Redirect("~/Admin/AdminLogin.aspx", true);
                }
           
                fillgrid();
                ddlTypeUpload.DataSource = UserBL.FetchArticleType();               // fetch type of upload
                ddlTypeUpload.DataValueField = "typeid";
                ddlTypeUpload.DataTextField = "type";
                ddlTypeUpload.DataBind();
                ddlTypeUpload.Items.Insert(0, new ListItem("-Select type-", "0"));

             
            }

        }
        protected void fillgrid()
        {
            DataTable ds = UserBL.FetchArticleNews();
            gvclass.DataSource = ds;
            gvclass.DataBind();

        }

        private void Htmlconversion(string doc, string destination, string Title)
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
                        var html = new XDocument(new XDocumentType("html", null, null, null), htmlElement);
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
                int filesize = Upldmtrl.PostedFile.ContentLength;                
                string filename = Upldmtrl.FileName;
                Upldmtrl.SaveAs(Server.MapPath("/Upload/Articles/") + Upldmtrl.FileName);
                string file = Server.MapPath("/Upload/Articles/") + Upldmtrl.FileName;
                Session["Docfile"] = file;
                string f = Upldmtrl.FileName;              
                var fname = Path.ChangeExtension(f, "html");
                string path = Server.MapPath("/Upload/Articles/") + fname;                           
                Htmlconversion(file, path, fname);
                if (ddlTypeUpload.SelectedItem.ToString()== "ARTICLE")
                {
                    int typeid = Convert.ToInt32(ddlTypeUpload.SelectedValue);                        
                    if (UserBL.ArticleUpload(fname, typeid, filesize, ("/Upload/Articles/") + fname))
                    {
                        string FileToDelete = Session["Docfile"].ToString();
                        File.Delete(FileToDelete);
                        show = "upload";
                        Response.Redirect(Request.RawUrl);
                    }
                    else
                    {
                        show = "failure";
                        Response.Redirect(Request.RawUrl);
                    }
                }
                else if (ddlTypeUpload.SelectedItem.ToString()== "NEWS")
                {
                    int typeid = Convert.ToInt32(ddlTypeUpload.SelectedValue);
                    if (UserBL.ArticleUpload(fname, typeid, filesize, ("/Upload/Articles/") + fname))
                    {
                        string FileToDelete = Session["Docfile"].ToString();
                        File.Delete(FileToDelete);
                        show = "upload";
                        Response.Redirect(Request.RawUrl);
                    }
                    else
                    {
                        show = "failure";
                        Response.Redirect(Request.RawUrl);
                    }
                
                }
            }
            catch (Exception ex )
            {
                throw ex;
            }
        }

        //public void replaceinFile(string filepath)
        //{
        //    try
        //    {
        //        HtmlWeb web = new HtmlWeb();
        //        HtmlAgilityPack.HtmlDocument document = new HtmlAgilityPack.HtmlDocument();
        //        document = web.Load(filepath);
        //        HtmlNode p = document.DocumentNode.SelectSingleNode("//p");
        //        p.RemoveAll();
        //        HtmlNode body = document.DocumentNode.SelectSingleNode("//body");
        //        body.Attributes.Add("style", "overflow-x:hidden");
        //        document.Save(filepath);
        //    }
        //    catch (Exception)
        //    {

        //    }
        //}
        protected void gvclass_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvclass.EditIndex = -1;
            fillgrid();
        }
        protected void gvclass_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = gvclass.Rows[e.RowIndex];
            Label id = (Label)row.FindControl("lblarticleID");
            int articleid = Int32.Parse(id.Text);
            Label title = (Label)row.FindControl("lbltitle");
            string qry = "delete from tblarticle where id='" + articleid + "'";
            if (UserBL.deleteDetail(qry))
            {
                File.Delete(Server.MapPath(title.Text));
                fillgrid();
                show = "Delete";
                Response.Redirect(Request.RawUrl);
            }

        }
        protected void gvclass_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvclass.Rows[e.RowIndex];
            Label id = (Label)row.FindControl("lblarticleID");
            int articleid = Int32.Parse(id.Text);
            TextBox article = (TextBox)row.FindControl("txtarticlename");
            //string qry = "update tblarticle set title='" + article.Text.Trim() + "' where id='" + articleid + "'";
            if (UserBL.UpdateArticle(article.Text.Trim(),articleid))
            {
                gvclass.EditIndex = -1;
                fillgrid();
                show = "Update";
                Response.Redirect(Request.RawUrl);
            }

        }

        protected void gvclass_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvclass.EditIndex = e.NewEditIndex;
            fillgrid();
        }
    }
}