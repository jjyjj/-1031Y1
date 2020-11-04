using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketInfo.it.jjy
{
    /// <summary>
    /// Tj 的摘要说明
    /// </summary>
    public class Tj : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string result = "保存失败";
            int tId = Int32.Parse(context.Request.Params["T_WID"]);
            string StrSql = "UPDATE  T_WORK_INFO1 SET T_FLAG = 1 WHERE T_WID = " + tId;
            try
            {
                int res = WXDBUtility.SqlHelper.ExecuteSql(StrSql);
                if (res > 0)
                {
                    result = "0";
                }
            }
            catch (Exception ex)
            {
                result = ex.Message;
            }

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