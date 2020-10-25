using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using Logic.BL;

namespace VirtualClassroom_final.UI
{
    public partial class SetObjectivePaper : System.Web.UI.Page
    {
        public static string show = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                      ddlclass.DataSource = UserBL.FetchClass();                 // fetch classes for dropdown (class)
                        ddlclass.DataValueField = "classid";
                        ddlclass.DataTextField = "classname";
                        ddlclass.DataBind();
                        ddlclass.Items.Insert(0, new ListItem("---Select---", "0"));

                        fillgrid();
                        fillQInfogrid();
                }
                if (Session["adminemail"] != null)
                {
                    if (show == "upload")
                    {
                        lblmsg.Text = "Upload Successfull !!";
                        show = string.Empty;
                    }
                    else if (show == "failure")
                    {
                        lblmsg.Text = "Upload UnSuccessfull !!";
                        show = string.Empty;
                    }
                    else if (show == "Delete")
                    {
                        lblmsg.Text = "Deletion Successfull !!";
                        show = string.Empty;
                    }
                    else if (show == "Update")
                    {
                        lblmsg.Text = "Updation Successfull !!";
                        show = string.Empty;
                    }
                }
                else
                {
                    Response.Redirect("~/Admin/AdminLogin.aspx");
                }                  
            }
            catch (Exception)
            { }

        }
        protected void fillgrid()
        {
            DataTable ds = UserBL.FetchQuestionInformation();
            gvclass.DataSource = ds;
            gvclass.DataBind();

        }

        protected void fillQInfogrid()
        {
            DataTable ds = UserBL.FetchExamInformation();
            grdvwPaper.DataSource = ds;
            grdvwPaper.DataBind();

        }
        protected void ddlclass_SelectedIndexChanged(object sender, EventArgs e)
        {

            int classid = Convert.ToInt32(ddlclass.SelectedValue);
            ddlsubject.DataSource = UserBL.FetchSubject(classid);
            ddlsubject.DataValueField = "subjectid";
            ddlsubject.DataTextField = "subjectname";
            ddlsubject.DataBind();
            ddlsubject.Items.Insert(0, new ListItem("-Select Subject-", "0"));

        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Event driven to store Objective paper information (class, subject, max-time,Total-marks,pass-marks) for the examination..
        /// </summary>      
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["adminemail"] != null)
                {
                    lbladd.Visible = true;
                    string email = Session["adminemail"].ToString();
                    int classid = Convert.ToInt32(ddlclass.SelectedValue);
                    int subjectid = Convert.ToInt32(ddlsubject.SelectedValue);
                    int chapterid = Convert.ToInt32(ddlchapter.SelectedValue);

                    string classname = ddlclass.SelectedItem.ToString();
                    string subjectname = ddlsubject.SelectedItem.ToString();
                    string chaptername = ddlchapter.SelectedItem.ToString();
                    if (UserBL.CheckAdmin(email))
                    {
                        if (UserBL.CheckQuestionInfoEntry(classname, subjectname, chaptername))
                        {
                            lblmsgques.Text = "Paper information has been already set for this chapter";
                            lblclass1.Visible = false;
                            ddlclass.Visible = false;
                            lblsubject1.Visible = false;
                            ddlsubject.Visible = false;
                            lblchapter1.Visible = false;
                            ddlchapter.Visible = false;                            
                            btnsubmit.Visible = false;
                            btn.Visible = true;    // its div
                        }
                        else
                        {
                            if (UserBL.InsertObjectivePaperInfo(ddlclass.SelectedItem.Text, ddlsubject.SelectedItem.Text, ddlchapter.SelectedItem.Text))
                            {
                                lblclass1.Text = "CLASS :";
                                lblclass2.Text = ddlclass.SelectedItem.Text;
                                lblsubject1.Text = "SUBJECT : ";
                                lblsubject2.Text = ddlsubject.SelectedItem.Text;
                                lblchapter1.Text = "Chapter";
                                lblchapter2.Text = ddlchapter.SelectedItem.Text;                         

                                ddlclass.Visible = false;
                                ddlsubject.Visible = false;
                                ddlchapter.Visible = false;
                              
                                btnsubmit.Visible = false;
                                fillgrid();
                                btn.Visible = true;    // its div
                            }
                            else
                            {
                                lblmsgques.Text = "Paper information not set";
                            }
                        }
                    }
                    //else
                    //{
                    //    lblchk.Text = " InValid Class";
                    //}
                }
                else
                {
                    //ClientScript.RegisterClientScriptBlock(this.GetType(), "Information", "<script> alert('Please login to set paper');</script>", true);
                    Response.Redirect("~/Admin/AdminLogin.aspx",false);
                }
            
            }
            catch (Exception)
            { }
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Make labels and Textboxes visible to write questions...
        /// </summary>
        protected void btnadd_Click(object sender, EventArgs e)
        {
            try
            {
            //    lblqsno.Visible = false;
             
                imgquest.Visible = true;
                upldQuest.Visible = true;
                btnQuestUpload.Visible = true;               
                txtquestion.Visible = true;
               
                lnkhlp.Visible = true;
                //FreeTextBox1.Visible = true;
                //CKEditor1.Visible = true;

                lblmarks.Visible = true;
                lblmarks.Text = "Enter Marks";
                txtmarks.Visible = true;

                lblanswer1.Visible = true;
                lblanswer1.Text = "Enter Answer1";
                txtanswer1.Visible = true;

                lblanswer2.Visible = true;
                lblanswer2.Text = "Enter Answer2";
                txtanswer2.Visible = true;

                lblanswer3.Visible = true;
                lblanswer3.Text = "Enter Answer3";
                txtanswer3.Visible = true;

                lblanswer4.Visible = true;
                lblanswer4.Text = "Enter Answer4";
                txtanswer4.Visible = true;

                lblanswerkey.Visible = true;
                lblanswerkey.Text = "Enter Ans-Key";
                txtanswerkey.Visible = true;
            }
            catch (Exception)
            { }
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Event driven to Clear text entered in the textbox...
        /// </summary>  
        protected void btncancel_Click(object sender, EventArgs e)
        {
            //txtquesno.Text = "";
            txtmarks.Text = "";
            txtquestion.Text = "";   
            // we can delete question entered from the database 
            //FreeTextBox1.Text = "";
            //CKEditor1.Text = "";
            txtanswer1.Text = "";
            txtanswer2.Text = "";
            txtanswer3.Text = "";
            txtanswer4.Text = "";
            txtanswerkey.Text = "";
            upldQuest.Dispose();
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Event driven to store questions set for the examination .. 
        /// </summary>
        protected void btnsave_Click(object sender, EventArgs e)
        {
            try
            {
                string text = Server.HtmlEncode(txtquestion.Text);
                DataTable dtpaperId = new DataTable();
                dtpaperId = UserBL.FetchObjectivePaperId(ddlclass.SelectedItem.Text, ddlsubject.SelectedItem.Text,ddlchapter.SelectedItem.Text);
                int count = Convert.ToInt32(dtpaperId.Rows.Count);
                int paperid = Convert.ToInt32(dtpaperId.Rows[count - 1][0]);
                DataTable dtques = new DataTable();
                dtques = UserBL.FetchQuestionId(paperid);      //  event driven to get qustion-id to check marks utilized for the questions-set...
                int questionid;
                int.TryParse(dtques.Rows[0][0].ToString(), out  questionid);
              
                    if (Session["image"]!=null)
                    {
                        string filename = Session["filename"].ToString();
                       
                        if (UserBL.SetObjectiveQuestion("Q",text, txtanswer1.Text, txtanswer2.Text, txtanswer3.Text, txtanswer4.Text, txtanswerkey.Text, paperid, int.Parse(txtmarks.Text), "/Upload/QuestionPapers/" + filename))
                        {                       
                            txtquestion.Text = "";
                            //FreeTextBox1.Text = "";
                            //CKEditor1.Text = "";
                            txtmarks.Text = "";
                            txtanswer1.Text = "";
                            txtanswer2.Text = "";
                            txtanswer3.Text = "";
                            txtanswer4.Text = "";
                            txtanswerkey.Text = "";                          
                            lblmarks.Visible = false;
                            txtmarks.Visible = false;
                            txtquestion.Visible = false;
                          
                            lnkhlp.Visible = false;
                            //FreeTextBox1.Visible = false;
                            //CKEditor1.Visible = false;
                            lblanswer1.Visible = false;
                            txtanswer1.Visible = false;
                            lblanswer2.Visible = false;
                            txtanswer2.Visible = false;
                            lblanswer3.Visible = false;
                            txtanswer3.Visible = false;
                            lblanswer4.Visible = false;
                            txtanswer4.Visible = false;
                            lblanswerkey.Visible = false;
                            txtanswerkey.Visible = false;
                            imgquest.Visible = false;
                            imgquest.ImageUrl = "";
                            upldQuest.Visible = false;
                            btnQuestUpload.Visible = false;
                            lblmsgques.Text = "Question saved successfully";
                            
                        }
                    }
                    else
                    {
                        if (UserBL.SetObjectiveQuestion("Q",text, txtanswer1.Text, txtanswer2.Text, txtanswer3.Text, txtanswer4.Text, txtanswerkey.Text, paperid, int.Parse(txtmarks.Text), null))
                        {
                            txtquestion.Text = "";
                            //FreeTextBox1.Text = "";
                            //CKEditor1.Text = "";
                            txtmarks.Text = "";
                            txtanswer1.Text = "";
                            txtanswer2.Text = "";
                            txtanswer3.Text = "";
                            txtanswer4.Text = "";
                            txtanswerkey.Text = "";                           
                            lblmarks.Visible = false;
                            txtmarks.Visible = false;
                            txtquestion.Visible = false;
                           
                            lnkhlp.Visible = false;
                            //FreeTextBox1.Visible = false;
                            //CKEditor1.Visible = false;
                            lblanswer1.Visible = false;
                            txtanswer1.Visible = false;
                            lblanswer2.Visible = false;
                            txtanswer2.Visible = false;
                            lblanswer3.Visible = false;
                            txtanswer3.Visible = false;
                            lblanswer4.Visible = false;
                            txtanswer4.Visible = false;
                            lblanswerkey.Visible = false;
                            txtanswerkey.Visible = false;
                            imgquest.Visible = false;
                            imgquest.ImageUrl = "";
                            upldQuest.Visible = false;
                            btnQuestUpload.Visible = false;
                            lblmsgques.Text = "Question saved successfully";
                        }
                    }
            
                fillgrid();
            }
            catch (Exception ex)
            {
                CreateLog.CreateLogFiles();
                CreateLog err = new CreateLog();
                err.ErrorLog(HttpContext.Current.Server.MapPath("/Logs/ErrorLog.txt"), ex.Message);
               
            }
        }
        protected void btnQuestUpload_Click(object sender, EventArgs e)
        {
            if (upldQuest.HasFile)
            {
                upldQuest.SaveAs(Server.MapPath("/Upload/QuestionPapers/") + upldQuest.FileName);
                imgquest.ImageUrl = "/Upload/QuestionPapers/" + upldQuest.FileName;
                Session["image"] = "1";
                Session["filename"] = upldQuest.FileName;
            }
        }
        protected void ddlsubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            int subjectid = Convert.ToInt32(ddlsubject.SelectedValue);
            Session["subjectid"] = subjectid;
            ddlchapter.DataSource = UserBL.FetchLesson(subjectid);
            ddlchapter.DataValueField = "lessonid";
            ddlchapter.DataTextField = "lessonname";
            ddlchapter.DataBind();
            ddlchapter.Items.Insert(0, new ListItem("-Select Chapter-", "0"));
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
            Label paperid = (Label)row.FindControl("lblpaperid");
            int pid = Int32.Parse(paperid.Text);
            Label Imagepath = (Label)row.FindControl("lblimagePath");
            Label qid = (Label)row.FindControl("lblquestionid");
            int questionid = Int32.Parse(qid.Text);
            string qry = "delete from objectivequestioninformation where paperid='" + pid + "' and questionid='" + questionid + "'";
            if (UserBL.deleteDetail(qry))
            {   if(Imagepath.Text!="")
                {
                    string imagepath = Server.MapPath(Imagepath.Text);
                    System.IO.File.Delete(imagepath);
                }
                fillgrid();
                show = "Delete";
                Response.Redirect(Request.RawUrl);
            }

        }
        protected void gvclass_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvclass.Rows[e.RowIndex];
            Label paperid = (Label)row.FindControl("lblpaperid");
            int pid = Int32.Parse(paperid.Text);

            Label qid = (Label)row.FindControl("lblquestionid");
            int questionid = Int32.Parse(qid.Text);

            TextBox question = (TextBox)row.FindControl("txtquestion");
            TextBox ans1 = (TextBox)row.FindControl("txtanswer1");
            TextBox ans2 = (TextBox)row.FindControl("txtanswer2");
            TextBox ans3 = (TextBox)row.FindControl("txtanswer3");
            TextBox ans4 = (TextBox)row.FindControl("txtanswer4");
            TextBox anskey = (TextBox)row.FindControl("txtanswerkey");
            //string qry = "update objectivequestioninformation set question='" + question.Text + "',answer1='" + ans1.Text + "',answer2='" + ans2.Text + "',answer3='" + ans3.Text + "',answer4='" + ans4.Text + "',answerkey='" + anskey.Text + "' where questionid='" + questionid + "' and paperid='" + pid + "'";
            //if (UserBL.UpdateDetails(qry))
            //{
            //    gvclass.EditIndex = -1;
            //    fillgrid();
            //    show = "Update";
            //    Response.Redirect(Request.RawUrl);
            //}
            if(UserBL.UpdateObjectiveQuestion(question.Text,ans1.Text,ans2.Text, ans3.Text , ans4.Text,anskey.Text, questionid , pid))
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
        protected void grdvwPaper_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            grdvwPaper.EditIndex = -1;
            fillQInfogrid();
        }
        protected void grdvwPaper_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = grdvwPaper.Rows[e.RowIndex];
            Label paperid = (Label)row.FindControl("lbllpaperid");
            int pid = Int32.Parse(paperid.Text);
            string qry = "delete from objectivepaperinformation where paperid='" + pid + "'";
            if (UserBL.deleteDetail(qry))
            {
                string qry1 = "delete from objectivequestioninformation where paperid='" + pid + "'";
                if (UserBL.UpdateDetails(qry1))
                {
                    fillQInfogrid();
                }
                show = "Delete";
                Response.Redirect(Request.RawUrl);
            }

        }
        protected void grdvwPaper_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = grdvwPaper.Rows[e.RowIndex];
            Label paperid = (Label)row.FindControl("lbllpaperid");
            int pid = Int32.Parse(paperid.Text);

            TextBox papermarks = (TextBox)row.FindControl("txtpapermarks");
            TextBox passmarks = (TextBox)row.FindControl("txtpassmarks");

            //string qry = "update objectivepaperinformation set papermarks='" + papermarks.Text  + "',passmarks='" + passmarks.Text  + "' where paperid='" + pid + "'";
            //if (UserBL.UpdateDetails(qry))
            //{               
            //        gvclass.EditIndex = -1;
            //        fillQInfogrid();
            //        show = "Update";
            //    Response.Redirect(Request.RawUrl);
            //}
            if(UserBL.UpdateObjectivepaper(papermarks.Text,passmarks.Text,pid ))
            {
                gvclass.EditIndex = -1;
                fillQInfogrid();
                show = "Update";
                Response.Redirect(Request.RawUrl);
            }
        }
        protected void grdvwPaper_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdvwPaper.EditIndex = e.NewEditIndex;
            fillQInfogrid();
        }

        protected void gvclass_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvclass.PageIndex = e.NewPageIndex;
            fillgrid();
            gvclass.DataBind();
        }

        protected void grdvwPaper_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdvwPaper.PageIndex = e.NewPageIndex;
            fillQInfogrid();
            grdvwPaper.DataBind();
        }
    }
}