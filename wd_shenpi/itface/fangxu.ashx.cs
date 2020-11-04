using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.SessionState;

namespace MarketInfo.wd_shenpi.itface
{
    /// <summary>
    /// fangxu 的摘要说明
    /// </summary>
    public class fangxu : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string StrJson = "";
            string strtpe = context.Session["CUR_T_ID"].ToString();//TYPE
            string strtid = context.Request.Form["tid"];
            String strnowdate = DateTime.Now.ToShortDateString().ToString();

            String StrSql = "";

            if (strtpe == "2")
            {
                StrSql = "select count(*) as num from t_fangxun where fx_tid='" + strtid + "' and flag='1' and sp1='0' and spid1='0' and DateDiff(dd,f_time ,getdate())<=0 ";
            }
            if (strtpe == "1")
            {
                StrSql = "select count(*) as num from t_fangxun where fx_tid='" + strtid + "' and flag='1' and sp1='1' and spid1<>'0' and sp2='0' and DateDiff(dd,f_time ,getdate())<=0 ";
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