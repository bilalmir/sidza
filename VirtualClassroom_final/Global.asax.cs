using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Routing;
using Logic.DL;
using System.Data;
using Logic.BL;
using System.IO;

namespace VirtualClassroom_final
{
    public class Global : System.Web.HttpApplication
    {

        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
          //  HttpContext.Current.Response.AddHeader("x-frame-options", "DENY");
            List<string> aspxFiles = Directory.GetFiles(Server.MapPath("~/"), "*.aspx", SearchOption.AllDirectories).Select(Path.GetFileName).ToList();      // fetches all aspx files along with their folders(GetFullPath)for all Elearning application

            int count = aspxFiles.Count;
            int pagecount = UserBL.getpagecount();
            if (count > pagecount)
            {
                UserBL.InsertFiles(aspxFiles);
            }
            RegisterRoutes(RouteTable.Routes);
        }
        static void RegisterRoutes(RouteCollection routes)
        {
            routes.MapPageRoute("logregister", "LogRegister", "~/UI/LogRegister.aspx");
            routes.MapPageRoute("videolectures", "VideoLectures", "~/UI/VideoLectures.aspx");
            routes.MapPageRoute("viewmaterial", "ViewMaterial", "~/UI/ViewMaterial.aspx");
            routes.MapPageRoute("syllabus", "Syllabus", "~/UI/Syllabus.aspx");
            routes.MapPageRoute("StudyMaterial", "studymaterial", "~/UI/studymaterial.aspx");
        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown
           
        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs
            

        }

        void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started

        }

        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends. 
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer 
            // or SQLServer, the event is not raised.

        }

    }
}
