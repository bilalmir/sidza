using Logic.BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VirtualClassroom_final.UI
{
    public partial class MyTeacherProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] != null)
            {
                DataSet dt = new DataSet();
                string teacherEmail = Session["email"].ToString();
                dt = UserBL.FetchTeacherFullProfileUsingEmail(teacherEmail);
                lblName.Text = dt.Tables[0].Rows[0].ItemArray[1].ToString();
                lblEmail.Text = dt.Tables[0].Rows[0].ItemArray[2].ToString();
                lblsubject.Text = dt.Tables[0].Rows[0].ItemArray[4].ToString();
                lblContact.Text = dt.Tables[0].Rows[0].ItemArray[3].ToString();
                lbladdress.Text = dt.Tables[0].Rows[0].ItemArray[9].ToString();
                string path = dt.Tables[0].Rows[0].ItemArray[5].ToString();
                lblqualification.Text = dt.Tables[0].Rows[0].ItemArray[6].ToString() + "," + dt.Tables[0].Rows[0].ItemArray[7].ToString() + "," + dt.Tables[0].Rows[0].ItemArray[8].ToString();
               
                if (path != "")
                {
                    imgteacher.Src = path;            
                }

               
            }
            else
            {
                Response.Redirect("~/UI/LogRegister.aspx", false);
            }
         
        }
    
    }
}