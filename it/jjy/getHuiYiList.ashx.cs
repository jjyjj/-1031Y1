using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketInfo.it.jjy
{
    /// <summary>
    /// getHuiYiList 的摘要说明
    /// </summary>
    public class getHuiYiList : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";


            var UId = Int32.Parse(context.Session["CUR_TID"].ToString());
            string sql = "SELECT * FROM T_HuiYi WHERE UId=" + UId;
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