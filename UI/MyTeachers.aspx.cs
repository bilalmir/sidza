using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logic;
using System.Data;
using Logic.BL;


namespace VirtualClassroom_final.UI
{
    public partial class MyTeachers : System.Web.UI.Page
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