using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketInfo.it.jjy
{
    /// <summary>
    /// getXiuJiaInfo 的摘要说明
    /// </summary>
    public class getXiuJiaInfo : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int tId = Int32.Parse(context.Request.Params["T_WID"]);
            string sql = "SELECT * FROM T_WORK_INFO1 ,T_USER_INFO WHERE  T_USER_INFO.T_ID=T_WORK_INFO1.T_ID AND T_WID= " + tId;
            var dt = WXDBUtility.SqlHelper.GetDataTable(sql);
            string StrJson = WXDBUtility.JsonHelper.DataTableToJson(dt);



            context.Response.ContentType = "json";
            context.Response.Write(StrJson);
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