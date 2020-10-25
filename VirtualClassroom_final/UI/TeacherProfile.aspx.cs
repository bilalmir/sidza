using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logic.BL;
using System.Data;
using System.Text;

namespace VirtualClassroom_final.UI
{
    public partial class TeacherProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["email"] != null)
                {
                    loadteacherProfile();
                    FillStudentFormData();
                    if(Session["confirmation"]!=null)
                    {
                        lblconfirmation.Text = Session["confirmation"].ToString();  
                    }
                }
                else
                {
                    Session["pageredirect"] = "Please Login/Register to download Content";
                    Response.Redirect("~/UI/LogRegister.aspx");
                }
            }
        }
        protected void loadteacherProfile()
        {
            Int32 userid = Convert.ToInt32(Session["userid"]);
            DataSet ds = UserBL.FetchTeacherFullProfile(userid);
            lblteachername.Text = ds.Tables[0].Rows[0]["name"].ToString();
            imgteacherImage.ImageUrl = ds.Tables[0].Rows[0]["profileimage"].ToString();
            lblteacheremail.Text = ds.Tables[0].Rows[0]["email"].ToString();
            lblteachersubject.Text = ds.Tables[0].Rows[0]["teacherSubject"].ToString();
            lblteacherqualification1.Text = ds.Tables[0].Rows[0]["qualification1"].ToString();
            lblteacherqualification2.Text = ds.Tables[0].Rows[0]["qualification2"].ToString();
            lblteacherqualification3.Text = ds.Tables[0].Rows[0]["qualification3"].ToString();
            lblteacheraddress.Text = ds.Tables[0].Rows[0]["address"].ToString();
            lblteachercontact.Text = ds.Tables[0].Rows[0]["contact"].ToString();
            lblteachersubject1.Text = lblteacherqualification1.Text;
            
        }
        protected void FillStudentFormData()
        {
            DataTable Stu_dt = new DataTable();
            string StuEmail = Session["email"].ToString();
            Stu_dt = UserBL.FetchStudata(StuEmail);
            DataTable dtclass = UserBL.FetchClass();
            txtname.Text = Stu_dt.Rows[0].ItemArray[1].ToString();
            txtemail.Text = Stu_dt.Rows[0].ItemArray[2].ToString();
            txtcontact.Text = Stu_dt.Rows[0].ItemArray[3].ToString();
            int clasid = Convert.ToInt32(Stu_dt.Rows[0].ItemArray[11].ToString());
            string classname = string.Empty;
            foreach (DataRow dr in dtclass.Rows)
            {
                if (int.Parse(dr["classid"].ToString()) == clasid)
                    classname = dr["classname"].ToString();
            }
            txtgrade.Text = classname;
        }

        protected void btnsend_Click(object sender, EventArgs e)
        {
                string studentname=txtname.Text.Trim();
                long contact= long.Parse(txtcontact.Text.Trim());
                string studentemail=txtemail.Text.Trim();
                string teacheremail=lblteacheremail.Text;
                string grade=txtgrade.Text.Trim();
                string studentmessage=txtmessage.Text.Trim();
                if (!UserBL.CheckEmailSentToTeacher(studentemail, teacheremail))
                {
                    StringBuilder sb = new StringBuilder();
                    sb.Append("Message From : " + studentemail + "");
                    Email.SendEmail(teacheremail,sb.ToString(), studentmessage);
                    string emailsend = "Email sent";
                    if (UserBL.SaveTeacherStudentMessage(studentname, studentemail, contact, teacheremail, emailsend, grade))
                    {
                        Session["confirmation"] = "Message has been sent to this teacher";
                        Response.Redirect(Request.RawUrl);
                    }
                }
                else
                {
                    if (UserBL.SaveTeacherStudentMessage(studentname, studentemail, contact, teacheremail,studentmessage, grade))
                    {
                        Session["confirmation"] = "Message has been sent to this teacher";
                        Response.Redirect(Request.RawUrl);
                    }                
                }
        }
    }
}