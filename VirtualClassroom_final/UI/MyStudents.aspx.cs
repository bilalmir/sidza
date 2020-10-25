using Logic.BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VirtualClassroom_final.UI
{
    public partial class MyStudents : System.Web.UI.Page
    {
        string status = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["email"] != null)
                {
                    fillgrid();
                    fillList();
                    if(Session["schedule"]!=null)
                    {
                       
                        lblscheduleclass.Text = status;
                    }
                }
                else
                {
                    Response.Redirect("~/UI/LogRegister.aspx");
                }
            }
        }
        protected void fillgrid()
        {
            string email = Session["email"].ToString();
            DataSet ds = UserBL.FetchStudentProfile(email);
            grdvwShowTeachers.DataSource = ds;
            grdvwShowTeachers.DataBind();
        }
        protected void fillList()
        {
            DataTable SubjectList = UserBL.FetchSubject();
            drpdwnSubjectList.DataTextField = "subjectname";
            drpdwnSubjectList.DataValueField = "subjectid";
            drpdwnSubjectList.DataSource = SubjectList;
            drpdwnSubjectList.DataBind();
        }
        protected void grdvwShowTeachers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "message")
            {
                int rowindex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = grdvwShowTeachers.Rows[rowindex];
                Label userid = (Label)row.FindControl("lbluserid");
                Session["userid"] = Convert.ToInt32(userid.Text);
                //Response.Redirect("~/UI/TeacherProfile.aspx");
            }
        }
        protected void grdvwShowTeachers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdvwShowTeachers.PageIndex = e.NewPageIndex;
            string subject = Session["subject"].ToString();
            fillgrid();
            grdvwShowTeachers.DataBind();
        }

        protected static string NewToken()
        {
            using (RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider())
            {
                byte[] randomBuffer = new byte[16];
                rng.GetBytes(randomBuffer);

                using (MD5 md5 = MD5.Create())
                {
                    byte[] hashBytes = md5.ComputeHash(randomBuffer);

                    StringBuilder sBuilder = new StringBuilder();
                    foreach (byte byt in hashBytes)
                    {
                        sBuilder.Append(byt.ToString("x2"));
                    }

                    return sBuilder.ToString();
                }
            }
        }
        protected void btnSetClassSchedule_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string teacheremail = Session["email"].ToString();
                string studentemail = txtemail.Text.Trim();
                string subject = drpdwnSubjectList.SelectedItem.ToString();
                string grade = txtgrade.Text.Trim();
                string topic = txttopic.Text.Trim();
                string date = txtDate.Text;

                string url = NewToken();
                //  string  date1 = Convert.ToDateTime(txtdate.Text.Trim()).ToString("M/dd/yyyy");
                // DateTime date = Convert.ToDateTime(date1);
                //DateTime date = Convert.ToDateTime(dt, System.Globalization.CultureInfo.InvariantCulture);
                TimeSpan tmfrm = TimeSpan.Parse(txtStartTim.Text.Trim());
                var frm = new DateTime(tmfrm.Ticks);
                string timefrm = frm.ToString("h:mm tt", System.Globalization.CultureInfo.InvariantCulture);
                TimeSpan tmto = TimeSpan.Parse(txtEndTime.Text.Trim());
                var to = new DateTime(tmto.Ticks);
                string timeto = to.ToString("h:mm tt", System.Globalization.CultureInfo.InvariantCulture);
                if (UserBL.ScheduleClass(teacheremail, studentemail, subject, topic, grade, date, timefrm, timeto, url))
                {
                    status = "Class has been scheduled";
                    fillgrid();
                    Response.Redirect(Request.RawUrl);
                }
            }
        }

        protected void lnkBtnEdit_Click(object sender, EventArgs e)
        {
            int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
            GridViewRow row = grdvwShowTeachers.Rows[rowIndex];            
            txtemail.Text = (row.FindControl("lblemail") as Label).Text; ;
            txtgrade.Text = (row.FindControl("lblgrade") as Label).Text;
            txttopic.Text = (row.FindControl("lblcontact") as Label).Text;
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
        }
        //protected void btnsend_Click(object sender, EventArgs e)
        //{
        //    string studentname = txtname.Text.Trim();
        //    long contact = long.Parse(txtcontact.Text.Trim());
        //    string studentemail = txtemail.Text.Trim();
        //    string teacheremail = lblteacheremail.Text;
        //    string grade = txtgrade.Text.Trim();
        //    string studentmessage = txtmessage.Text.Trim();
        //    if (!UserBL.CheckEmailSentToTeacher(studentemail, teacheremail))
        //    {
        //        StringBuilder sb = new StringBuilder();
        //        sb.Append("Message From : " + studentemail + "");
        //        Email.SendEmail(teacheremail, sb.ToString(), studentmessage);
        //        string emailsend = "Email sent";
        //        if (UserBL.SaveTeacherStudentMessage(studentname, studentemail, contact, teacheremail, emailsend, grade))
        //        {
        //            lblconfirmation.Text = "Message has been sent to this teacher";
        //        }
        //    }
        //    else
        //    {
        //        if (UserBL.SaveTeacherStudentMessage(studentname, studentemail, contact, teacheremail, studentmessage, grade))
        //        {
        //            lblconfirmation.Text = "Message has been sent to this teacher";
        //        }
        //    }
        //}

    }
}