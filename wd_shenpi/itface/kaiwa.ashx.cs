using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.SessionState;

namespace MarketInfo.wd_shenpi.itface
{
    /// <summary>
    /// kaiwa 的摘要说明
    /// </summary>
    public class kaiwa : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string StrJson = "";
            //string strid = context.Request.QueryString["TID"];//TYPE
            string strtpe = context.Session["CUR_T_ID"].ToString();//TYPE
            //string strzid = context.Session["CUR_ZID"].ToString();
            //string strzpid = context.Session["CUR_PZID"].ToString();
            string StrSql = "";
            if (strtpe == "2")
            {
                StrSql = "select count(*) as num from dbo.t_dongtaifengxian where t_id='" + context.Request.Form["tid"] + "' and flag='1' and sp1='0' and spid1='0' and DateDiff(dd,setTime ,getdate())=0 ";
               // tb = WXDBUtility.SqlHelper.GetDataTable(Sql);
            }
            if (strtpe == "1")
            {
                StrSql = "select  count(*) as num from t_dongtaifengxian where t_id='" + context.Request.Form["tid"] + "' and flag='1' and sp1<>'0' and spid1<>'0' and sp2='0' and spid2='0' and DateDiff(dd,setTime ,getdate())=0 ";
                //tb = WXDBUtility.SqlHelper.GetDataTable(Sql);
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