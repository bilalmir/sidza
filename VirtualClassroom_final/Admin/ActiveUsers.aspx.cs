using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logic.BL;

namespace VirtualClassroom_final.UI
{
    
    public partial class ActiveUsers : System.Web.UI.Page
    {
        public static string show = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
          
            if (Session["adminemail"] != null)
            {
                if (show == "Delete")
                {
                    lblmsgg.Text = "User deleted Successfully !!";
                    show = string.Empty;
                }

            }
            else
            {
                Response.Redirect("~/Admin/AdminLogin.aspx", true);
            }
            if (!IsPostBack)
            {
                fillgrid();
            }
        }
        protected void fillgrid()
        {
            GridView2.DataSource = UserBL.FetchActiveUsers();
            GridView2.DataBind();

        
        }
        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = GridView2.Rows[e.RowIndex];
            Label uid = (Label)row.FindControl("Lbluserid");
            int userid = Int32.Parse(uid.Text);
           // string qry = "delete from [user] where id='" + userid + "'";
            
            if (UserBL.deleteUser(userid))
            {
                fillgrid();
                show = "Delete";
                Response.Redirect(Request.RawUrl);
            }

        }
    }
}