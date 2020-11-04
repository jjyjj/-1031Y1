using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.SessionState;

namespace MarketInfo.wd_dzrz.wd_disanf
{
    /// <summary>
    /// selxzsg 的摘要说明
    /// </summary>
    public class selxzsg : IHttpHandler, IRequiresSessionState 
    {

        public void ProcessRequest(HttpContext context)
        { 
            string StrJson = "";
            string strtid = context.Request.Form["tid"];
            if (context.Session["CUR_TID"] != null)
            {
                strtid = context.Session["CUR_TID"].ToString();
            }
            string strid = context.Request.Form["id"];
            string StrSql = "select  * from dbo.T_Dsan_xinzengshigong where t_id='" + strtid + "' order by id desc";
            if (!string.IsNullOrWhiteSpace(strid)) {
                StrSql = "select  * from dbo.T_Dsan_xinzengshigong where id=" + strid;
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