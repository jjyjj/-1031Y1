using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.SessionState;

namespace MarketInfo.wd_user
{
    /// <summary>
    /// Handler1 的摘要说明
    /// </summary>
    public class Handler1 : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string result = "-1";
            string strid = context.Request.Form["id"];//新id
            string strreason = context.Request.Form["Reason"];//新id
            string strtid = context.Session["CUR_TID"].ToString();//登录者用户id
            string strtype = context.Session["CUR_T_ID"].ToString();//TYPE
            string strzid = context.Session["CUR_ZID"].ToString();
            string strzpid = context.Session["CUR_PZID"].ToString();
            string StrSql = "";
            if (strtype == "1")
            {
                StrSql = "INSERT into  T_USER_BG([y_zid],[y_zpid],[n_zid],[n_zpid],[reason],tid,type)VALUES('" + strzid + "','" + strzpid + "','" + strid + "','-1','" + strreason + "','" + strtid + "','" + strtype + "')";
            }
            if (strtype == "2" || strtype == "3")
            {
                String strsql = "select zpid from T_ZYQ_INFO where zid='" + strid + "'";
                DataTable tb1 = WXDBUtility.SqlHelper.GetDataTable(strsql);
                string strpid = "-2";
                if (tb1 != null)
                {
                    strpid = tb1.Rows[0]["zpid"].ToString();
                }
                StrSql = "INSERT into  T_USER_BG([y_zid],[y_zpid],[n_zid],[n_zpid],[reason],tid,type)VALUES('" + strzid + "','" + strzpid + "','" + strid + "','" + strpid + "','" + strreason + "','" + strtid + "','" + strtype + "')";

                //StrSql = "select  * from dbo.T_ZYQ_INFO where  ztype='2' and zid<>'" + strzid + "'";

            }
           // dt = WXDBUtility.SqlHelper.GetDataTable(strsql);
            try
            {
                int res = WXDBUtility.SqlHelper.ExecuteSql(StrSql);
                if (res > 0)
                {
                    result = "1";
                }
            }
            catch (Exception ex)
            {
                result = "-1";
            }
            context.Response.ContentType = "text/plain";
            context.Response.Write(result);
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