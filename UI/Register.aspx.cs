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
    public partial class Register : System.Web.UI.Page
    {
        Boolean DeleteStatus;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.ClearHeaders();
            //Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
            //Response.AddHeader("Pragma", "no-cache");
            if (!IsPostBack)
            {
                ddlclass.DataSource = UserBL.FetchClass();                 // fetch classes for dropdown (class)
                ddlclass.DataValueField = "classid";
                ddlclass.DataTextField = "classname";

                ddlclass.DataBind();
                ddlclass.Items.Insert(0, new ListItem("-Select Class-", "0"));
               
            }
            flupImage.Attributes["onchange"] = "UploadFile(this)";          
         
        }
        protected void btnregister_Click(object sender, EventArgs e)
        {
            try
            {
                        
                string filename = string.Empty;
                string path = string.Empty;
                int classid = Convert.ToInt32(ddlclass.SelectedValue);
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
                        if (UserBL.RegisterStudent(txtname.Text, txtemail.Text, classid, txtpass.Text.Trim(), txtBoard.Text.Trim(), path))
                        {
                            DeleteStatus = true;
                            StringBuilder sb = new StringBuilder();
                            // sb.Append("<img src='../img/logo.jpg' height='150' width='200' /><br/>");
                            sb.Append("Dear '" + txtname.Text.Trim() + "'<br/>");
                            sb.Append("Thank you for registering at <a href='http://www.sidza.com'>SIDZA.COM</a>.<br/>Your Login details are as follows : <br/>");
                            sb.Append("<b>email address: '" + txtemail.Text);
                            sb.Append("Password: '" + txtpass.Text + "'</b><br/><br/><br/>");
                            sb.Append("Please login to sidza<a href='http://www.sidza.com' target='_blank'>here</a><br/><br/><br/><br/>");
                            sb.Append("Contact us for any queries or suggestions at <b>sidza999@gmail.com</b><br/>.Best Regards<br/><a href='http://www.sidza.com'>SIDZA.COM</a><br/>");
                            sb.Append("Happy Learning!! @ sidza.com<br/>");
                            Email.SendEmail(txtemail.Text, "Student Registration", sb.ToString());
                            Session["email"] = txtemail.Text;
                            txtname.Text = "";
                            txtemail.Text = "";
                            // txtcontact.Text = "";                            
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
               // throw ex;
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