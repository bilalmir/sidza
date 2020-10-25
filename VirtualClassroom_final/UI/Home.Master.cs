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
using Newtonsoft;
using Newtonsoft.Json;
using log4net;
namespace VirtualClassroom_final.UI
{
    public partial class Home : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetNoStore();
            Response.ClearHeaders();
            Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
            Response.AddHeader("Pragma", "no-cache");

            //Session["email"] = txtmail.Text; //forgot password mail
            if (!IsPostBack)
            {
                try
                {
                    if (Session["email"] != null)
                    {
                        if (Session["StuSighInStatus"].ToString() == "true")
                        {
                            lnkMyteacher.Visible = true;
                            lnkMyProfile.Visible = true;
                            ProfileLink.Visible = true;
                            lnkStudentSessions.Visible = true;
                            lnkMyProfile.HRef = "StudentProfile.aspx";
                            //lblloginStatus.Text = "Hi! " + Session["email"].ToString();

                        }
                        else if (Session["TeachSighInStatus"].ToString() == "true")
                        {
                            ProfileLink.Visible = true;
                            lnkvideolectures.Visible = false;
                            lnkmaterial.Visible = false;
                            lnkExam.Visible = false;
                            lnkOnlineTutors.Visible = false;
                            lnkTeacherSession.Visible = true;
                            lnkmystudents.Visible = true;
                            lnkMyProfile.HRef = "MyTeacherProfile.aspx";
                        }
                        imgProfile.Src = Session["profileImage"].ToString();
                        if (imgProfile.Src == "")
                        {
                            imgProfile.Src = "../img/profile.png";
                        }
                        if (!string.IsNullOrEmpty(Session["hdnloginfo"].ToString()))
                            hdnloginfo.Value = Session["hdnloginfo"].ToString();

                        //lnklogout.Visible = true;
                        lnklogin.Visible = false;
                       
                    }

                    if (Session["pageredirect"] != null && Session["email"] == null)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Information", "<script type='text/javascript'>alert('You need to Login/Register first.');</script>");
                    }
                    Session["pageredirect"] = null;
                }
                catch (Exception) { }
            }
        }

      

       

      
        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session["email"] = null;
            Session["pageredirect"] = null;
            Session.Abandon();
            Response.Redirect("~/UI/LogRegister.aspx", true);

        }

       
    }
}