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
    public partial class Priviliges : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dtrole = new DataTable();
                ddlrole.DataSource = UserBL.FetchAllRoles();
                ddlrole.DataValueField = "roleid";
                ddlrole.DataTextField = "rolename";
                ddlrole.DataBind();
                ddlrole.Items.Insert(0, new ListItem("-select--", "0"));

                grdpages.DataSource = UserBL.getpages();
                grdpages.DataBind();

            }
        }


        protected void btnAddPrivileges_Click(object sender, EventArgs e)
        {
            try
            {
                int roleid = Convert.ToInt32(ddlrole.SelectedValue.ToString());
                for (int i = 0; i < grdpages.Rows.Count; i++)
                {
                    GridViewRow row = grdpages.Rows[i];
                    bool isChecked = ((CheckBox)row.FindControl("chkpage")).Checked;


                    if (isChecked)
                    {
                        string filePath = grdpages.Rows[i].Cells[0].Text.ToString();
                        if (UserBL.addprivileges(filePath, roleid))
                        {

                            lblchk.Text = "Priviliges assigned sucessful";
                        }

                    }
                }
            }
            catch (Exception)
            { }
        }

        protected void ddlrole_SelectedIndexChanged(object sender, EventArgs e)
        {
            grdpages.Visible = true;
            btnAddPrivileges.Visible = true;
        }

    }
}