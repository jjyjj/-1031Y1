using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.SessionState;

namespace MarketInfo.wd_dzrz.user
{
    /// <summary>
    /// getdw 的摘要说明
    /// </summary>
    public class getdw : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {


            //string strtype = Session["CUR_T_ID"].ToString();//TYPE
            //string strzid = Session["CUR_ZID"].ToString();
            //string strzpid = Session["CUR_PZID"].ToString();
            //if (strtype == "1")
            //{
            //    StrSql = "select  * from dbo.T_ZYQ_INFO where  ztype='1' and zid<>'" + strzid + "'";

            //}
            //if (strtype == "2" || strtype == "3")
            //{
            //    StrSql = "select  * from dbo.T_ZYQ_INFO where  ztype='2' and zid<>'" + strzid + "'";

            //}
            string StrJson = "";

            string strtype = context.Session["CUR_T_ID"].ToString();//TYPE
            string strzid = context.Session["CUR_ZID"].ToString();
            string strzpid = context.Session["CUR_PZID"].ToString();
            string StrSql = "";
            if (strtype == "1")//站长
            {
                StrSql = "select  * from dbo.T_ZYQ_INFO where  ztype='1' and zid<>'" + strzid + "'";
            }
            if (strtype == "2" || strtype == "3")//线路管理员
            {
                StrSql = "select  * from dbo.T_ZYQ_INFO where  ztype='2' and zid<>'" + strzid + "'";
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