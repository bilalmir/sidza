using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logic.BL;
using System.Data;
using System.Text;
using System.IO;
using System.Web.SessionState;
using System.Web.Security;

namespace VirtualClassroom_final.UI
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dtuser = new DataTable();

                dtuser = UserBL.ValidateUser(txtloginmail.Text, txtloginpass.Text);
                if (dtuser.Rows.Count > 0)
                {
                    if (Convert.ToInt32(dtuser.Rows[0][2].ToString()) == 3)   //admin
                    {
                        Session["adminemail"] = dtuser.Rows[0][0].ToString();
                      
                        Response.Redirect("~/Admin/AdminWelcome.aspx");

                    }
                }
                //else
                //{
                //    lblmessage.Text = "Incorrect Email or Password.";
                //}
            }
            catch (Exception)
            { }
        }

        //protected void btnforgotpass_Click(object sender, EventArgs e)
        //{

        //    if (UserBL.Forgotemail(txtforgotpass.Text))
        //    {
        //        StringBuilder sb = new StringBuilder();
        //        Session["email"] = txtforgotpass.Text;
        //        Guid g = Guid.NewGuid();
        //        Random r = new Random();
        //        int i = r.Next();
        //        string email = txtforgotpass.Text;

        //        UserBL.InsertRandomNumber(i, email);
        //        sb.Append(".To reset your password  <a href='http://localhost:61530/UI/ResetPassword.aspx?auth=" + i + " target='_blank'>click here</a>");
        //        Email.SendEmail(txtforgotpass.Text, "Hello", sb.ToString());
        //        Session["Date"] = DateTime.Now.ToString();
        //        string date = Session["Date"] as string;
        //        UserBL.InsertDate(date, email);
        //        lblforgotpass.Text = "Link to reset your password has been sent to you";
        //    }

        //    else
        //    {
        //        lblforgotpass.Text = "Invalid Email";
        //    }



        //}
    }
}