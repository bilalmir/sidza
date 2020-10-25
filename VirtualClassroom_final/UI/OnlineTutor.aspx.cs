using Logic.BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VirtualClassroom_final.UI
{
    public partial class OnlineTutor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["email"] != null && Session["StuSighInStatus"].ToString() == "true")
                {
                    divRegistrationDialog.Visible = false;
                    
                }
               
                drpSearchTeacher.DataSource = UserBL.FetchTutorSubject();                // fetch classes for dropdown (class)
                drpSearchTeacher.DataValueField = "t_subjectid";
                drpSearchTeacher.DataTextField = "t_subjectname";
                drpSearchTeacher.DataBind();
                drpSearchTeacher.Items.Insert(0, new ListItem("-Select Subject-", "0"));
            }

        }
        protected void fillgrid(string subject)
        {
            DataSet ds = UserBL.FetchTeacherProfile(subject);
            grdvwShowTeachers.DataSource = ds;
            grdvwShowTeachers.DataBind();
        }
        protected void btnSearchteacher_Click(object sender, EventArgs e)
        {
            string subject = drpSearchTeacher.SelectedItem.ToString();
            Session["subject"] = subject;
            fillgrid(subject);
            showprofile.Visible = true;
           

        }

        protected void grdvwShowTeachers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdvwShowTeachers.PageIndex = e.NewPageIndex;
            string subject = Session["subject"].ToString();
            fillgrid(subject);
            grdvwShowTeachers.DataBind();
        }

        protected void btnShowTeacherProfile_Click(object sender, EventArgs e)
        {
        }

        protected void grdvwShowTeachers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "showprofile")
            {
                int rowindex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = grdvwShowTeachers.Rows[rowindex];
                Label userid = (Label)row.FindControl("lbluserid");
                Session["userid"] =Convert.ToInt32(userid.Text);
                Response.Redirect("~/UI/TeacherProfile.aspx");
            }
        }
    }
}