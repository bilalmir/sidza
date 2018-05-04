using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Text;
using System.Net.Mail;
using System.Windows.Forms;
using System.Net;
using System.Web;
using Logic.BL;


namespace Logic.BL
{
    public class Email
    {
        public static void SendEmail(string recipient, string subject, string body)
        {
            try
            {
                
                //MailMessage message = new MailMessage();
                //SmtpClient client = new SmtpClient();
                //message.From = new MailAddress("sidza.edu@sidza.com");
                //message.To.Add(new MailAddress(recipient));
                //message.Subject = subject;
                //message.Body = body;             
                //client.Send(message);
                MailMessage message = new MailMessage();
                SmtpClient client = new SmtpClient();
                System.Net.Mime.ContentType mimeType = new System.Net.Mime.ContentType("text/html");
                // Decode the html in the txtBody TextBox...    
                string body1 = HttpUtility.HtmlDecode(body);
                AlternateView alternate = AlternateView.CreateAlternateViewFromString(body1, mimeType);
                message.AlternateViews.Add(alternate);
                //message.From = new MailAddress("sidza.edu@sidza.com");
                message.From = new MailAddress("sidza.edu@sidza.com","Sidza-An Online Educational Platform");
                message.To.Add(new MailAddress(recipient));
                message.Subject = subject;
                message.IsBodyHtml = true;
                message.Priority = MailPriority.High;               
                message.Body = body;
                //client.EnableSsl = true;
                client.Send(message);

                //Logging
                CreateLog.CreateLogFiles();
                CreateLog err = new CreateLog();
                err.ErrorLog(HttpContext.Current.Server.MapPath("/Logs/ErrorLog.txt"), "Email send");
            }
            catch (Exception ex)
            {
                CreateLog.CreateLogFiles();
                CreateLog err = new CreateLog();
                err.ErrorLog(HttpContext.Current.Server.MapPath("/Logs/ErrorLog.txt"), ex.Message);
                
            }
        }
    }
}