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
using System.Web.UI.HtmlControls;

namespace VirtualClassroom_final.UI
{
    public partial class LogRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetNoStore();
            if (!IsPostBack)
            {
                DataTable NewArticle = UserBL.FetchArticle();
                if (NewArticle.Rows.Count > 0)
                {
                    for (int i = 0; i < NewArticle.Rows.Count; i++)
                    {
                        Literal ltr = new Literal();
                        string str;
                        string filename = NewArticle.Rows[i][4].ToString();
                        string title = NewArticle.Rows[i][2].ToString();
                        title = title.Remove(title.Length - 4);
                        int typeid = Convert.ToInt32(NewArticle.Rows[i][1]);
                        string status = NewArticle.Rows[i][6].ToString();
                        
                        if (typeid == 2)
                        {                          
                            str = "<img src='../img/new1.gif' />&nbsp;<a href='/UI/Articles.aspx?artid=" + filename + "' style='color:navy;'>" + title + "</a><br />";                                                         
                            ltr.Text = str;
                            pnllatestnews.Controls.Add(ltr);
                        }
                        else
                        {                          
                            str = "<img src='../img/new1.gif' />&nbsp;<a href='/UI/Articles.aspx?artid=" + filename + "' style='color:navy;'>" + title + "</a><br />";                       
                            ltr.Text = str;
                            pnlarticles.Controls.Add(ltr);
                        }


                    }
                }

            }

        }
    }
}