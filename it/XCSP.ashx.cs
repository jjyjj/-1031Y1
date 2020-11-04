using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace MarketInfo.it
{
    /// <summary>
    /// XCSP 的摘要说明
    /// </summary>
    public class XCSP : IHttpHandler, IRequiresSessionState
    {
        public void ProcessRequest(HttpContext context)
        {
            string result = "操作失败";
            try
            {

                string strsql = "UPDATE dbo.T_xuan_chuan_zou_fang set sp" + context.Request.Form["sp"] + "='" +
                    context.Request.Form["TYPE"] + "' ,spid" + context.Request.Form["sp"] + "='" + context.Session["CUR_TID"] +
                    "',reason" + context.Request.Form["sp"] + "='" + context.Request.Form["Name"] + "'  where id='" + context.Request.Form["ID"] + "'";
                if (context.Request.Form["TYPE"] == "-1")
                {
                    strsql = "UPDATE dbo.T_xuan_chuan_zou_fang set sp" + context.Request.Form["sp"] + "='" + context.Request.Form["TYPE"] + "' ,spid" + context.Request.Form["sp"] + "='" +
                        context.Session["CUR_TID"] + "',reason" + context.Request.Form["sp"] + "='" + context.Request.Form["Name"] +
                        "',flag='0'  where id='" + context.Request.Form["ID"] + "'";
                }
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