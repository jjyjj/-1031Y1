using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketInfo.it.jjy
{
    /// <summary>
    /// update 的摘要说明
    /// </summary>
    public class update : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int tId = Int32.Parse(context.Request.Params["T_WID"]);
            string sql = "UPDATE T_WORK_INFO1 SET T_WORK_INFO1.T_FLAG = 3 WHERE T_WORK_INFO1.T_WID = " + tId;
            var result = WXDBUtility.SqlHelper.ExecuteSql(sql) > 0 ? 0 : 1;
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