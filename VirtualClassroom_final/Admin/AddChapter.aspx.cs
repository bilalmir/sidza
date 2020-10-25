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
    public partial class AddChapter : System.Web.UI.Page
    {
        
        public static string show = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["adminemail"] != null)
                {
                    ddlclass1.DataSource = UserBL.FetchClass();
                    ddlclass1.DataValueField = "classid";
                    ddlclass1.DataTextField = "classname";
                    ddlclass1.DataBind();
                    ddlclass1.Items.Insert(0, new ListItem("-Select Class-", "0"));

                    if (show == "Add")
                    {
                        lblmsg2.Text = "Chapter Name Added Successfully !!";
                        show = string.Empty;
                    }
                    else if (show == "Update")
                    {
                        lblmsg2.Text = "Chapter Name Updated Successfully !!";
                        show = string.Empty;
                    }
                    else if (show == "Delete")
                    {
                        lblmsg2.Text = "Chapter Name Deleted Successfully !!";
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
            DataTable ds = UserBL.FetchLessonName();
            gvclass.DataSource = ds;
            gvclass.DataBind();

        }
        protected void ddlclass1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int classid = Convert.ToInt32(ddlclass1.SelectedValue);
            ddlsubject1.DataSource = UserBL.FetchSubject(classid);
            ddlsubject1.DataValueField = "subjectid";
            ddlsubject1.DataTextField = "subjectname";
            ddlsubject1.DataBind();
            ddlsubject1.Items.Insert(0, new ListItem("-Select Subject-", "0"));


        }
        protected void btnAddChapter_Click(object sender, EventArgs e)
        {

            int subjectid = Convert.ToInt32(ddlsubject1.SelectedValue);
            if (UserBL.AddChapter(txtchapter.Text.Trim(), subjectid))
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
            Label chapid = (Label)row.FindControl("lbllessonid");
            int lessonid = Int32.Parse(chapid.Text);
            string qry = "delete from tbllesson where lessonid='" + lessonid + "'";
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
            Label chapid = (Label)row.FindControl("lbllessonid");
            int lessonid = Int32.Parse(chapid.Text);
            TextBox lessonname = (TextBox)row.FindControl("txtlessonname");
            //string qry = "update tbllesson set lessonname='" + lessonname.Text.Trim() + "' where lessonid='" + lessonid + "'";
            if (UserBL.UpdateChapter(lessonname.Text.Trim(),lessonid))
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