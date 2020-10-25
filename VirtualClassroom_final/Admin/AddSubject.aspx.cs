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
    public partial class AddSubject : System.Web.UI.Page
    {
        
        public static string show = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["adminemail"] != null)
                {
                    ddlClass.DataSource = UserBL.FetchClass();
                    ddlClass.DataValueField = "classid";
                    ddlClass.DataTextField = "classname";
                    ddlClass.DataBind();
                    ddlClass.Items.Insert(0, new ListItem("-Select Class-", "0"));

                    if (show == "Add")
                    {
                        lblmsg2.Text = "Subject Name Added Successfully !!";
                        show = string.Empty;
                    }
                    else if (show == "Update")
                    {
                        lblmsg2.Text = "Subject Name Updated Successfully !!";
                        show = string.Empty;
                    }
                    else if (show == "Delete")
                    {
                        lblmsg2.Text = "Subject Name Deleted Successfully !!";
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
            DataTable ds = UserBL.FetchSubject();
            gvclass.DataSource = ds;
            gvclass.DataBind();

        }
        protected void btnAddSubject_Click(object sender, EventArgs e)
        {
            int classid = Convert.ToInt32(ddlClass.SelectedValue);
            if (UserBL.AddSubject(txtSubject.Text, classid))
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
            Label subid = (Label)row.FindControl("lblsubjectid");
            int subjectid = Int32.Parse(subid.Text);
            string qry = "delete from tblsubject where subjectid='" + subjectid + "'";
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
            Label subid = (Label)row.FindControl("lblsubjectid");
            int subjectid = Int32.Parse(subid.Text);
            TextBox subjectname = (TextBox)row.FindControl("txtsubjectname");
            string qry = "update tblsubject set subjectname='" + subjectname.Text.Trim() + "' where subjectid='" + subjectid + "'";
            if (UserBL.UpdateDetails(qry))
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