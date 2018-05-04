using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Logic.BL;
using System.Drawing;
namespace VirtualClassroom_final.UI
{
    public partial class Syllabus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    ddlclass.DataSource = UserBL.FetchClass();                 // fetch classes for dropdown (class)
                    ddlclass.DataValueField = "classid";
                    ddlclass.DataTextField = "classname";

                    ddlclass.DataBind();
                    ddlclass.Items.Insert(0, new ListItem("-Select Class-", "0"));
                }
                //foreach (GridViewRow row in grddownloadmaterial.Rows)
                //{
                //    row.BackColor = Color.Green;
                //}
            }
            catch (Exception)
            { }
        }
        protected void ddlclass_SelectedIndexChanged(object sender, EventArgs e)
        {
            int classid = Convert.ToInt32(ddlclass.SelectedValue);
            Session["classid"] = classid;
            ddlsubject.DataSource = UserBL.FetchSubject(classid);
            ddlsubject.DataValueField = "subjectid";
            ddlsubject.DataTextField = "subjectname";

            ddlsubject.DataBind();
            ddlsubject.Items.Insert(0, new ListItem("-Select Subject-", "0"));

        }

        protected void ddlsubject_SelectedIndexChanged(object sender, EventArgs e)
        {
           try
            {
                if (Session["email"] != null)
                {

                    int subjectid = Convert.ToInt32(ddlsubject.SelectedValue);
                    Session["subjectid"] = subjectid;
                    int classid = Convert.ToInt32(Session["classid"]);

                    grddownloadmaterial.DataSource = UserBL.FetchFetchSyllabus(classid, subjectid, 3);
                    grddownloadmaterial.DataBind();
                }
                else
                {
                    Session["pageredirect"] = "Please Login/Register to download Content";
                    Response.Redirect("~/UI/LogRegister.aspx");

                }
            }
           catch (Exception)
           { }
        }

        protected void grddownloadmaterial_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Literal ltrfile = (Literal)e.Row.Cells[0].FindControl("ltrFilename");
                ltrfile.Text = ltrfile.Text.Substring(17);
                ltrfile.Text = ltrfile.Text.Remove(ltrfile.Text.Length - 4);

                string filename = e.Row.Cells[3].Text.ToString();
                Literal ltr = (Literal)e.Row.Cells[2].FindControl("ltr");
                ltr.Text = "<a href='"+ filename +"' align='center' target='_Blank'><img src='../img/download1.jpg' Width='25' Height='25'></a>";
               
            }
        }

        protected void lnkbtnFile_Click(object sender, EventArgs e)
        {
            LinkButton btnfile = sender as LinkButton;
            GridViewRow grdvw = (GridViewRow)btnfile.NamingContainer;
            Literal ltrfile = new Literal();
            String media = grdvw.Cells[3].Text.ToString();
            if (media.EndsWith(".pdf"))
            {
                string embed = "<embed width='1100'  height='600' src='" + media + "#toolbar=0'>";
                //ltrfile.Text = embed;
                showpdf.Visible = true;
                string str = "<div id='popDiv' class='ontop'><table id='popup'>";
                str += "<tr><td>";
                str += "<span class='label label-info' style='color:white;'>Press escape to return</span></td></tr>";
                str += "<tr><td>";
                str += embed;
                str += "</td></tr>";
                str += "</table></div>";
                showpdf.InnerHtml = str;
                //</div>'" + embed + "'</div>";
                //plchldrControl.Controls.Add(ltrfile);
                //plchldrControl.Visible = true;
            }
        }
        protected void btndownload_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                if (Session["email"] != null)
                {
                    ImageButton btndownload = sender as ImageButton;
                    GridViewRow gvrow = (GridViewRow)btndownload.NamingContainer;
                    string filename = gvrow.Cells[2].Text.ToString();
                    string filepath = Server.MapPath(filename);
                    System.IO.FileInfo file = new System.IO.FileInfo(filepath);
                    if ((file.Exists))
                    {
                        Response.Redirect(filename, true);                       
                        file = null;
                    }
                    else
                    {
                        Response.Write("This file does not exist.");
                    }
                }
                else
                {
                    Session["pageredirect"] = "Please Login/Register to download Content";
                    Response.Redirect("~/UI/LogRegister.aspx");

                }
            }
            catch (Exception)
            { }

        }
    }
}