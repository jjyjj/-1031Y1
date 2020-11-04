using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace MarketInfo.wd_dzrz.wd_gdkwork
{
    /// <summary>
    /// WorkData 的摘要说明
    /// </summary>
    public class WorkData : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string strid = context.Request.Form["id"];
            string StrSql = "select  * from dbo.t_gdk_workday where id='" + strid + "' ";
            DataTable dt = WXDBUtility.SqlHelper.GetDataTable(StrSql);
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