using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logic.BL;

namespace VirtualClassroom_final.UI
{
    public partial class ContactUs : System.Web.UI.Page
    {
        public static int i = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (i == 1)
            {
                lblresp.Text = "Thank You For Your Review.";
                i = 0;
            }
        }

        protected void btnSendMsg_Click(object sender, EventArgs e)
        {
            if (UserBL.SaveQuery(txtname.Text, txtemail.Text, txtContact.Text, txtMessage.Text))
            {
                i = 1;
                Response.Redirect(Request.RawUrl);
            }
        
        }
    }
}