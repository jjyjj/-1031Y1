using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.SessionState;

namespace MarketInfo.wd_shenpi.itface
{
    /// <summary>
    /// disan 的摘要说明
    /// </summary>
    public class disan : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string StrJson = "";
            string strtpe = context.Session["CUR_T_ID"].ToString();//TYPE
            string strtid = context.Request.Form["tid"];
            String StrSql = "";
            if (strtpe == "2")
            {

                StrSql = "select count(*) as num from dbo.T_Dsan_xinzengshigong where t_id='" + strtid + "' and   sp1='0'and spid1='0' and DateDiff(dd,setTime ,getdate())=0 ";
                // StrSql = "select count(*) as num from dbo.t_DIER_shigong where t_id='" + context.Request.Form["tid"] + "' and flag='1' and sp1='0' and spid1='0' and DateDiff(dd,setTime ,getdate())=0 ";

            }
            if (strtpe == "1")
            {
                //string sql = " select t_id from T_USER_INFO where zpid in (select ZID from T_USER_INFO where T_ID ='" + strtid + "')";
                //DataTable tb1 = WXDBUtility.SqlHelper.GetDataTable(sql);
                //string data_zid = string.Empty;
                //if (tb1 != null)
                //{
                //    for (int i = 0; i < tb1.Rows.Count; i++)
                //    {
                //        data_zid += tb1.Rows[i]["t_id"].ToString() + ",";
                //    }
                //}
                //data_zid += strtid;

                //   StrSql = "select * from dbo.t_DIER_shigong  where t_id in (" + data_zid + ")   and sp1='1' and sp2='0' and spid2='0' and  flag='1'   and DateDiff(dd,er_time ,getdate())=0 ";
                StrSql = "select  count(*) as num from T_Dsan_xinzengshigong where t_id='" + context.Request.Form["tid"] + "' and sp1='1' and sp2='0' and spid2='0'  and DateDiff(dd,setTime ,getdate())=0 ";

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