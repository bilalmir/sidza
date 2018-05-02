using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VirtualClassroom_final.UI
{
    public partial class Articles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string article = Request.QueryString["artid"].ToString();
            string file = Server.MapPath("/Upload/Articles/") + article;
            string title = article.Remove(0, 17);
            lnkinfo.InnerText = title;
            string embed = "<iframe id='ifrm' style='width:100%;padding-left:5px;' onload='javascript:resizeIframe(this)' src='" + article + "'></iframe>";
            showpdf.InnerHtml = embed;
        }
    }
}