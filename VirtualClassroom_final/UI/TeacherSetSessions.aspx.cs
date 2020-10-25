using Logic.BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VirtualClassroom_final.UI
{
    public partial class TeacherSetSessions : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["email"] != null)
                {
                    fillgrid();
                    if (Session["status"] != null)
                    {
                        string status = Session["status"].ToString();
                        lblscheduleclass.Text = status;
                    }
                }
                else
                {
                    Response.Redirect("~/UI/LogRegister.aspx");
                }
            }

        }
        protected void fillgrid()
        {
            string email = Session["email"].ToString();
            DataSet ds = UserBL.FetchScheduledClasses(email);
            grdvwShowSessions.DataSource = ds;
            grdvwShowSessions.DataBind();
        }

        protected void grdvwShowSessions_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName=="joinsession")
            {
                string link = e.CommandArgument.ToString();
                Response.Redirect("~/whiteboard/WhiteboardLaunch.aspx?u_name=bilal&roomid='" + link + "'");
                    
            }
            else if(e.CommandName=="cancel")
            {

            }
            else if (e.CommandName == "reschedule")
            {

            }

        }

        protected void grdvwShowSessions_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdvwShowSessions.PageIndex = e.NewPageIndex;
        }       

        protected void grdvwShowSessions_RowDataBound(object sender, GridViewRowEventArgs e)
        {            
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                bool flag = false;
                string newtime = string.Empty;
                DateTime validityTime;

                Label date = (Label)e.Row.Cells[0].FindControl("lblClassDate");
                Label timefrom = (Label)e.Row.Cells[0].FindControl("lbltimefrom");
                Label timeto = (Label)e.Row.Cells[0].FindControl("lbltimeto");
                LinkButton session = (LinkButton)e.Row.Cells[0].FindControl("lnkbtnjoinsession");
                Button cancel = (Button)e.Row.Cells[0].FindControl("btnCancelSession");
                Button reschedule = (Button)e.Row.Cells[0].FindControl("btnRescheduleSession");               
                
                string tDate = DateTime.Now.ToString("MM/dd/yy");
                string tdate1 = DateTime.ParseExact(tDate, "MM/dd/yy", System.Globalization.CultureInfo.InvariantCulture).ToString("MM/dd/yy",System.Globalization.CultureInfo.InvariantCulture);
                DateTime todaysDate = DateTime.ParseExact(tdate1, "MM/dd/yy", System.Globalization.CultureInfo.InvariantCulture);
                string SDate = Convert.ToDateTime(date.Text).ToString("MM/dd/yy");
                DateTime SysDate = DateTime.ParseExact(SDate,"MM/dd/yy", System.Globalization.CultureInfo.InvariantCulture);

                string time = DateTime.Now.ToString("h:mm tt");
                DateTime todaysTime = DateTime.ParseExact(time, "h:mm tt", System.Globalization.CultureInfo.InvariantCulture);
               
                string SysTime = timefrom.Text.ToString();
                DateTime scheduledtime = DateTime.ParseExact(SysTime, "h:mm tt", System.Globalization.CultureInfo.InvariantCulture);
               // DateTime validity = scheduledtime;
                
                string newFormat1 = SysDate.ToString("dd");
                string newFormat2 = SysDate.ToString("MMM");
                date.Text = newFormat1 + "<br>" + newFormat2;
                timefrom.Text += "-";

                if ((DateTime.Compare(SysDate.Date,todaysDate.Date)==0) && (todaysTime.TimeOfDay >= scheduledtime.TimeOfDay))  
                {
                    if (flag == false)
                    {
                        validityTime = scheduledtime.AddMinutes(15);
                        //validityTime = validityTime.TimeOfDay;
                        // validityTime = Convert.ToDateTime(validityTime, System.Globalization.CultureInfo.InvariantCulture);
                        flag = true;
                        session.Text = "Join Session";
                        timefrom.Visible = false;
                        timeto.Visible = false;
                        cancel.Visible = false;
                        reschedule.Visible = false;
                    }
                    else
                    {
                        
                    }
                }
                else if ((DateTime.Compare(todaysDate.Date, SysDate.Date) >= 0) && (scheduledtime.TimeOfDay > todaysTime.TimeOfDay))
                {
                    session.Text = "Expired Session";
                    timefrom.Visible = false;
                    timeto.Visible = false;
                    cancel.Visible = false;
                    reschedule.Visible = true;
                }
                else if (DateTime.Compare(todaysDate.Date, SysDate.Date) > 0)
                {
                    session.Text = "Expired Session";
                    timefrom.Visible = false;
                    timeto.Visible = false;
                    cancel.Visible = false;
                    reschedule.Visible = true;
                }
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
        //    fillgrid();
        }

        protected void lnkjoinsession_Click(object sender, EventArgs e)
        {

        }
    }
}