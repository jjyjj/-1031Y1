using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace MarketInfo.it
{
    /// <summary>
    /// GHGSP 的摘要说明
    /// </summary>
    public class GHGSP : IHttpHandler,IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string result;


            String strsql = "";
            if (context.Request.Form["TYPE"] == "-1")
            {
                strsql = "UPDATE dbo.t_ghgq_info set sp" + context.Request.Form["sp"] + "='" + context.Request.Form["TYPE"] + "' ,sprid" + context.Request.Form["sp"] + "='" + context.Session["CUR_TID"] + "',reason" + context.Request.Form["sp"] + "='" + context.Request.Form["Reason"] + "',setTime='" + DateTime.Now.ToLocalTime() + "',flag='0'  where g_id='" + context.Request.Form["ID"] + "'";
            }
            else
            {
                strsql = "UPDATE dbo.t_ghgq_info set sp" + context.Request.Form["sp"] + "='" + context.Request.Form["TYPE"] + "' ,sprid" + context.Request.Form["sp"] + "='" + context.Session["CUR_TID"] + "',reason" + context.Request.Form["sp"] + "='" + context.Request.Form["Reason"] + "',setTime='" + DateTime.Now.ToLocalTime() + "'  where g_id='" + context.Request.Form["ID"] + "'";
            }

           // String strsql = "UPDATE t_ghgq_info set sp" + context.Request.Form["sp"] + "='" + context.Request.Form["TYPE"] + "' ,sprid" + context.Request.Form["sp"] + "='" + context.Session["CUR_TID"] + "'  where g_id='" + context.Request.Form["ID"] + "'";
            int res = WXDBUtility.SqlHelper.ExecuteSql(strsql);
            if (res > 0)
            {
                result = "1";
            }
            else
            {
                result = "-1";
            }
            context.Response.ContentType = "text/plain";
            context.Response.Write(result);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}