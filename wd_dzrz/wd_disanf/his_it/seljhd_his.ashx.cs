using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.SessionState;

namespace MarketInfo.wd_dzrz.wd_disanf.his_it
{
    /// <summary>
    /// seljhd_his 的摘要说明
    /// </summary>
    public class seljhd_his : IHttpHandler, IRequiresSessionState 
    {

        public void ProcessRequest(HttpContext context)
        {
            string StrJson = "";
            string strtid = context.Request.Form["tid"];
            if (context.Session["CUR_T_ID"].ToString() == "3")
            {
                if (context.Session["CUR_TID"] != null)
                {
                    strtid = context.Session["CUR_TID"].ToString();
                }
            }
            string strid = context.Request.Form["id"];
            string StrSql = "select  * from dbo.T_Dsan_jindu where t_id='" + strtid + "' and sp1='1' and spid1<>'0' order by id desc";
            if (!string.IsNullOrWhiteSpace(strid))
            {
                StrSql = "select  * from dbo.T_Dsan_jindu where t_id='" + strtid + "' and sp1='1' and spid1<>'0' and id=" + strid;
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