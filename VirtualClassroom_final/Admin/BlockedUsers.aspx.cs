using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logic.BL;
using System.Text;
using System.Data;

namespace VirtualClassroom_final.UI
{
    public partial class BlockedUsers : System.Web.UI.Page
    {
        public static string show = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["adminemail"] != null)
                {
                    if (show == "Delete")
                    {
                        lblmessage.Text = "User Unblocked Successfully !!";
                        show = string.Empty;
                    }
                    DataTable dt = new DataTable();
                    dt = UserBL.FetchBlockedUsers();
                    if (dt.Rows.Count > 0)
                    {
                        Btncounter.Visible = true;
                        Btncounter.Text = dt.Rows.Count.ToString();
                        //lnkblocked.Attributes["style"] = "background:yellow";
                        Btncounter.Attributes["style"] = "background:red";
                    }
                }
                else
                {
                    Response.Redirect("~/Admin/AdminLogin.aspx", true);
                }
                if (!IsPostBack)
                {
                    showgrid();

                }
            }
            catch (Exception)
            { }
        }

        protected void GridView3_RowEditing(object sender, GridViewEditEventArgs e)
        {

            GridView3.EditIndex = e.NewEditIndex;
            showgrid();
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Fetch all blocked users visible to the admin
        /// </summary>
        public void showgrid()
        {
            GridView3.DataSource = UserBL.FetchBlockedUsers();
            GridView3.DataBind();
        }

        protected void GridView3_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                Guid g = Guid.NewGuid();
                Random r = new Random();                     // Admin generates an random number
                int i = r.Next();

                Label lblemail = GridView3.Rows[e.RowIndex].FindControl("lblemail") as Label;      // Gives index of email field in the grid.   
                string email = lblemail.Text;                                                      // put data of that index in the variable. 

                string id = GridView3.DataKeys[e.RowIndex].Value.ToString();                        // Gives index of primary key (id) in the grid.
                int ide = Convert.ToInt32(id);                                                      // converts id to int .

                TextBox tb = GridView3.Rows[e.RowIndex].FindControl("txtlock") as TextBox;          // Gives index of lock field in the grid.
                string tb1 = Convert.ToString(tb);
                int tb2;

                int.TryParse(tb1, out tb2);// converts data of textbox limit to int 
                UserBL.InsertRandomIntoPassWord(i, email, ide);            // Function to put random number (i) in the password field of that particular user. 
                if (UserBL.UpdateBlockedUsers(ide, tb2, email))             // Function to update the lock of particular user. Also update his limit field to zero .               
                {
                    show = "Update";
                }

                StringBuilder sb = new StringBuilder();               // creates a string and sends it to blocked user along with the random number(i) as a password which he can use to login.
                //sb.Append("<img src='../img/logo.jpg' height='180' width='150' /><br>");
                sb.Append("Dear User! <br/>Kindly login with this new password : " + i + "<br/> After  login you must reset your password " + " <a href='http://www.sidza.com' target='_blank'>click here</a><br/>");
                sb.Append("Contact us for any queries or suggestions at <b>sidza999@gmail.com</b><br/>.Best Regards<br/><a href='http://www.sidza.com'>SIDZA.COM</a><br/>");
                Email.SendEmail(email, "User Unblocked", sb.ToString());        // Function to send mail to the blocked user.

                //   GridView3.EditIndex = -1;
                showgrid();
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception)
            { }
        }

        protected void GridView3_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            GridView3.EditIndex = -1;
            
        }

    }
}