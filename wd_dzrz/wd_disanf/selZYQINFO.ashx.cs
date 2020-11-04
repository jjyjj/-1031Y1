using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.SessionState;

namespace MarketInfo.wd_dzrz.wd_disanf
{
    /// <summary>
    /// selZYQINFO 的摘要说明
    /// </summary>
    public class selZYQINFO : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string StrJson = "";
            string strid = context.Request.Form["id"];
             //  string StrSql = "select  * from dbo.T_ZYQ_INFO where zpid<>-1 order by zid desc"; 
          string StrSql = "select  * from dbo.T_ZYQ_INFO where zid='"+ context.Session["CUR_ZID"] + "'  order by zid desc";

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