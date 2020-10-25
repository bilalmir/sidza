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
    public partial class TeacherEditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["email"] != null)
                {
                    DataSet dt = new DataSet();
                    string teacherEmail = Session["email"].ToString();
                    dt = UserBL.FetchTeacherFullProfileUsingEmail(teacherEmail);
                    txtname.Text = dt.Tables[0].Rows[0].ItemArray[1].ToString();
                    txtsubject.Text = dt.Tables[0].Rows[0].ItemArray[4].ToString();
                    ContactNo.Text = dt.Tables[0].Rows[0].ItemArray[3].ToString();
                    txtaddress.Text = dt.Tables[0].Rows[0].ItemArray[9].ToString();
                    string path = dt.Tables[0].Rows[0].ItemArray[5].ToString();
                    txtqualification.Text = dt.Tables[0].Rows[0].ItemArray[6].ToString();
                    // Session["RemvPicStatus"] = null;
                    Session["chpicstatus"] = null;
                    Session["UpPicStatus"] = null;
                    lnkChangePic.Visible = false;
                    lnkRemovePic.Visible = false;
                    lnkUploadPic.Visible = true;

                    if (path != "")
                    {
                        imgProfile.Src = path;
                        Session["profileimage"] = dt.Tables[0].Rows[0].ItemArray[5].ToString();
                        lnkChangePic.Visible = true;
                        lnkRemovePic.Visible = true;
                        lnkUploadPic.Visible = false;
                    }


                }
                else
                {
                    Response.Redirect("~/UI/LogRegister.aspx", false);
                }
                flechImage.Attributes["onchange"] = "ChangeFile(this)";
                FleUplImage.Attributes["onchange"] = "UploadFile(this)";
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                string filename = string.Empty;
                string path = string.Empty;
                string teacherEmail = Session["email"].ToString();
                if (Session["RemvPicStatus"] != null)
                {
                    File.Delete(Session["RemvpicPhyPath"].ToString());
                    Session["profileimage"] = "";
                    Session["RemvpicPhyPath"] = null;
                }
                if (Session["chpicstatus"] != null)
                {
                    File.Delete(Session["OldpicPhyPath"].ToString());
                    Session["chpicstatus"] = null;
                }
                if (Session["UpPicStatus"] != null)
                {
                    Session["UpPicStatus"] = null;
                }
                if (Session["profileImage"].ToString() != null && Session["profileimage"].ToString() != "")
                {
                    path = Session["profileimage"].ToString();
                }
                else
                {
                    path = "";
                }

                if (UserBL.UpdateTeacherProfile(txtname.Text, ContactNo.Text, txtpass.Text.Trim(), txtqualification.Text.Trim(), txtaddress.Text.Trim(), txtsubject.Text.Trim(), path, teacherEmail))
                {
                    //try
                    //{
                    //    StringBuilder sb = new StringBuilder();
                    //    // sb.Append("<img src='../img/logo.jpg' height='150' width='200' /><br/>");
                    //    sb.Append(" Greetings. <br/> Dear '" + txtname.Text.Trim() + "'<br/>");
                    //    sb.Append("Your Profile Has Been Updated Successfully.<br/>");
                    //    sb.Append("Please login to sidza <a href='http://www.sidza.com' target='_blank'>here</a><br/><br/><br/><br/>");
                    //    sb.Append("Contact us for any queries or suggestions at <b>sidza999@gmail.com</b><br/>.Best Regards<br/><a href='http://www.sidza.com'>SIDZA.COM</a><br/>");
                    //    sb.Append("Happy Tutoring!! @ sidza.com<br/>");
                    //    Email.SendEmail(teacherEmail, "Profile Update", sb.ToString());
                    //    Session["email"] = teacherEmail;
                    //    txtname.Text = "";
                    //    teacherEmail = "";
                    //    txtpass.Text = "";
                    //}
                    //catch { }
                    ClientScript.RegisterStartupScript(this.GetType(), "Information", "<script type='text/javascript'>alert('Profile updated successfully.');</script>");
                    Response.Redirect("~/UI/MyTeacherProfile.aspx");
                }
                else
                {
                    if (path != "")
                    {
                        System.IO.File.Delete(path);
                    }
                    ClientScript.RegisterStartupScript(this.GetType(), "Information", "<script type='text/javascript'>alert('An error occured while updating your profile.');</script>");
                }

            }
            catch (Exception)
            {
                // throw ex;
            }
        }
        protected void RemoveProfilepic_Click(object sender, EventArgs e)
        {
            string last = Session["profileimage"].ToString().Substring(5);
            Session["RemvpicPhyPath"] = Server.MapPath("/img/") + last;
            Session["RemvPicStatus"] = "true";
            imgProfile.Src = "~/img/profile.png";
            Session["UpPicStatus"] = null;
            lnkChangePic.Visible = false;
            lnkRemovePic.Visible = false;
            lnkUploadPic.Visible = true;
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            if (Session["chpicstatus"] != null)
            {

                File.Delete(Session["NewPhysicalPath"].ToString());
                Session["chpicstatus"] = null;
                Session["profileimage"] = Session["OldpicPhyPath"];
            }
            if (Session["UpPicStatus"] != null)
            {
                File.Delete(Session["PhysicalPath"].ToString());
                Session["UpPicStatus"] = null;
            }
            Response.Redirect("MyTeacherProfile.aspx");
        }
        protected void btnChangeProfilepic_Click(object sender, EventArgs e)
        {
            string last = imgProfile.Src.ToString().Substring(5);
            Session["OldvPic"] = Session["profileimage"].ToString();
            flechImage.SaveAs(Server.MapPath("/img/") + flechImage.FileName);
            imgProfile.Src = "/img/" + flechImage.FileName;
            Session["NewPhysicalPath"] = Server.MapPath("/img/") + flechImage.FileName.ToString();
            Session["chpicstatus"] = "true";
            Session["OldpicPhyPath"] = Server.MapPath("/img/") + last;
            Session["profileimage"] = "/img/" + flechImage.FileName;

        }
        protected void UploadProfilepic_Click(object sender, EventArgs e)
        {
            if (Session["RemvPicStatus"] != null)
            {
                File.Delete(Session["RemvpicPhyPath"].ToString());
                Session["RemvPicStatus"] = null;
            }
            FleUplImage.SaveAs(Server.MapPath("/img/") + FleUplImage.FileName);
            imgProfile.Src = "../img/" + FleUplImage.FileName;
            Session["PhysicalPath"] = Server.MapPath("/img/") + FleUplImage.FileName.ToString();
            Session["UpPicStatus"] = "true";
            Session["profileimage"] = "/img/" + FleUplImage.FileName;
            lnkUploadPic.Visible = true;
        }
    }
}