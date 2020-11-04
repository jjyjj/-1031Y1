using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace MarketInfo.it
{
    /// <summary>
    /// SPJKSP 的摘要说明
    /// </summary>
    public class SPJKSP : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string result = "操作失败";
            try
            {
                string strsql = "UPDATE t_shipinjiankong set sp" + context.Request.Form["sp"] + "='" + context.Request.Form["TYPE"] + "' ,spid" + context.Request.Form["sp"] + "='"
                    + context.Session["CUR_TID"] + "',flag='0',reason" + context.Request.Form["sp"] + "='" + context.Request.Form["Name"]
                    + "'  where s_id='" + context.Request.Form["ID"] + "'";
                int res = WXDBUtility.SqlHelper.ExecuteSql(strsql);
                if (res > 0)
                {
                    result = "0";
                }
            }
            catch (Exception ex)
            {
                result = ex.Message;
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