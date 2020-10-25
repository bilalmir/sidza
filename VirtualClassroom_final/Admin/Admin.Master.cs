using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VirtualClassroom_final.UI
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session["adminemail"] = null;
            Session.Abandon();
            Response.Redirect("~/Admin/AdminLogin.aspx", true);

        }
    }
}