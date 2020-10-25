using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Logic.BL;

namespace VirtualClassroom_final.UI
{
    public partial class takeexam : System.Web.UI.Page
    {
       protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
            //    if (base.Page_Load(sender, e) == null)
            //    {
            //        Response.Redirect("~/UI/LogRegister.aspx");
            //    }
                if (Session["email"] != null)
                {

                    ddlclass.DataSource = UserBL.FetchClass();                 // fetch classes for dropdown (class)
                    ddlclass.DataValueField = "classid";
                    ddlclass.DataTextField = "classname";
                    ddlclass.DataBind();
                    ddlclass.Items.Insert(0, new ListItem("-Select Class-", "0"));
                }
                else
                {                    
                    //ClientScript.RegisterStartupScript(GetType(), "Warning", "javascript:call();", true);
                    Session["pageredirect"] = "Please Login/Register to take a test";                    
                    Response.Redirect("~/UI/LogRegister.aspx");
                }
                
              
            }
        }

        protected void ddlsubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                string email = Session["email"].ToString();
                int classid = (int)Session["classid"];
                int subjectid = Convert.ToInt32(ddlsubject.SelectedValue);
                ddlchapter.DataSource = UserBL.FetchLesson(subjectid);
                ddlchapter.DataValueField = "lessonid";
                ddlchapter.DataTextField = "lessonname";
                ddlchapter.DataBind();
                ddlchapter.Items.Insert(0, new ListItem("---Select Chapter---", "0"));

              
            }
            catch (Exception)
            { }

        }


     
        /// <summary>
        /// Author : Mir Bilal       
        /// Remark : 1. In loadViewState(method of Dot Net) . This method load each new state in order to retrieve details which has been refreshed after each click(because controls are dynamic)....
        /// 2. We re-create the controls to retrieve details in the dynamic controls(text written in textboxes)... 
        /// </summary>
       
        protected void btntest_Click(object sender, EventArgs e)
        {
            try
            {
                int classid = (int)Session["classid"];
                DataTable dtclassname = new DataTable();
                dtclassname = UserBL.FetchClassname(classid);
                string classname = dtclassname.Rows[0][0].ToString();
                btntest.Visible = false;                
                ddlsubject.Visible = false;
                ddlclass.Visible = false;
                lblclassheading.Visible = false;
                lblsubjectheading.Visible = false;
                Label2.Visible = false;
                tblselect.Visible = false;
                string email = Session["email"].ToString();
                DataTable dtuserId = new DataTable();
                dtuserId = UserBL.UsrId(email);
                int userid = Convert.ToInt32(dtuserId.Rows[0][0].ToString());            

                DataTable dtpaperId = new DataTable();
                dtpaperId = UserBL.FetchObjectivePaperId(classname, ddlsubject.SelectedItem.Text,ddlchapter.SelectedItem.Text);  

                Session["class"] = classname;
                Session["subject"] = ddlsubject.SelectedItem.Text;
                Session["chapter"] = ddlchapter.SelectedItem.Text;
                int count = Convert.ToInt32(dtpaperId.Rows.Count);
               
                if (count > 0)
                {                  
                    int paperid = Convert.ToInt32(dtpaperId.Rows[count - 1][0]);
                   
                        DataTable dtpaperinfo = new DataTable();
                        dtpaperinfo = UserBL.FetchObjectivePaperInfo(paperid);                      
                        dv.Visible = true;                  
                       // Here we use dynamic control concept...while using dynamic controls after each click page is refreshing  
                        try                   // and all previous details is lost... In order to retain that previous details we have save our state. 
                        {                     // For that we use Dot Nets Save-State and Load-State..
                            lblcls.Text = "CLASS :";
                            txtclass.Text = dtpaperinfo.Rows[0][0].ToString();
                            lblsub.Text = "SUBJECT :";
                            txtsubject.Text = dtpaperinfo.Rows[0][1].ToString();
                            lblchapter.Text = "Chapter :";
                            txtchapter.Text = dtpaperinfo.Rows[0][2].ToString();                          
                            DataTable dtquest = new DataTable();
                            DataTable dtquespaper= new DataTable();
                            int count1=0;
                            if ((string)Session["repeatTest"] == (string)Session["chapter"])
                                {
                                    dtquest = (DataTable)Session["dtquestpaper"];
                                    DataTable MyRandomTable = dtquest;
                                  if (dtquest.Rows.Count > 0)
                                   { 
                                    if (dtquest.Columns.Contains("RandNum"))
                                     {
                                        Random rndNum = new System.Random();
                                        for (int i = 0; i < MyRandomTable.Rows.Count; i++)
                                        {
                                            MyRandomTable.Rows[i]["RandNum"] = rndNum.Next(10000);
                                        }

                                        DataView myDataView = MyRandomTable.DefaultView;
                                        myDataView.Sort = "RandNum";
                                        dtquespaper = myDataView.ToTable();
                                            Session["dtquestpaper"] = dtquespaper;
                                            count1 = dtquespaper.Rows.Count;
                                            pnlExam.Visible = true;
                                            Session["count"] = count1;
                                            Session["paper"] = dtquespaper;
                                            Session["paperid"] = paperid;
                                            Session["userid"] = userid;
                                            lblQuestionNo.Text = dtquespaper.Rows[0][1] + ":->" + " ".ToString();
                                            lblQuestionDetail.Text =Server.HtmlDecode(dtquespaper.Rows[0][2].ToString());                                            
                                           // lblmarks.Text = dtquespaper.Rows[0][3].ToString();
                                            rdAnswer1.Text = dtquespaper.Rows[0][4].ToString();
                                            rdAnswer2.Text = dtquespaper.Rows[0][5].ToString();
                                            rdAnswer3.Text = dtquespaper.Rows[0][6].ToString();
                                            rdAnswer4.Text = dtquespaper.Rows[0][7].ToString();
                                            string qst = dtquespaper.Rows[0][9].ToString();
                                            if (qst != "")
                                            {
                                                imgDisplayImage.Visible = true;
                                                imgDisplayImage.ImageUrl = dtquespaper.Rows[0][9].ToString();
                                            }
                                            else
                                            {
                                                imgDisplayImage.Visible = false;
                                                imgDisplayImage.ImageUrl = "";
                                            }
                                            int controlCount = pnlExam.Controls.Count;
                                            Session["flag"] = 1;
                                       }
                                    else
                                    {
                                        MyRandomTable.Columns.Add(new DataColumn("RandNum"));
                                        Random rndNum = new System.Random();
                                        for (int i = 0; i < MyRandomTable.Rows.Count; i++)
                                        {
                                            MyRandomTable.Rows[i]["RandNum"] = rndNum.Next(10000);
                                        }
                                        DataView myDataView = MyRandomTable.DefaultView;
                                        myDataView.Sort = "RandNum";
                                        dtquespaper = myDataView.ToTable();                                  
                                       
                                            Session["dtquestpaper"] = dtquespaper;
                                            count1 = dtquespaper.Rows.Count;
                                            pnlExam.Visible = true;
                                            Session["count"] = count1;
                                            Session["paper"] = dtquespaper;
                                            Session["paperid"] = paperid;
                                            Session["userid"] = userid;
                                            lblQuestionNo.Text = dtquespaper.Rows[0][1] + ":->" + " ".ToString();
                                            lblQuestionDetail.Text =Server.HtmlDecode(dtquespaper.Rows[0][2].ToString());
                                           // lblmarks.Text = dtquespaper.Rows[0][3].ToString();
                                            rdAnswer1.Text = dtquespaper.Rows[0][4].ToString();
                                            rdAnswer2.Text = dtquespaper.Rows[0][5].ToString();
                                            rdAnswer3.Text = dtquespaper.Rows[0][6].ToString();
                                            rdAnswer4.Text = dtquespaper.Rows[0][7].ToString();
                                            string qst = dtquespaper.Rows[0][9].ToString();
                                            if (qst != "")
                                            {
                                                imgDisplayImage.Visible = true;
                                                imgDisplayImage.ImageUrl = dtquespaper.Rows[0][9].ToString();
                                            }
                                            else
                                            {
                                                imgDisplayImage.Visible = false;
                                                imgDisplayImage.ImageUrl = "";
                                            }
                                            int controlCount = pnlExam.Controls.Count;
                                            Session["flag"] = 1;
                                        }
                                     }
                                        else
                                        {
                                            lblmsg.Text = "Question Paper not Available";
                                            btnBack.Visible = true;
                                        }                                    
                                }
                                else
                                {
                                    dtquespaper = UserBL.FetchObjectiveQuestion(paperid);
                                    if (dtquespaper.Rows.Count > 0)
                                    {
                                        pnlExam.Visible = true;
                                        Session["dtquestpaper"] = dtquespaper;
                                        count1 = dtquespaper.Rows.Count;
                                        Session["count"] = count1;
                                        Session["paper"] = dtquespaper;
                                        Session["paperid"] = paperid;
                                        Session["userid"] = userid;
                                        lblQuestionNo.Text = dtquespaper.Rows[0][1] + "." + " ".ToString();
                                        lblQuestionDetail.Text =Server.HtmlDecode(dtquespaper.Rows[0][2].ToString());                                        
                                       // lblmarks.Text = dtquespaper.Rows[0][3].ToString();                                        
                                        rdAnswer1.Text = dtquespaper.Rows[0][4].ToString();                                               
                                        rdAnswer2.Text = dtquespaper.Rows[0][5].ToString();
                                        rdAnswer3.Text = dtquespaper.Rows[0][6].ToString();                                       
                                        rdAnswer4.Text = dtquespaper.Rows[0][7].ToString();
                                        string qst = dtquespaper.Rows[0][9].ToString();
                                        if (qst != "")
                                        {
                                            imgDisplayImage.Visible = true;
                                            imgDisplayImage.ImageUrl = dtquespaper.Rows[0][9].ToString();
                                        }
                                        else
                                        {
                                            imgDisplayImage.Visible = false;
                                            imgDisplayImage.ImageUrl = "";
                                        
                                        }
                                        int controlCount = pnlExam.Controls.Count;
                                        Session["flag"] = 1;
                                    }
                                    else
                                    {
                                        lblmsg.Text = "Question Paper not Available";
                                        btnBack.Visible = true;
                                    }
                                }                            
                        }
                        catch (Exception){}                   
                }
                else
                {
                    lblmsg.Text = "Question Paper not Available";
                    btnBack.Visible = true;
                }
            }
            catch (Exception){ }
        }

        protected void ddlclass_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                Session["classid"] = Convert.ToInt32(ddlclass.SelectedValue);
                int classid = Convert.ToInt32(ddlclass.SelectedValue);
                ddlsubject.DataSource = UserBL.FetchSubject(classid);
                ddlsubject.DataValueField = "subjectid";
                ddlsubject.DataTextField = "subjectname";
                ddlsubject.DataBind();
                ddlsubject.Items.Insert(0, new ListItem("---Select Subject---", "0"));
            }
            catch (Exception)
            { }

        }

        /// <summary>
        /// Author : Mir Bilal

        /// Remark : 1. Event driven to send answers for particular questions for examinations...
        /// 2. Event driven to store student's name in attendance table in order to indicate his/her presence in examination.... 
        /// </summary>      

      
        private static  int i = 0;
        private int paperid;
        private int userid;         
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string email = Session["email"].ToString();
                int classid = (int)Session["classid"];

                DataTable dtclassname = new DataTable();
                dtclassname = UserBL.FetchClassname(classid);
                string classname = dtclassname.Rows[0][0].ToString();              

                DataTable dtpaperId = new DataTable();
                dtpaperId = UserBL.FetchObjectivePaperId(classname, ddlsubject.SelectedItem.Text,ddlchapter.SelectedItem.Text);  // fetch paper-id for particular subject to which student wants to send his answers..
                int count = Convert.ToInt32(dtpaperId.Rows.Count);
                paperid = Convert.ToInt32(dtpaperId.Rows[count - 1][0]);
               
                DataTable dtquespaper = new DataTable();
                dtquespaper = UserBL.FetchObjectiveQuestion(paperid);
                int count1 = dtquespaper.Rows.Count;              

                DataTable dtuserId = new DataTable();
                dtuserId = UserBL.UsrId(email);
                userid = Convert.ToInt32(dtuserId.Rows[0][0].ToString());

                string name = dtuserId.Rows[0][1].ToString();                 // Attendance sheet for student.
                UserBL.InsertObjectivePaperAttendance(paperid, name, userid);              
                
                //--------------------------------------------------------Generate-Result---------------------------------------------------------------------------------------                    
                    DataTable dtobjectivemarks = new DataTable();
                    dtobjectivemarks = UserBL.FetchObjectiveMarks(userid, paperid);
                    int count2 = Convert.ToInt32(dtobjectivemarks.Rows.Count);
                    int total = 0;
                    for (int j = 0; j < count2; j++)
                    {
                        total = total + Convert.ToInt32(dtobjectivemarks.Rows[j][0].ToString());
                    }
                    decimal total1;
                    decimal.TryParse(total.ToString(), out total1);
                    DataTable dtobjanswers = new DataTable();
                    dtobjanswers = UserBL.getCount(paperid, userid);
                    DataTable dtpaperinfo = new DataTable();
                    dtpaperinfo = UserBL.FetchObjectivePaperInfo(paperid);
                    //int papermarks = Convert.ToInt32(dtpaperinfo.Rows[0][3].ToString());
                    int papermarks = Convert.ToInt32(dtobjanswers.Rows[0][0]);
                    decimal papermarks1;
                    decimal.TryParse(papermarks.ToString(), out papermarks1);
                
                    Decimal percent = (total1 / papermarks1);
                    Decimal percent1 = (percent * 100);
                
                    string clas = Session["class"].ToString();
                    string subject = Session["subject"].ToString();
                    string chapter = Session["chapter"].ToString();
                    UserBL.GenerateObjectiveResult(userid, clas, subject, chapter, total, percent1, paperid);

                    pnlExam.Visible = false;
                    lblmsg.Text = "Answer Paper Send";
                    i = 0;
                    dv.Visible = false;
                    btnsubmit.Visible = false;
                    Session["subject"] = subject;
                    Session["classid"] = classid;
                    Session["chapter"] = chapter;
                    Session["userid"] = userid;
                    Session["paperid"] = paperid;
                    Response.Redirect("~/UI/Result.aspx", true);
            }
            catch (Exception)
            { }
        }
        protected void btnnextquestion_Click(object sender, EventArgs e)
        {
            try
            {
                int count1 = Convert.ToInt32(Session["count"]);
                DataTable dtquespaper = (DataTable)Session["paper"];
                int paperid = Convert.ToInt32(Session["paperid"]);
                int userid = Convert.ToInt32(Session["userid"]);
                int flag = Convert.ToInt32(Session["flag"]);
                string answer = "";
                RadioButton rdb = new RadioButton();
                if (flag == 1)
                {
                    foreach (Control c in pnlExam.Controls)
                    {
                        if (c.GetType() == typeof(RadioButton))
                        {
                            rdb = (RadioButton)c;
                            if (rdb.Checked == true)
                            {
                                answer = rdb.Text;                             
                            }
                        }
                    }
                    int questionid = Convert.ToInt32(dtquespaper.Rows[i][0].ToString());
                    int marks = Convert.ToInt32(dtquespaper.Rows[i][3].ToString());
                    string anskey = dtquespaper.Rows[i][8].ToString();                  
                    UserBL.InsertObjectiveAnswer(answer, questionid, paperid, userid, marks, anskey);                  
                    Session["flag"] = 0;
                   
                }
                foreach (Control c in pnlExam.Controls)
                {
                    if (c.GetType() == typeof(RadioButton))
                    {
                        rdb = (RadioButton)c;
                        if (rdb.Checked == true)
                        {
                            rdb.Checked = false;

                        }
                    }
                }
                if (i < count1-1)
                {                               
                    lblQuestionNo.Text = dtquespaper.Rows[i+1][1] + "." + " ".ToString();
                    lblQuestionDetail.Text =Server.HtmlDecode(dtquespaper.Rows[i+1][2].ToString());                    
                   // lblmarks.Text = dtquespaper.Rows[i+1][3].ToString();                   
                    rdAnswer1.Text = dtquespaper.Rows[i+1][4].ToString();                  
                    rdAnswer2.Text = dtquespaper.Rows[i+1][5].ToString();                  
                    rdAnswer3.Text = dtquespaper.Rows[i+1][6].ToString();                   
                    rdAnswer4.Text = dtquespaper.Rows[i+1][7].ToString();
                    string qst=dtquespaper.Rows[i+1][9].ToString();                               
                    if (qst != "")
                    {
                        imgDisplayImage.Visible = true;
                        imgDisplayImage.ImageUrl = dtquespaper.Rows[i+1][9].ToString();
                    }
                    else 
                    {
                        imgDisplayImage.Visible = false;
                        imgDisplayImage.ImageUrl = "";
                    }
                    Session["count"] = count1;
                    Session["paper"] = dtquespaper;
                    Session["paperid"] = paperid;
                    Session["userid"] = userid;
                    Session["flag"] = 1;
                   
                }
                if (i == count1-1)
                {
                    btnsubmit.Visible = true;
                    pnlExam.Visible = false;
                    dv.Visible = false;
                   
                }
                i += 1;
            }
            catch (Exception)
            { }
        }

        protected void ddlchapter_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                string email = Session["email"].ToString();
                //int classid = (int)Session["classid"];
                //int subjectid = Convert.ToInt32(ddlsubject.SelectedValue);
                if (UserBL.CheckStudent(email))
                {
                    btntest.Visible = true;
                }
                else
                {
                    lblchk.Text = "You Entered An Incorrect Class";
                }
            }
            catch (Exception)
            { }

        }

        protected void btnEndExam_Click(object sender, EventArgs e)
        {
            btnsubmit_Click(null,null);
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }
    }
}