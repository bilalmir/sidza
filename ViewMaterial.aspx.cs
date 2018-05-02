using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Logic.BL;
using System.Drawing;
using System.IO;
namespace VirtualClassroom_final.UI
{
    public partial class ViewMaterial : System.Web.UI.Page
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
                        if (Request.QueryString["contentid"].ToString() != null)
                        {
                            string material = Request.QueryString["contentid"].ToString();
                            string file = Server.MapPath("/Upload/pdf/") + material;
                            string embed = "<iframe id='ifrm' style='width:100%;text-align:justify,center;padding-left:10px;border-width:thin' onload='javascript:resizeIframe(this)' src='" + material + "'></iframe>";
                            ltriframe.Text = embed;
                            DataTable links = (DataTable)Session["links"];
                            grddownloadmaterial.DataSource =links;
                            grddownloadmaterial.DataBind();
                        }
                      
                }
              
            }
            catch (Exception)
            { }
        }


        /// <summary>
        /// Author : Mir Bilal    
        /// Remark : Fetch uploaded material of the teacher on the selected index of typeupload.
        /// </summary>        

        protected void ddlclass_SelectedIndexChanged(object sender, EventArgs e)
        {
            int classid = Convert.ToInt32(ddlclass.SelectedValue);
            Session["classid"] = classid;
            ddlsubject.DataSource = UserBL.FetchSubject(classid);
            ddlsubject.DataValueField = "subjectid";
            ddlsubject.DataTextField = "subjectname";
            ddlsubject.DataBind();
            ddlsubject.Items.Insert(0, new ListItem("-Select Subject-", "0"));
            ltriframe.Text = string.Empty;
            Session["links"] = null;
           
           
        }

        protected void ddlsubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            int subjectid = Convert.ToInt32(ddlsubject.SelectedValue);
            Session["subjectid"] = subjectid;
            ddllesson.DataSource = UserBL.FetchLesson(subjectid);
            ddllesson.DataValueField = "lessonid";
            ddllesson.DataTextField = "lessonname";
            ddllesson.DataBind();
            ddllesson.Items.Insert(0, new ListItem("-Select Chapter-", "0"));
            ltriframe.Text = string.Empty;
            Session["links"] = null;
          
           
        }

        protected void ddllesson_SelectedIndexChanged(object sender, EventArgs e)
        {
            int lessonid = Convert.ToInt32(ddllesson.SelectedValue);
            Session["lessonid"] = lessonid;

            int classid, subjectid;
            classid = Convert.ToInt32(Session["classid"]);
            subjectid = Convert.ToInt32(Session["subjectid"]);
            lessonid = Convert.ToInt32(Session["lessonid"]);
            grddownloadmaterial.DataSource = UserBL.Fetchmaterialdetails(classid, subjectid, lessonid, 1);
            grddownloadmaterial.DataBind();
            Session["links"] = grddownloadmaterial.DataSource;
            ltriframe.Text = string.Empty;
        }

   
      
        //protected void lnkbtnFile_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        LinkButton btnfile = sender as LinkButton;
        //        GridViewRow grdvw = (GridViewRow)btnfile.NamingContainer;
        //        Literal ltrfile = new Literal();
        //        String media = grdvw.Cells[1].Text.ToString();
        //        hdnfilename.Value = media;

        //        String title = grdvw.Cells[1].Text.ToString();
        //        title = title.Substring(12);
        //        title = title.Remove(title.Length - 4);
        //        //Session["link"] = media1;

        //        if (media != null)
        //        {
        //          //  string embed = "<iframe id='ifrm' style='width:100%;text-align:justify,center;padding-left:10px;border-width:thin' onload='javascript:resizeIframe(this)' src='" + media + "'></iframe>";
        //            string embed = "<a href='/UI/ViewMaterial.aspx?contentid=" + media + "' style='color:navy;'>" + title + "</a><br />"; 
        //            ltriframe.Text = embed;                          
        //        }
        //    }
        //    catch(Exception)
        //    {
            
        //    }
        //}

        protected void grddownloadmaterial_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {              
                string file= e.Row.Cells[1].Text.ToString();
                String media1 = e.Row.Cells[1].Text.ToString();
                media1 = media1.Substring(12);
                media1 = media1.Remove(media1.Length - 4);
               // LinkButton lnkbtn = (LinkButton)e.Row.Cells[0].FindControl("lnkbtnFile");
                Literal ltr = (Literal)e.Row.Cells[0].FindControl("ltrcontentlink");
                //lnkbtn.Text = "<a href='/UI/ViewMaterial.aspx?contentid=" + file + "' style='color:navy;'>" + media1 + "</a>";
                ltr.Text = "<a href='/UI/ViewMaterial.aspx?contentid=" + file + "' style='color:navy;font-weight:bold;'>" + media1 + "</a>";
                //lnkbtn.Text = media1;
            }
        }       

    }
}