using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketInfo.it.jjy
{
    /// <summary>
    /// getHuiYiInfo 的摘要说明
    /// </summary>
    public class getHuiYiInfo : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";


            var id = Int32.Parse(context.Request.Params["id"].ToString());
            string sql = "SELECT * FROM T_HuiYi WHERE Id=" + id;
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