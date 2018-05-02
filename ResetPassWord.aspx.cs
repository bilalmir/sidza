using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Logic.BL;

namespace VirtualClassroom_final.UI
{
    public partial class ResetPassWord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                //string email = Session["email"].ToString();
                string email = Convert.ToString(Request.QueryString["mail"]);
                //   Response.Write(email);
                dt = UserBL.FetchDate(email);         // Fetch date and time of the link send to the user's email when he clicked forgot link.

                DateTime date1 = Convert.ToDateTime(dt.Rows[0][0]);  // convert returned date and time(string) to datetime type.
                DateTime newDt = date1.AddMinutes(Convert.ToDouble(dt.Rows[0]["duration"])); //add minutes to the returned time.
                if (DateTime.Now > newDt)               // checks visibility (date and time) upto which date or time the link remains visible in users email-id.
                {
                    lblmsg.Text = "Your link is expired";
                }
            }
            catch (Exception)
            {
                Response.Redirect("LogRegister.aspx");
            }
    

        }

        protected void btnsumbit_Click(object sender, EventArgs e)
        {
            try
            {
                int randomno = Convert.ToInt32(Request.QueryString["auth"]);    // catches random number send in the email-id of the user when he clicked forgot password.
              //string email = Session["email"].ToString();
                string email = Convert.ToString(Request.QueryString["mail"]);
                if (UserBL.CompareRandom(email, randomno))    // compare this random number with the random number inserted in the random field of the user in the database. 
                {
                    if (UserBL.UpdatePassword(email, randomno, txtpassword.Text)) // update old password with new password.
                    {

                        lblmsg.Text = "Password Updated Successfully";
                    }
                    else
                    {
                        lblmsg.Text = "Verify your credentials again";
                    }
                }


            }

            catch (Exception)
            {
            }
        }

    }
}