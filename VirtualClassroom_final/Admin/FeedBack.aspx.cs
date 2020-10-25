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
    public partial class FeedBack : System.Web.UI.Page
    {
        public static string show = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminemail"] != null)
            {
                if (show == "Delete")
                {
                    lblmsg.Text = "Feedback deleted Successfully !!";
                    show = string.Empty;
                }
            }
            else
            {
                Response.Redirect("~/Admin/AdminLogin.aspx");
            }
            if (!Page.IsPostBack)
            {
                this.fillgrid();
            }
        }
        protected void fillgrid()
        {
            DataTable feedback =  UserBL.fetchFeedback();
            gvFeedback.DataSource = feedback;
            gvFeedback.DataBind();

        }

        protected void gvFeedback_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = gvFeedback.Rows[e.RowIndex];
            Label id = (Label)row.FindControl("lblfeedbackID");
            int feedid = Int32.Parse(id.Text);
            string qry = "delete from [Feedback] where FeedbackID='" + feedid + "'";
            if (UserBL.deleteDetail(qry))
            {
                fillgrid();
                show = "Delete";
                Response.Redirect(Request.RawUrl);
            }

        }
    }

}