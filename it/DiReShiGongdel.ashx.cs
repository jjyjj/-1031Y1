using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketInfo.it
{
    /// <summary>
    /// DiReShiGongdel 的摘要说明
    /// </summary>
    public class DiReShiGongdel : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string result = "删除失败";
            string strid = context.Request.Form["id"];
            string StrSql = "DELETE t_DIER_shigong  where id=" + strid;
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