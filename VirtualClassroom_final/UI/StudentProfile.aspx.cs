using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logic.BL;
using System.Data;
using System.Data.SqlClient;
namespace VirtualClassroom_final.UI
{
    public partial class StudentProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] != null)
            {
                DataTable Stu_dt = new DataTable();
                string StuEmail = Session["email"].ToString();
                Stu_dt = UserBL.FetchStudata(StuEmail);
                DataTable dtclass= UserBL.FetchClass();
                lblName.Text = Stu_dt.Rows[0].ItemArray[1].ToString();
                lblEmail.Text = Stu_dt.Rows[0].ItemArray[2].ToString();
                lblBoard.Text = Stu_dt.Rows[0].ItemArray[12].ToString();
                lblContact.Text = Stu_dt.Rows[0].ItemArray[3].ToString();
                int clasid = Convert.ToInt32(Stu_dt.Rows[0].ItemArray[11].ToString());
                string classname = string.Empty;
                foreach(DataRow dr in dtclass.Rows)
                {
                    if (int.Parse(dr["classid"].ToString()) == clasid)
                        classname = dr["classname"].ToString();
                }
                lblClass.Text = classname;
                if (Session["profileImage"].ToString() != "" && Session["profileImage"].ToString() != null)
                {
                    imgStu.Src = Stu_dt.Rows[0].ItemArray[13].ToString();
                }
                else
                {
                    imgStu.Src = "../img/profile.png";
                }
            }
            else
            {
                Response.Redirect("~/UI/LogRegister.aspx", false);
            }

        }
       
    }
}