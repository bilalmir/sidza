using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logic.BL;
using System.Windows.Forms;
using System.Data;
using System.Data.SqlClient;
namespace VirtualClassroom_final.UI
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { 
            if (Session["email"] != null)
            {   //string imgurl="~img/close.png";
                DataTable Stu_dt = new DataTable();
                string StuEmail = Session["email"].ToString();
                Stu_dt = UserBL.FetchStudata(StuEmail);
                imgStu.Src = Stu_dt.Rows[0].ItemArray[13].ToString();
                lblName.Text = Stu_dt.Rows[0].ItemArray[1].ToString();
                lblEmail.Text = Stu_dt.Rows[0].ItemArray[2].ToString();
                lblBoard.Text = Stu_dt.Rows[0].ItemArray[12].ToString();
                lblContact.Text = Stu_dt.Rows[0].ItemArray[3].ToString();
            }
            else { Response.Redirect("~/UI/LogRegister.aspx", false); }

        }
    }
}