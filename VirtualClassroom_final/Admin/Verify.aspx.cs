using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logic.BL;


namespace VirtualClassroom_final.UI
{
    public partial class Verify : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["adminemail"] == null)
            {             
                 Response.Redirect("~/Admin/AdminLogin.aspx", true);
            }
            if (!IsPostBack)
            {
                showgrid();

            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

            GridView1.EditIndex = e.NewEditIndex;
            showgrid();
        }

        public void showgrid()
        {
            GridView1.DataSource = UserBL.FetchAdminAssets();
            GridView1.DataBind();
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            GridView1.EditIndex = e.RowIndex;
            showgrid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string id = GridView1.DataKeys[e.RowIndex].Value.ToString();

                TextBox cb = GridView1.Rows[e.RowIndex].FindControl("txtisvalid") as TextBox;
                bool valid = Convert.ToBoolean(cb.Text);
                int ide = Convert.ToInt32(id);

                Label lblsubjectid = GridView1.Rows[e.RowIndex].FindControl("lblsubjectid") as Label;
                string subid = lblsubjectid.Text;

                string subjectid1 = Convert.ToString(subid);
                int subjectid2;
                int.TryParse(subjectid1, out subjectid2);


                if (UserBL.UpdateRecord(ide, valid, subjectid2))
                {
                    lblmessage.Text = "updated";
                }
            }
            catch (Exception)
            { }
        }
        protected void Gridview1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            HyperLink h1 = (HyperLink)e.Row.FindControl("Download");
            h1.NavigateUrl = "http://www.google.com?q=" + DataBinder.Eval(e.Row.DataItem, "Download");

        }
    }
}