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
using Google.Apis.Auth.OAuth2;
using Google.Apis.Services;
using Google.Apis.Upload;
using Google.Apis.Util.Store;
using Google.Apis.YouTube.v3;
using Google.Apis.YouTube.v3.Data;
using Google.YouTube;
using Google.Apis.Auth.OAuth2.Flows;
using Google.Apis.Auth.OAuth2.Web;
using System.Threading;


namespace VirtualClassroom_final.Admin
{
    public partial class UploadVideo : System.Web.UI.Page
    {
        public static string show = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["adminemail"] != null)
            {
                if (show == "upload")
                {
                    lblmsg.Text = "Video uploaded to YouTube Successfully !!";
                    show = string.Empty;
                }
                else if (show == "failure")
                {
                    lblmsg.Text = "Video Upload Unsuccessfull!!";
                    show = string.Empty;
                }
                else if (show == "Delete")
                {
                    lblmsg.Text = "Video Deleted from YouTube Successfully !!";
                    show = string.Empty;
                }
                else if (show == "Update")
                {
                    lblmsg.Text = "Video Updated in YouTube Successfully !!";
                    show = string.Empty;
                }

            }
            else
            {
                Response.Redirect("~/Admin/AdminLogin.aspx", true);
            }
            if (!IsPostBack)
            {
                ddlClass.DataSource = UserBL.FetchClass();                 // fetch classes for dropdown (class)
                ddlClass.DataValueField = "classid";
                ddlClass.DataTextField = "classname";
                ddlClass.DataBind();
                ddlClass.Items.Insert(0, new ListItem("-Select Class-", "0"));

                fillVidgrid();
            }

        }
        protected void fillVidgrid()
        {
            DataSet ds1 = UserBL.FetchVidMaterial();
            grdvVideo.DataSource = ds1;
            grdvVideo.DataBind();

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
        protected void ddlsubject_SelectedIndexChanged(object sender, EventArgs e)
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

        protected void ddllesson_SelectedIndexChanged(object sender, EventArgs e)
        {
            int lessonid = Convert.ToInt32(ddllesson.SelectedValue);
            Session["lessonid"] = lessonid;
            lblbrowseFile.Visible = true;
            Upldmtrl.Visible = true;
            lblVidDescription.Visible = true;
            txtVidDescription.Visible = true;
            btnupload.Visible = true;
        }

        protected void btnupload_Click(object sender, EventArgs e)
        {
            try
            {

                Upldmtrl.Visible = false;
                string fileext = System.IO.Path.GetExtension(Upldmtrl.FileName).ToLower(); // stores extension of the uploaded file.               
                string filename = Upldmtrl.FileName;                // store name of the uploade file in filename.
                filename = filename.Remove(filename.Length - 4);
                Session["title"] = filename;
                Upldmtrl.SaveAs(Server.MapPath("/Upload/Videos/") + Upldmtrl.FileName);
                string filepath = Server.MapPath("/Upload/Videos/") + Upldmtrl.FileName;
                Session["file"] = filepath;
                UploadVideos(Upldmtrl.FileContent, Upldmtrl.PostedFile.ContentType, Upldmtrl.FileName, filepath);
                int lessonid = (int)Session["lessonid"];
                int subjectid = (int)Session["subjectid"];
                int classid = (int)Session["classid"];
                string title = Convert.ToString(Session["title"]);
                int filesize = Upldmtrl.PostedFile.ContentLength;
                if (Session["uploadcompleted"] != null)
                {
                    string videoid = Session["videoid"].ToString();
                    if (UserBL.VideoMaterial(2, classid, subjectid, lessonid, videoid, title))
                    {
                        string FileToDelete = Convert.ToString(Session["file"]);
                        //Delete temporary video after uploading to youtube.
                        System.IO.File.Delete(FileToDelete);
                        Label lbl = new Label();
                        lbl.Text = Convert.ToString(Session["uploadcompleted"]);
                        fillVidgrid();
                        show = "upload";
                        Response.Redirect(Request.RawUrl, false);
                    }
                    else
                    {

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

                lblclassname.Visible = false;
                ddlClass.Visible = false;
                lblSubject.Visible = false;
                ddlsubject.Visible = false;
                lblchapter.Visible = false;
                ddllesson.Visible = false;
                lblbrowseFile.Visible = false;
                Upldmtrl.Visible = false;
                btnupload.Visible = false;
                lblVidDescription.Visible = false;
                txtVidDescription.Visible = false;
            }
        }
        private void UploadVideos(Stream uploadedStream, String contenttype, string filename, string path)
        {
            try
            {


                String clientsecretkeypath = HttpContext.Current.Server.MapPath("~/client_secrets.json");
                //  GoogleAuthorizationCodeFlow flow;
                ////  string credPath = System.Environment.GetFolderPath(System.Environment.SpecialFolder.Personal);
                ////  credPath = Path.Combine(credPath, ".credentials/", System.Reflection.Assembly.GetExecutingAssembly().GetName().Name);
                //  var folder = System.Web.HttpContext.Current.Server.MapPath("/App_Data/MyGoogleStorage");
                //  using (var stream = new FileStream(clientsecretkeypath, FileMode.Open, FileAccess.Read))
                //  {
                //      flow = new GoogleAuthorizationCodeFlow(new GoogleAuthorizationCodeFlow.Initializer
                //      {
                //          DataStore = new FileDataStore(folder),
                //          ClientSecretsStream = stream,
                //          Scopes = new[] { YouTubeService.Scope.Youtube, YouTubeService.Scope.YoutubeUpload }
                //      });
                //  }
                //  var uri = Request.Url.ToString();
                //  var code = Request["code"];
                //  string userId = "sidza";
                //  var youtubeService = new YouTubeService();
                //  if (code != null)
                //  {
                //      var token = flow.ExchangeCodeForTokenAsync(userId, code,
                //          uri.Substring(0, uri.IndexOf("?")), CancellationToken.None).Result;

                //  //    Extract the right state.
                //      var oauthState = AuthWebUtility.ExtracRedirectFromState(
                //          flow.DataStore, userId, Request["state"]).Result;
                //      Response.Redirect(oauthState, false);
                //  }
                //  else
                //  {
                //      var result = new AuthorizationCodeWebApp(flow, uri, uri).AuthorizeAsync(userId,
                //          CancellationToken.None).Result;
                //      if (result.RedirectUri != null)
                //      {
                //    //      Redirect the user to the authorization server.
                //         Response.Redirect(result.RedirectUri, false);
                //      }
                //      else
                //      {
                //      //    The data store contains the user credential, so the user has been already authenticated.
                //         youtubeService = new YouTubeService(new BaseClientService.Initializer()
                //         {
                //             HttpClientInitializer = result.Credential,
                //             ApplicationName = Assembly.GetExecutingAssembly().GetName().Name
                //         });
                //      }
                //  }



                var cred = GetUserCredential(clientsecretkeypath);

                var youtubeService = new YouTubeService(new BaseClientService.Initializer()
                {
                    HttpClientInitializer = cred,
                    ApplicationName = Assembly.GetExecutingAssembly().GetName().Name
                });

                youtubeService.HttpClient.Timeout = TimeSpan.FromMinutes(15.00);
                var video = new Google.Apis.YouTube.v3.Data.Video();
                video.Snippet = new VideoSnippet();
                video.Snippet.Title = Session["title"].ToString();
                video.Snippet.Description = txtVidDescription.Text;
                video.Snippet.Tags = new string[] { "Autos" };
                //video.Snippet.CategoryId = "2";
                video.Status = new VideoStatus();
                video.Status.PrivacyStatus = "public";
                var filePath = path;
                const int KB = 0x400;
                var minimumChunkSize = 256 * KB;
                // tmr.Enabled = true;
                using (var fileStream = new FileStream(filePath, FileMode.Open))
                {
                    var videosInsertRequest = youtubeService.Videos.Insert(video, "snippet,status", fileStream, "video/*");
                    videosInsertRequest.ProgressChanged += videosInsertRequest_ProgressChanged;
                    videosInsertRequest.ResponseReceived += videosInsertRequest_ResponseReceived;
                    videosInsertRequest.ChunkSize = minimumChunkSize * 8;
                    //await  videosInsertRequest.UploadAsync();
                    videosInsertRequest.Upload();

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
            }
        }

        private UserCredential GetUserCredential(string clientSecretJson)
        {
            try
            {
                using (var stream = new FileStream(clientSecretJson, FileMode.Open, FileAccess.Read))
                {
                    var folder = System.Web.HttpContext.Current.Server.MapPath("/App_Data/MyGoogleStorage");
                    var credential = GoogleWebAuthorizationBroker.AuthorizeAsync(GoogleClientSecrets.Load(stream).Secrets,
                    new[] { YouTubeService.Scope.Youtube, YouTubeService.Scope.YoutubeUpload }, "sidza",
                    System.Threading.CancellationToken.None, new FileDataStore(folder, true)).Result;
                    credential.GetAccessTokenForRequestAsync();
                    return credential;
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Get user credentials failed.", ex);
            }
        }

        private bool DeleteYoutubeVideo(string youtubeVideoCode)
        {
            String clientsecretkeypath = HttpContext.Current.Server.MapPath("~/client_secrets.json");
            var cred = GetUserCredential(clientsecretkeypath);
            var youtubeService = new YouTubeService(new BaseClientService.Initializer()
            {
                HttpClientInitializer = cred,
                ApplicationName = Assembly.GetExecutingAssembly().GetName().Name
            });

            try
            {
                var parameters = new Dictionary<string, object>();
                parameters.Add("id", youtubeVideoCode);
                var videosDeleteRequest = youtubeService.Videos.Delete(parameters["id"].ToString());
                videosDeleteRequest.Execute();

            }
            catch (Exception ex)
            {
                CreateLog err = new CreateLog();
                CreateLog.CreateLogFiles();
                err.ErrorLog(Server.MapPath("/Logs/ErrorLog.txt"), ex.Message);

            }
            return true;
        }
        void videosInsertRequest_ProgressChanged(Google.Apis.Upload.IUploadProgress progress)
        {
            switch (progress.Status)
            {
                case UploadStatus.Uploading:
                    lblprogress.Text = "Status : Uploading... " + progress.BytesSent.ToString();
                    Session["progress"] = progress.BytesSent.ToString();
                    break;

                case UploadStatus.Failed:
                    //  Response.Write(String.Format("{0}<br/>", progress.Exception.Message));
                    //Response.Write(String.Format("{0}<br/>", progress.Exception.StackTrace));
                    lbluploadfailed.Text = "Status : " + progress.Exception.Message.ToString();
                    CreateLog err = new CreateLog();
                    CreateLog.CreateLogFiles();
                    err.ErrorLog(Server.MapPath("/Logs/ErrorLog.txt"), progress.Exception.Message.ToString());
                    break;
                case UploadStatus.Completed:
                    Session["uploadcompleted"] = UploadStatus.Completed;
                    break;

            }
        }
        void videosInsertRequest_ResponseReceived(Google.Apis.YouTube.v3.Data.Video video)
        {
            //Response.Write(String.Format("Video id '{0}' was successfully uploaded.", video.Id));

            Session["videoid"] = video.Id;
        }
        protected void grdvVideo_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            grdvVideo.EditIndex = -1;
            fillVidgrid();
        }
        protected void grdvVideo_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = grdvVideo.Rows[e.RowIndex];
            Label id = (Label)row.FindControl("lblvideoid");
            Label vidcode = (Label)row.FindControl("lblvidCode");
            string VideoCode = vidcode.Text;
            int vid = Int32.Parse(id.Text);
            string qry = "delete from tblvideomaterial where id='" + vid + "'";
            if (DeleteYoutubeVideo(VideoCode))
            {
                if (UserBL.deleteDetail(qry))
                {
                    fillVidgrid();
                    show = "Delete";
                    Response.Redirect(Request.RawUrl);
                }
            }
        }
        protected void grdvVideo_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = grdvVideo.Rows[e.RowIndex];
            Label id = (Label)row.FindControl("lblvideoid");
            Label vidcode = (Label)row.FindControl("lblvidCode");
            string VideoCode = vidcode.Text;
            int vid = Int32.Parse(id.Text);
            FileUpload youtubeUpload = (FileUpload)row.FindControl("UpldYoutube");
            string title;
            if (DeleteYoutubeVideo(VideoCode))
            {
                if (youtubeUpload.HasFile)
                {
                    // string qry;
                    youtubeUpload.SaveAs(Server.MapPath("/Upload/Videos/") + youtubeUpload.FileName);
                    string filepath = Server.MapPath("/Upload/Videos/") + youtubeUpload.FileName;
                    Session["file"] = filepath;
                    title = youtubeUpload.FileName;
                    title = title.Remove(title.Length - 4);
                    Session["title"] = title;
                    UploadVideos(youtubeUpload.FileContent, youtubeUpload.PostedFile.ContentType, youtubeUpload.FileName, filepath);
                    if (Session["uploadcompleted"] != null)
                    {
                        string videoid = Session["videoid"].ToString();
                        string newTitle = Session["title"].ToString();
                        // qry = "update tblvideomaterial set filename='" + videoid + "',title='" + newTitle + "' where id='" + vid + "'";
                        //  if (UserBL.UpdateDetails(qry))
                        if (UserBL.UpdateVideoMaterial(videoid, newTitle, vid))
                        {
                            string FileToDelete = Convert.ToString(Session["file"]);
                            System.IO.File.Delete(FileToDelete);
                            grdvVideo.EditIndex = -1;
                            fillVidgrid();
                            show = "Update";
                            Response.Redirect(Request.RawUrl);
                        }
                    }
                }
            }
            else
            {
                show = "failure";
                Response.Redirect(Request.RawUrl);
            }

        }
        protected void grdvVideo_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdvVideo.EditIndex = e.NewEditIndex;
            fillVidgrid();
        }
        protected void grdvVideo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdvVideo.PageIndex = e.NewPageIndex;
            fillVidgrid();
            grdvVideo.DataBind();
        }

    }
}