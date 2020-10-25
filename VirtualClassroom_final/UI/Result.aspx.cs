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
    public partial class Result : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (base.Page_Load(sender, e) == null)
                //{
                //    Response.Redirect("~/UI/LogRegister.aspx");
                //}


                if (Session["email"] != null)
                {
                    string email = Session["email"].ToString();
                    //int classid = (int)Session["classid"];
                    //int subjectid = (int)Session["subjectid"];

                    if (UserBL.CheckUser(email))
                    {
                        //btnfullresult.Visible = true;
                        //rdlist.Visible = true;
                        showResult();

                    }

                }
                else
                {
                    Response.Redirect("~/UI/LogRegister.aspx");
                }
            }
        }


        protected void showResult()
        {           
            rslt.Visible = true;
            int classid = (int)Session["classid"];
           // int subjectid = (int)Session["subjectid"];
            string subjectname = (string)Session["subject"];
            string chaptername = (string)Session["chapter"];
            string email = Session["email"].ToString();
            DataTable dtcls = new DataTable();
            dtcls = UserBL.FetchClassname(classid);
            string classname = dtcls.Rows[0][0].ToString();
            DataTable dtsub = new DataTable();
            //dtsub = UserBL.FetchSubjectname(subjectid);
           // string subjectname = dtsub.Rows[0][0].ToString();
            lblname.Visible = true;
            //lblid.Visible = true;
            lblcls.Visible = true;
            lblsub.Visible = true;
            lblsecured.Visible = true;
            //lblresult.Visible = true;

            DataTable dtpaperId = new DataTable();
            //dtpaperId = UserBL(classname, subjectname);
            dtpaperId = UserBL.FetchObjectivePaperId(classname, subjectname,chaptername);
            int count = Convert.ToInt32(dtpaperId.Rows.Count);
            int paperid = Convert.ToInt32(dtpaperId.Rows[count - 1][0]);

            DataTable dtresult = new DataTable();
            //dtresult = UserBL.ViewResultName(txtname.Text, paperid);
            dtresult = UserBL.ViewResultName(email, paperid);

            DataTable dtuser = UserBL.UserId(email);
            int userid=Convert.ToInt32(dtuser.Rows[0][0]);
            DataTable dtAnsinfo= UserBL.getAnsInfo(userid,paperid);
            DataTable dtQuestionsAttempted = UserBL.getAttemptedQuestions(userid, paperid);
            DataTable dtWrongAnswered = UserBL.getWrongAnsweredQuestions(userid, paperid);
            DataTable dtCorrectAnswered = UserBL.getCorrectAnsweredQuestions(userid, paperid);
            Session["uid"] = userid;
            Session["pid"] = paperid;
            Label t = new Label();
            t.Text = "<table class='table table-responsive' style='margin-top:15px;margin-bottom:10px;'><tr><td>";

            Label lblqsn = new Label();
            lblqsn.CssClass = "label label-primary";
            lblqsn.Attributes.Add("style", "margin-left:15px");
            lblqsn.Font.Bold = true;
            lblqsn.Font.Size = 15;
            lblqsn.Text = "Question";

            Label c2 = new Label();
            c2.Text = "</td><td>";
          
            Label lblcorrect = new Label();
            lblcorrect.CssClass = "label label-success";
            lblcorrect.Font.Bold = true;
            lblcorrect.Font.Size = 15;
            lblcorrect.Text = "Correct Answer";
           
            Label c3= new Label();
            c3.Text="</td><td>";

            Label lblWrong = new Label();
            lblWrong.CssClass = "label label-warning";
            lblWrong.Font.Bold = true;
            lblWrong.Font.Size = 15;
            lblWrong.Text = "Wrong Answer";

            Label c4= new Label();
            c4.Text="</td></tr>";

            pnlShowAnsInfo.Controls.Add(t);           
            pnlShowAnsInfo.Controls.Add(lblqsn);
            pnlShowAnsInfo.Controls.Add(c2);
            pnlShowAnsInfo.Controls.Add(lblcorrect);
            pnlShowAnsInfo.Controls.Add(c3);
            pnlShowAnsInfo.Controls.Add(lblWrong);
            pnlShowAnsInfo.Controls.Add(c4);
           
            for (int i = 0; i <= dtAnsinfo.Rows.Count - 1; i++)
            {
                if (dtAnsinfo.Rows[i][1].ToString() != dtAnsinfo.Rows[i][7].ToString())
                {
                    Label tr = new Label();
                    tr.Text = "<tr><td>";                

                    Label lblquestion = new Label();
                    lblquestion.CssClass = "label label-primary";
                    lblquestion.Attributes.Add("style", "margin-left:15px");
                    lblquestion.Text = dtAnsinfo.Rows[i][9].ToString();

                    Label s1 = new Label();
                    s1.Text = "</td><td>";

                    Label lblcorrectans = new Label();
                    lblcorrectans.CssClass = "label label-success";
                    lblcorrectans.Text = dtAnsinfo.Rows[i][7].ToString();

                    Label s2 = new Label();
                    s2.Text = "</td><td>";

                    Label lbluserans = new Label();
                    lbluserans.CssClass = "label label-warning";
                    lbluserans.Text = dtAnsinfo.Rows[i][1].ToString();

                    Label space1 = new Label();
                    space1.Text = "</td></tr>";                   
                    pnlShowAnsInfo.Controls.Add(tr);                 
                    pnlShowAnsInfo.Controls.Add(lblquestion);
                    pnlShowAnsInfo.Controls.Add(s1);
                    pnlShowAnsInfo.Controls.Add(lblcorrectans);
                    pnlShowAnsInfo.Controls.Add(s2);
                    pnlShowAnsInfo.Controls.Add(lbluserans);
                    pnlShowAnsInfo.Controls.Add(space1);                 
                }
            }
            Label tbl = new Label();
            tbl.Text = "</table>";
            pnlShowAnsInfo.Controls.Add(tbl);
                if (dtresult.Rows.Count > 0)
                {
                    lblname.Text = dtresult.Rows[0][0].ToString();
                    lblcls.Text = dtresult.Rows[0][2].ToString();
                    lblsub.Text = dtresult.Rows[0][3].ToString();
                    lblchapter.Text = dtresult.Rows[0][4].ToString();
                    lblQuestionsAttempted.Text = dtQuestionsAttempted.Rows[0][0].ToString();
                    lblWrongAnswered.Text = dtWrongAnswered.Rows[0][0].ToString();
                    lblCorrectAnswered.Text = dtCorrectAnswered.Rows[0][0].ToString();
                    int per = Convert.ToInt32(dtresult.Rows[0][5]);
                    if (per < 40)
                    {
                        lblsecured.CssClass = "label label-warning pull-right";
                        lblsecured.Text = per.ToString();
                    }
                    else
                    {
                        lblsecured.CssClass = "label label-success pull-right";
                        lblsecured.Text = per.ToString();
                    }
                }          
        }

        protected void btnRetakeTest_Click(object sender, EventArgs e)
        {
            try
            {
                string chapter = (string)Session["chapter"];
                Session["repeatTest"] = chapter;
                int userid = (int)Session["uid"];
                int paperid = (int)Session["pid"];
                string qry = "delete from objectiveanswers where userid='" + userid + "' and paperid='" + paperid + "'";
                UserBL.UpdateDetails(qry);
                Response.Redirect("~/UI/takeexam.aspx");
            }
            catch {}
        }
        
    


    }
}