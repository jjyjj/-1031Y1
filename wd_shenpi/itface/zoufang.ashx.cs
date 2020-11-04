using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.SessionState;

namespace MarketInfo.wd_shenpi.itface
{
    /// <summary>
    /// zoufang 的摘要说明
    /// </summary>
    public class zoufang : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string StrJson = "";
            string strtpe = context.Session["CUR_T_ID"].ToString();//TYPE
            string strtid = context.Request.Form["tid"];
            String Sql = "";
            if (strtpe == "2")
            {
                Sql = "select count(*) as num from dbo.T_xuan_chuan_zou_fang where t_id='" + strtid + "' and flag='1' and sp1='0' and spid1='0'  and DateDiff(dd,setTime ,getdate())=0 ";
               
            }
            if (strtpe == "1")
            {
                Sql = "select count(*) as num from dbo.T_xuan_chuan_zou_fang where t_id='" + strtid + "' and flag='1' and sp1<>'0' and spid1<>'0' and sp2='0' and DateDiff(dd,setTime ,getdate())=0 ";
            }
            try
            {
                DataTable dt = WXDBUtility.SqlHelper.GetDataTable(Sql);
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