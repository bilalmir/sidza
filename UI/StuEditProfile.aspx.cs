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
using System.Windows.Forms;

namespace VirtualClassroom_final.UI
{
    public partial class StuEditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["email"] != null)
                {
                    DataTable Stu_dt = new DataTable();
                    string StuEmail = Session["email"].ToString();
                    Stu_dt = UserBL.FetchStudata(StuEmail);                    //fetch Student Details
                    ddlclass.DataSource = UserBL.FetchClass();                 // fetch classes for dropdown (class)
                    ddlclass.DataValueField = "classid";
                    ddlclass.DataTextField = "classname";
                    ddlclass.DataBind();
                    ddlclass.Items.Insert(0, "-Select Class-");
                    int clasid = Convert.ToInt32(Stu_dt.Rows[0].ItemArray[11].ToString());
                    txtname.Text = Stu_dt.Rows[0].ItemArray[1].ToString();
                    txtname.Focus();
                    txtBoard.Text = Stu_dt.Rows[0].ItemArray[12].ToString();                    
                    Session["chpicstatus"] = null;
                    Session["UpPicStatus"] = null;
                    lnkChangePic.Visible = false;
                    lnkRemovePic.Visible = false;
                    lnkUploadPic.Visible = true;
                    if (Stu_dt.Rows[0].ItemArray[13].ToString() != "" && Stu_dt.Rows[0].ItemArray[13].ToString() != null)
                    {
                        imgProfile.Src = Stu_dt.Rows[0].ItemArray[13].ToString();
                        Session["profileimage"] = Stu_dt.Rows[0].ItemArray[13].ToString();
                        lnkChangePic.Visible = true;
                        lnkRemovePic.Visible = true;
                        lnkUploadPic.Visible = false;
                    }
                }

                else
                {
                    Response.Redirect("~/UI/LogRegister.aspx", true);
                }

            }
            
            flechImage.Attributes["onchange"] = "ChangeFile(this)";
            FleUplImage.Attributes["onchange"] = "UploadFile(this)";           
           

        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {

                string filename = string.Empty;
                string path = string.Empty;
                string StuEmail = Session["email"].ToString();
                int classid = Convert.ToInt32(ddlclass.SelectedValue);
                if (Session["RemvPicStatus"] != null)
                {
                    File.Delete(Session["RemvpicPhyPath"].ToString());
                    Session["profileimage"] = "";
                    Session["RemvpicPhyPath"] = null;
                }
                if(Session["chpicstatus"] != null)
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
               
                    if (UserBL.UpdateStudent(txtname.Text, ContactNo.Text, classid, txtpass.Text.Trim(), txtBoard.Text.Trim(), path,StuEmail))
                    {
                       
                        StringBuilder sb = new StringBuilder();
                        // sb.Append("<img src='../img/logo.jpg' height='150' width='200' /><br/>");
                        sb.Append(" Greetings. <br/> Dear '" + txtname.Text.Trim() + "'<br/>");
                        sb.Append("Your Profile Has Been Updated Successfully.<br/>");
                        sb.Append("Please login to sidza <a href='http://www.sidza.com' target='_blank'>here</a><br/><br/><br/><br/>");
                        sb.Append("Contact us for any queries or suggestions at <b>sidza999@gmail.com</b><br/>.Best Regards<br/><a href='http://www.sidza.com'>SIDZA.COM</a><br/>");
                        sb.Append("Happy Learning!! @ sidza.com<br/>");
                        Email.SendEmail(StuEmail, "Profile Update", sb.ToString());
                        Session["email"] = StuEmail;                       
                        txtname.Text = "";
                        StuEmail= "";
                        // txtcontact.Text = "";                            
                        txtpass.Text = "";
                        Response.Redirect(Request.RawUrl);
                    }
                    else
                    {
                        if (path != "")
                        {
                            System.IO.File.Delete(path);
                        }
                        ClientScript.RegisterStartupScript(this.GetType(), "Information", "<script type='text/javascript'>alert('An error occured updating your profile.');</script>");
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
            imgProfile.Src="~/img/profile.png";
            Session["UpPicStatus"] = null;
            lnkChangePic.Visible = false;
            lnkRemovePic.Visible = false;
            lnkUploadPic.Visible = true;
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            if (Session["chpicstatus"] != null)
            {
                MessageBox.Show(Session["NewPhysicalPath"].ToString());
                File.Delete(Session["NewPhysicalPath"].ToString());
                Session["chpicstatus"] = null;
                Session["profileimage"] = Session["OldpicPhyPath"]; 
            }
            if (Session["UpPicStatus"] != null)
            { File.Delete(Session["PhysicalPath"].ToString()); Session["UpPicStatus"] = null; }
            Response.Redirect("~/UI/StudentProfile.aspx", true); 
        }
        protected void btnChangeProfilepic_Click(object sender, EventArgs e)
        {
            string last =imgProfile.Src.ToString().Substring(5);
           Session["OldvPic"]= Session["profileimage"].ToString();
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
            {File.Delete(Session["RemvpicPhyPath"].ToString()); Session["RemvPicStatus"] = null; }

            FleUplImage.SaveAs(Server.MapPath("/img/") + FleUplImage.FileName);
            imgProfile.Src = "../img/" + FleUplImage.FileName;           
          // MessageBox.Show(Server.MapPath(FleUplImage.FileName).ToString());
            Session["PhysicalPath"] = Server.MapPath("/img/") + FleUplImage.FileName.ToString();
            Session["UpPicStatus"]="true";
            Session["profileimage"] = "/img/"+ FleUplImage.FileName;
            lnkUploadPic.Visible = true;
        }

    }
}