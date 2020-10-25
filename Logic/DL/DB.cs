using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace Logic.DL
{
    public class DB
    {
        public static string GetConnection()
        {
            return ConfigurationManager.AppSettings["conStr"];
        }
    }
}