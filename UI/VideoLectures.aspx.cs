using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Logic.BL;
using System.Drawing;
using Google.Apis.Services;
using Google.Apis.YouTube.v3;
using Google.Apis.Auth.OAuth2;
using System.IO;

namespace VirtualClassroom_final.UI
{
    public partial class VideoLectures : System.Web.UI.Page
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
            int subjectid = Convert.ToInt32(ddlsubject.SelectedValue);
            Session["subjectid"] = subjectid;
            ddllesson.DataSource = UserBL.FetchLesson(subjectid);
            ddllesson.DataValueField = "lessonid";
            ddllesson.DataTextField = "lessonname";
            ddllesson.DataBind();
            ddllesson.Items.Insert(0, new ListItem("-Select Chapter-", "0"));
        }

        protected void ddllesson_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                int lessonid = Convert.ToInt32(ddllesson.SelectedValue);
                Session["lessonid"] = lessonid;
                int classid, subjectid;
                classid = Convert.ToInt32(Session["classid"]);
                subjectid = Convert.ToInt32(Session["subjectid"]);
                lessonid = Convert.ToInt32(Session["lessonid"]);
              //  grddownloadmaterial.DataSource = UserBL.FetchVideomaterialdetails(classid, subjectid, lessonid, 1002);
               // grddownloadmaterial.DataBind();
                DataTable dsvid = UserBL.FetchVideomaterialdetails(classid, subjectid, lessonid,2);
                Accordion1.DataSource = dsvid.DefaultView;
                Accordion1.DataBind();
                h3.Visible = true;
            }            

            catch (Exception)
            {

            }
        }

 

        protected void Accordion1_ItemDataBound(object sender, AjaxControlToolkit.AccordionItemEventArgs e)
        {
            
            if (e.ItemType == AjaxControlToolkit.AccordionItemType.Content)
            {
                GridView GridView1 = (GridView)e.AccordionItem.FindControl("grdvvid");
                HiddenField hidCusType = (HiddenField)e.AccordionItem.FindControl("hdnfilename");               
                BindGrid(GridView1, hidCusType.Value);                
            } 
        }
        private void BindGrid(GridView Grid, string filetype)
        {
            DataTable dt = UserBL.fetchVideos(filetype);
            Grid.DataSource = dt;
            Grid.DataBind();
        }
        protected void grdvvid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label ltrfile = (Label)e.Row.Cells[0].FindControl("vidltr");
                String media = e.Row.Cells[1].Text.ToString();
                media = "https://www.youtube.com/embed/" + media;
                //string str = "<div class='img-responsive img-rounded' style='height:500px;width:900px;'><iframe width='100%' class='img-responsive img-rounded'  style='height:500px;'";
                //str += "src='" + media + "?&autoplay=0&allownetworking=internal'";
                //str += "frameborder='0' allowfullscreen ></iframe></div>";
                //string str = "<div class='embed-responsive-item'><iframe style='height:480px;width:880px;' class='img-responsive' ";
                //str += "src='" + media + "?&autoplay=0&allownetworking=internal'";
                //str += "frameborder='0' allowfullscreen ></iframe></div>";

                string str = "<div class='embed-responsive-item'><iframe width='950' height='534' style='display:block;max-height:100%;max-width:100%'";
                str += "src='" + media + "?&autoplay=0' frameborder='0' allowfullscreen></iframe></div>";
                ltrfile.Text = str;
            }
            
        }
        
    }
}