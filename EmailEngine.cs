using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Configuration;
namespace ShoppingCart1
{
    public static class EmailEngine
    {
        public static void SendEmail(string recepientEmail,string subject,string body)
        {
            using(MailMessage objMailMessage=new MailMessage())
            {
                objMailMessage.From = new MailAddress(ConfigurationManager.AppSettings["UserName"]);
                objMailMessage.Subject = subject;
                objMailMessage.Body = body;
                objMailMessage.IsBodyHtml = true;
                objMailMessage.To.Add(new MailAddress(recepientEmail));
                SmtpClient smtp = new SmtpClient();
                smtp.Host = ConfigurationManager.AppSettings["Host"];
                smtp.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);
                System.Net.NetworkCredential Networkcred = new System.Net.NetworkCredential();
                Networkcred.UserName = ConfigurationManager.AppSettings["UserName"];
                Networkcred.Password = ConfigurationManager.AppSettings["Password"];
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = Networkcred;
                smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
                smtp.Send(objMailMessage);
            }
        }
    }
}