using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logic.BL;
using System.Data;

namespace VirtualClassroom_final.Admin
{
    public partial class AddTitle : System.Web.UI.Page
    {
       
        public static string show = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["adminemail"] != null)
                {
                    ddlclass2.DataSource = UserBL.FetchClass();
                    ddlclass2.DataValueField = "classid";
                    ddlclass2.DataTextField = "classname";
                    ddlclass2.DataBind();
                    ddlclass2.Items.Insert(0, new ListItem("-Select Class-", "0"));

                    if (show == "Add")
                    {
                        lblmsg2.Text = "Title Name Added Successfully !!";
                        show = string.Empty;
                    }
                    else if (show == "Update")
                    {
                        lblmsg2.Text = "Title Name Updated Successfully !!";
                        show = string.Empty;
                    }
                    else if (show == "Delete")
                    {
                        lblmsg2.Text = "Title Name Deleted Successfully !!";
                        show = string.Empty;
                    }


                }
                else
                {
                    Response.Redirect("~/Admin/AdminLogin.aspx", true);
                }

                fillgrid();
            }
        }
        protected void fillgrid()
        {
            DataTable ds = UserBL.FetchTitleName();
            gvclass.DataSource = ds;
            gvclass.DataBind();
        }
        protected void ddlclass2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int classid = Convert.ToInt32(ddlclass2.SelectedValue);
            ddlsubject2.DataSource = UserBL.FetchSubject(classid);
            ddlsubject2.DataValueField = "subjectid";
            ddlsubject2.DataTextField = "subjectname";
            ddlsubject2.DataBind();
            ddlsubject2.Items.Insert(0, new ListItem("-Select Subject-", "0"));
        }
        protected void ddlsubject2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int subjectid = Convert.ToInt32(ddlsubject2.SelectedValue);
            ddllesson.DataSource = UserBL.FetchLesson(subjectid);
            ddllesson.DataValueField = "lessonid";
            ddllesson.DataTextField = "lessonname";
            ddllesson.DataBind();
            ddllesson.Items.Insert(0, new ListItem("-Select Lesson-", "0"));
        }
        protected void btnAddTitle_Click(object sender, EventArgs e)
        {
            int lessonid = Convert.ToInt32(ddllesson.SelectedValue);
            if (UserBL.AddTitle(txttitle.Text.Trim(), lessonid))
            {
                show = "Add";
                Response.Redirect(Request.RawUrl);
            }
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
            Label titid = (Label)row.FindControl("lbltitleid");
            int titleid = Int32.Parse(titid.Text);
            string qry = "delete from tbltitle where titleid='" + titleid  + "'";
            if (UserBL.deleteDetail(qry))
            {
                fillgrid();
                show = "Delete";
                Response.Redirect(Request.RawUrl);
            }

        }
        protected void gvclass_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvclass.Rows[e.RowIndex];
            Label titid = (Label)row.FindControl("lbltitleid");
            int titleid = Int32.Parse(titid.Text);
            TextBox titlename = (TextBox)row.FindControl("txttitlename");
           // string qry = "update tbltitle set titlename='" + titlename.Text.Trim() + "' where titleid='" + titleid  + "'";
            if (UserBL.UpdateTitle(titlename.Text.Trim(),titleid))
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