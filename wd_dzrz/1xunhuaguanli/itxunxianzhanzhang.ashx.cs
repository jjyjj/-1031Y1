using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace MarketInfo.wd_dzrz._1xunhuaguanli
{
    /// <summary>
    /// itxunxianzhanzhang 的摘要说明
    /// </summary>
    public class itxunxianzhanzhang : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string StrJson = "";
            string strid = context.Request.QueryString["TID"];
            string StrSql = "select  * from dbo.T_USER_INFO where ZID='" + strid + "' order by T_ID desc";
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