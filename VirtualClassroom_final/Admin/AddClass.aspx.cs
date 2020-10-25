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
    public partial class AddClass : System.Web.UI.Page
    {
        
        public static string show = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["adminemail"] != null)
                {
                    if (show == "Add")
                    {
                        lblmsg.Text = "Class Name Added Successfully !!";
                        show = string.Empty;
                    }
                    else if (show == "Update")
                    {
                        lblmsg.Text = "Class Name Updated Successfully !!";
                        show = string.Empty;
                    }
                    else if (show == "Delete")
                    {
                        lblmsg.Text = "Class Name Deleted Successfully !!";
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
            DataTable ds = UserBL.FetchClass();
            gvclass.DataSource = ds;
            gvclass.DataBind();

        }
        protected void btnAddClass_Click(object sender, EventArgs e)
        {
            if (UserBL.AddClass(txtClass.Text))
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
            Label clsid = (Label)row.FindControl("lblclassid");
            int classid = Int32.Parse(clsid.Text);
            string qry = "delete from tblclass where classid='" + classid + "'";
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
            Label clsid = (Label)row.FindControl("lblclassid");
            TextBox classname = (TextBox)row.FindControl("txtclassname");
            int classid = Int32.Parse(clsid.Text);
            string qry = "update tblclass set classname='" + classname.Text.Trim() + "' where classid='" + classid + "'";
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