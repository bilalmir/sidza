using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace VirtualClassroom_final.UI
{
    public partial class ShowContent : System.Web.UI.Page
    {
        string file = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            string content = Request.QueryString["contentId"].ToString();
            file = content;
            //file = System.IO.Path.ChangeExtension(file, ".aspx");
            //string frame="<iframe src ='"+file+"' width='100%'></iframe>";
            //string embed = "<embed style='height:100%;width:100%'  src='" + file + "'>";
             string embed= "<object style='height:100%;width:100%;' data='"+file +"'></object>";
            displaycontent.InnerHtml = embed;
        }
    }
}