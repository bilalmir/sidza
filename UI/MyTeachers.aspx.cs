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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            fillgrid();
        }

        protected void grdvMyTeachers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void grdvwMyTeachers_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void fillgrid()
        {
            DataSet ds = UserBL.FetchTeacherProfile("Physics");
            grdvwMyTeachers.DataSource = ds;
            grdvwMyTeachers.DataBind();
        }
    }
}