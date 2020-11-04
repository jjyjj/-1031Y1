using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.SessionState;

namespace MarketInfo.it
{
    /// <summary>
    /// ghgqbh 的摘要说明
    /// </summary>
    public class ghgqbh : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            //T_GGQ_INFO
            string StrJson = "";
            //string strid = context.Request.QueryString["TID"];//TYPE
            string strtype = context.Session["CUR_T_ID"].ToString();//TYPE
            string strzid = context.Session["CUR_ZID"].ToString();
            string strzpid = context.Session["CUR_PZID"].ToString();
           // string StrSql = "select  * from dbo.T_GGQ_INFO ";
          //  等各个站获取工作完成放开即可
            string StrSql = "";
            if (strtype == "2")//站长
            {
                StrSql = "select  * from dbo.T_GGQ_INFO where zid='" + strzid + "'";
            }
            if (strtype == "3")//线路管理员
            {
                StrSql = "select  * from dbo.T_GGQ_INFO where zpid='" + strzpid + "'";
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