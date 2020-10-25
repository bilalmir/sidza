using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace VirtualClassroom_final
{
    public class Base : System.Web.UI.Page
    {
        protected string Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string url = System.Web.HttpContext.Current.Request.FilePath;
                url = url.Remove(0, 4);
                if (Session["privilege"] != null)
                {
                    DataTable userPrivileges = (DataTable)Session["privilege"];

                    if (userPrivileges != null)
                    {
                        for (int i = 0; i < userPrivileges.Rows.Count; i++)
                        {

                            if (userPrivileges.Rows[i]["pagename"].ToString() == url)    // checks if pagename matches with the url....
                            {
                                Response.RedirectLocation = url;
                                return url;
                            }
                        }
                        return null;
                    }
                }
                else
                {
                    Response.RedirectLocation = "~/UI/LogRegister.aspx";
                }
            }
            return null;
        }
    }
}