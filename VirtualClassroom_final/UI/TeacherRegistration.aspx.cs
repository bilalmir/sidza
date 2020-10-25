using Logic.BL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VirtualClassroom_final.UI
{
    public partial class TeacherRegistration : System.Web.UI.Page
    {
        Boolean DeleteStatus;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                drpTutorSubject.DataSource = UserBL.FetchTutorSubject();                // fetch classes for dropdown (class)
                drpTutorSubject.DataValueField = "t_subjectid";
                drpTutorSubject.DataTextField = "t_subjectname";
                drpTutorSubject.DataBind();
                drpTutorSubject.Items.Insert(0, new ListItem("-Select Subject-", "0"));
            }

            flupImage.Attributes["onchange"] = "UploadFile(this)";
        }
        protected void btnregister_Click(object sender, EventArgs e)
        {
            try
            {
                string filename = string.Empty;
                string path = string.Empty;
                string name = txtname.Text.Trim();
                string email = txtemail.Text.Trim();
                string password = txtpass.Text.Trim();
                Int64 contact = Int64.Parse(txtContact.Text);
                string subject = drpTutorSubject.SelectedItem.ToString();
                string qualification1 = txtQualification1.Text.Trim();
                string qualification2 = txtQualification2.Text.Trim();
                string qualification3 = txtQualification3.Text.Trim();
                string address = txtaddress.Text.Trim();
                if (Session["profileimage"] != null)
                {
                    path = Session["profileimage"].ToString();
                }
                else
                {
                    path = "";
                }
                if (UserBL.Fetchemail(txtemail.Text))
                {

                    if (UserBL.RegisterTeacher(name, email, contact, subject, qualification1, qualification2, qualification3, password, path,address))
                    {
                        DeleteStatus = false;
                        StringBuilder sb = new StringBuilder();
                        //sb.Append("<img src='../img/logo.jpg' height='180' width='150' /><br>");
                        sb.Append("Dear '" + txtname.Text.Trim() + "'<br/>");
                        sb.Append("Thank you for registering at <a href='http://www.sidza.com'>SIDZA.COM</a>.<br/>Your Login details are as follows : <br/>");
                        sb.Append("<b>email address: '" + txtemail.Text);
                        sb.Append("Password: '" + txtpass.Text + "'</b><br/><br/><br/>");
                        sb.Append("Please login to sidza<a href='http://www.sidza.com' target='_blank'>here</a><br/><br/><br/><br/>");
                        sb.Append("Contact us for any queries or suggestions at <b>sidza999@gmail.com</b><br/>.Best Regards<br/><a href='http://www.sidza.com'>SIDZA.COM</a><br/>");
                        sb.Append("Happy Tutoring!! @ sidza.com<br/>");
                        Email.SendEmail(txtemail.Text, "Teacher Registration", sb.ToString());
                        Session["email"] = txtemail.Text;
                        txtname.Text = "";
                        txtemail.Text = "";
                        txtContact.Text = "";
                        txtpass.Text = "";
                        Response.Redirect("~/UI/RegistrationStatus.aspx");
                    }
                    else
                    {
                        if (path != "")
                        {
                            System.IO.File.Delete(path);
                        }
                        ClientScript.RegisterStartupScript(this.GetType(), "Information", "<script type='text/javascript'>alert('An error occured while registration.');</script>");
                    }

                }
                else
                {
                   
                    if (path != "")
                    {
                       System.IO.File.Delete(path);
                    }
                    ClientScript.RegisterStartupScript(this.GetType(), "Information", "<script type='text/javascript'>alert('Email already in use. Please try a different one');</script>");
                }
            }
            catch (Exception)
            {
                //throw ex;
            }
        }



        protected void btnUploadProfilepic_Click(object sender, EventArgs e)
        {
            // string path = flupImage.FileName;
            flupImage.SaveAs(Server.MapPath("/Upload/Profile pics/") + flupImage.FileName);
            imgProfile.Src = "/img/" + flupImage.FileName;
            Session["profileimage"] = "/Upload/Profile pics/" + flupImage.FileName;
            DeleteStatus = true;
        }
        protected void Page_UnLoad(object sender,EventArgs e)
        {
            try
            {

                if (DeleteStatus == true)
                {
                    System.IO.File.Delete(Session["profileimage"].ToString());
                }
            }
            catch (Exception) { }
        }
    }
}