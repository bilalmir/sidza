using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logic.BL;

namespace VirtualClassroom_final.UI
{
    public partial class AdminWelcome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["adminemail"] != null)
            {
                hdnadmininfo.Value = Convert.ToString(Session["email"]);
                //ddlClass.DataSource = UserBL.FetchClass();
                //ddlClass.DataValueField = "classid";
                //ddlClass.DataTextField = "classname";
                //ddlClass.DataBind();
                //ddlClass.Items.Insert(0, new ListItem("-Select Class-", "0"));

                //ddlclass1.DataSource = UserBL.FetchClass();
                //ddlclass1.DataValueField = "classid";
                //ddlclass1.DataTextField = "classname";
                //ddlclass1.DataBind();
                //ddlclass1.Items.Insert(0, new ListItem("-Select Class-", "0"));

                //ddlclass2.DataSource = UserBL.FetchClass();
                //ddlclass2.DataValueField = "classid";
                //ddlclass2.DataTextField = "classname";
                //ddlclass2.DataBind();
                //ddlclass2.Items.Insert(0, new ListItem("-Select Class-", "0"));

                if (Session["message"] != null)
                {
                    lblmsg.Text = Convert.ToString(Session["message"]);
                }
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Information", "<script>alert('Please login first');</script>", true);
                Response.Redirect("~/Admin/AdminLogin.aspx", true);
            }
            if (!IsPostBack)
            {
              
            }

        }
        //protected void btnAddClass_Click(object sender, EventArgs e)
        //{
        //    if (UserBL.AddClass(txtClass.Text))
        //    {
        //        //lblmsg.Text = " class name inserted successfully";
        //        Session["message"] = "class name inserted successfully";
        //        Response.Redirect("~/Admin/AdminWelcome.aspx", true);

        //    }
        //    else
        //    {
        //        //lblmsg.Text = " class name not inserted";
        //        Session["message"] = "class name not inserted";
        //        Response.Redirect("~/Admin/AdminWelcome.aspx", true);

        //    }
        //}
        //protected void btnAddSubject_Click(object sender, EventArgs e)
        //{

        //    int classid = Convert.ToInt32(ddlClass.SelectedValue);
        //    if (UserBL.AddSubject(txtSubject.Text, classid))
        //    {
        //       // lblmsg2.Text = " Subject name inserted successfully";
        //        Session["message"] = "Subject name inserted successfully";
        //        Response.Redirect("~/Admin/AdminWelcome.aspx", true);

        //    }
        //    else
        //    {
        //        //lblmsg2.Text = " subject name not inserted";
        //        Session["message"] = "Subject name not inserted";
        //        Response.Redirect("~/Admin/AdminWelcome.aspx", true);

        //    }
        //}
        //protected void ddlclass1_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    int classid = Convert.ToInt32(ddlclass1.SelectedValue);
        //    ddlsubject1.DataSource = UserBL.FetchSubject(classid);
        //    ddlsubject1.DataValueField = "subjectid";
        //    ddlsubject1.DataTextField = "subjectname";
        //    ddlsubject1.DataBind();
        //    ddlsubject1.Items.Insert(0, new ListItem("-Select Subject-", "0"));


        //}
        //protected void btnAddChapter_Click(object sender, EventArgs e)
        //{

        //    int subjectid = Convert.ToInt32(ddlsubject1.SelectedValue);
        //    if (UserBL.AddChapter(txtchapter.Text.Trim(), subjectid))
        //    {
        //        //lblmsg2.Text = " Chapter name inserted successfully";
        //        Session["message"] = "Chapter name inserted successfully";
        //        Response.Redirect("~/AdminWelcome.aspx", true);
        //    }
        //    else
        //    {
        //        //lblmsg2.Text = " Chapter name not inserted ";
        //        Session["message"] = "Chapter name not inserted";
        //        Response.Redirect("~/Admin/AdminWelcome.aspx", true);
        //    }
        //}
        //protected void ddlclass2_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    int classid = Convert.ToInt32(ddlclass2.SelectedValue);
        //    ddlsubject2.DataSource = UserBL.FetchSubject(classid);
        //    ddlsubject2.DataValueField = "subjectid";
        //    ddlsubject2.DataTextField = "subjectname";
        //    ddlsubject2.DataBind();
        //    ddlsubject2.Items.Insert(0, new ListItem("-Select Subject-", "0"));
        //}
        //protected void ddlsubject2_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    int subjectid = Convert.ToInt32(ddlsubject2.SelectedValue);
        //    ddllesson.DataSource = UserBL.FetchLesson(subjectid);
        //    ddllesson.DataValueField = "lessonid";
        //    ddllesson.DataTextField = "lessonname";
        //    ddllesson.DataBind();
        //    ddllesson.Items.Insert(0, new ListItem("-Select Lesson-", "0"));
        //}
        //protected void btnAddTitle_Click(object sender, EventArgs e)
        //{
        //    int lessonid = Convert.ToInt32(ddllesson.SelectedValue);
        //    if (UserBL.AddTitle(txttitle.Text.Trim(), lessonid))
        //    {
               
        //        //lblmsg2.Text = " Title name inserted successfully";
        //        Session["message"] = "Title name inserted successfully";
        //        Response.Redirect("~/Admin/AdminWelcome.aspx", true);

        //    }
        //    else
        //    {
               
        //        //lblmsg2.Text = " Title name not inserted ";
        //        Session["message"] = "Title name not inserted";
        //        Response.Redirect("~/Admin/AdminWelcome.aspx", true);


        //    }
        //}


    }
}