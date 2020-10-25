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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dtprivilege = new DataTable();
                FormsAuthentication.SetAuthCookie(txtloginmail.Text, true);        // set cookie for that particular user.(check the persistance of an application..
                DataTable dtuser = new DataTable();
                dtuser = UserBL.ValidateUser(txtloginmail.Text, txtloginpass.Text);
                if (dtuser.Rows.Count > 0)
                {
                    if (Convert.ToInt32(dtuser.Rows[0][3].ToString()) == 0)
                    {

                        if (Convert.ToInt32(dtuser.Rows[0][2].ToString()) == 2) //Teacher
                        {
                            int roleid = Convert.ToInt32(dtuser.Rows[0][2].ToString());
                            dtprivilege = UserBL.FetchUserPrivileges(roleid);
                            Session.Add("privilege", dtprivilege);
                            Session["email"] = dtuser.Rows[0][0].ToString();
                            Session["profileImage"] = dtuser.Rows[0][5].ToString();
                            Session["TeachSighInStatus"] = "true";
                            Session["StuSighInStatus"] = "false";
                            Session["hdnloginfo"] = txtloginmail.Text;
                            Response.Redirect("~/UI/LogRegister.aspx", false);
                        }
                        if (Convert.ToInt32(dtuser.Rows[0][2].ToString()) == 1)    //Student
                        {
                            int roleid = Convert.ToInt32(dtuser.Rows[0][2].ToString());
                            dtprivilege = UserBL.FetchUserPrivileges(roleid);
                            Session.Add("privilege", dtprivilege);
                            Session["email"] = dtuser.Rows[0][0].ToString();
                            Session["profileImage"] = dtuser.Rows[0][5].ToString();
                            Session["StuSighInStatus"] = "true";
                            Session["TeachSighInStatus"] = "false";
                            Session["hdnloginfo"] = txtloginmail.Text;
                            Response.Redirect("~/UI/LogRegister.aspx", false);
                        }
                    }
                    else if (Convert.ToInt32(dtuser.Rows[0][3].ToString()) == 1)
                    {
                        lblauthn.Text = "Authentication Failed";
                        lblmsg.Text = "You have 4 more attempts left";
                        Session.Clear();
                        Session["email"] = null;
                        Session.Abandon();
                    }

                    else if (Convert.ToInt32(dtuser.Rows[0][3].ToString()) == 2)
                    {
                        lblauthn.Text = "Authentication Failed";
                        lblmsg.Text = "You have 3 more attempt left";
                        Session.Clear();
                        Session["email"] = null;
                        Session.Abandon();
                    }

                    else if (Convert.ToInt32(dtuser.Rows[0][3].ToString()) == 3)
                    {
                        lblauthn.Text = "Authentication Failed";
                        lblmsg.Text = "You have 2 more attempt left";
                        Session.Clear();
                        Session["email"] = null;
                        Session.Abandon();
                    }

                    else if (Convert.ToInt32(dtuser.Rows[0][3].ToString()) == 4)
                    {
                        lblauthn.Text = "Authentication Failed";
                        lblmsg.Text = "You have 1 more attempt left";
                        Session.Clear();
                        Session["email"] = null;
                        Session.Abandon();
                    }

                    else
                    {
                        lblauthn.Visible = false;
                        lblmsg.Text = "Your Account is temporarily blocked";
                        lnkadmin1.Visible = true;
                        Session["email"] = txtloginmail.Text;
                        UserBL.SetLock(txtloginmail.Text);
                        Session.Clear();
                        Session["email"] = null;
                        Session.Abandon();

                    }

                }
                else
                {
                    lblmessage.Text = "Incorrect Email or Password.";
                }
            }
            catch (Exception)
            {
                //Response.Write(ex.Message);
            }
        }

        protected void btncontact_Click(object sender, EventArgs e)
        {
            try
            {
                string email = Session["email"].ToString();
                StringBuilder sb = new StringBuilder();
                // sb.Append("<img src='../img/logo.jpg' height='180' width='150' /><br>");
                sb.Append("Hi <b>Admin</b><br/>User with the following credendials" + email + "has been blocked.");
                Email.SendEmail("sidza999@gmail.com", "Blocked User", sb.ToString());
                lblmsg3.Text = "Email has been sent to admin,we will get back to you shortly...";
                lblmsg.Visible = false;
                lnkadmin1.Visible = false;
                lblauthn.Visible = false;
                Session.Clear();
                Session["email"] = null;
                Session.Abandon();
                txtloginmail.Text = "";
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception)
            { }
        }
        protected void btnforgotpass_Click(object sender, EventArgs e)
        {
            try
            {
                if (UserBL.Forgotemail(txtforgotpass.Text))
                {
                    StringBuilder sb = new StringBuilder();
                    Session["email"] = txtforgotpass.Text;
                    Guid g = Guid.NewGuid();
                    Random r = new Random();
                    int i = r.Next();
                    string email = txtforgotpass.Text;
                    UserBL.InsertRandomNumber(i, email);
                    // sb.Append("<img src='../img/logo.jpg' height='180' width='150' /><br>");
                    sb.Append(" To reset your password   <a href='http://www.sidza.com/UI/ResetPassword.aspx?auth='" + i + "' &mail='" + email + "' target='_blank'>click here</a><br/>");
                    sb.Append("Contact us for any queries or suggestions at <b>sidza999@gmail.com</b><br/>.Best Regards<br/><a href='http://www.sidza.com'>SIDZA.COM</a><br/>");
                    Email.SendEmail(txtforgotpass.Text, "Password Recovery", sb.ToString());
                    Session["Date"] = DateTime.Now.ToString();
                    string date = Session["Date"] as string;
                    UserBL.InsertDate(date, email);
                    lblmessage.Text = "Link to reset your password has been sent to you";
                    Session.Clear();
                    Session["email"] = null;
                    Session.Abandon();
                }

                else
                {
                    lblmessage.Text = "invalid Email";

                }

            }
            catch (Exception)
            { }
        }
        protected void btnReg_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/UI/Register.aspx");
        }
    }
}