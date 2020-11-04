using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace MarketInfo.wd_dzrz.wd_disanf
{
    /// <summary>
    /// selxxqd 的摘要说明
    /// </summary>
    public class selxxqd : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string StrJson = "";
            string strid = context.Request.Form["id"];
            string StrSql = "select  * from dbo.T_Dsan_xinxiqudao order by id desc";
            if (!string.IsNullOrWhiteSpace(strid)) {
                StrSql = "select  * from dbo.T_Dsan_xinxiqudao where id=" + strid;
            }
            try
            {
                DataTable dt = WXDBUtility.SqlHelper.GetDataTable(StrSql);
                StrJson = WXDBUtility.JsonHelper.DataTableToJson(dt);
            }
            catch (Exception ex)
            {
                StrJson = "-1";
            }


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