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
           if (!IsPostBack)
           {
               if (Session["email"] != null)
               {
                   DataBind1();
               }
               else
               {
                   Response.Redirect("~/UI/LogRegister.aspx");
               }
           }
           

        }
        protected DataRow fillgrid(string teacheremail)
        {
            return UserBL.getTeacherProfile(teacheremail);
        }
        protected void DataBind1()
        {
            try
            {
                int i = 0;
                DataTable teaheremail = new DataTable();
                DataTable teacherlist = new DataTable();
                teacherlist.Columns.Add("id");
                teacherlist.Columns.Add("name");
                teacherlist.Columns.Add("email");
                teacherlist.Columns.Add("contact");
                teacherlist.Columns.Add("profileimage");
                teacherlist.Columns.Add("TeacherSubject");
                teacherlist.Columns.Add("Qualification1");
                teacherlist.Columns.Add("Qualification2");
                teacherlist.Columns.Add("Qualification3");
                teacherlist.Columns.Add("Address");
                string stuemail = Session["email"].ToString();
                teaheremail = UserBL.getteacheremail(stuemail);
                while (i < teaheremail.Rows.Count)
                {
                    DataRow dr;
                    string mm = teaheremail.Rows[i][0].ToString();
                    dr = fillgrid(mm);
                    teacherlist.ImportRow(dr);
                    i++;
                }
                grdvwShowTeacherProfile.DataSource = teacherlist;
                grdvwShowTeacherProfile.DataBind();
            }
            catch { throw; }
        }
        protected void grdvwShowTeacherProfile_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "showprofile")
            {
                int rowindex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = grdvwShowTeacherProfile.Rows[rowindex];
                Label userid = (Label)row.FindControl("lbluserid");
                Session["userid"] = Convert.ToInt32(userid.Text);
                Response.Redirect("~/UI/TeacherProfile.aspx");
            }
        }

        protected void grdvwShowTeacherProfile_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

       
    }
}