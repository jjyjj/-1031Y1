using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.SessionState;

namespace MarketInfo.it
{
    /// <summary>
    /// gethggq 的摘要说明
    /// </summary>
    public class gethggq : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string result = "获取失败";
            string strgid = context.Request.Form["id"];

            string strid = context.Session["CUR_TID"].ToString();//Tid
            string strtype = context.Session["CUR_T_ID"].ToString();//TYPE
            string strzid = context.Session["CUR_ZID"].ToString();
            string strzpid= context.Session["CUR_PZID"].ToString();
            string StrSql = "";
            if (strtype == "2")//站长
            {
                StrSql = " update T_GGQ_INFO set zid='"+ strzid + "',zpid='"+ strzpid + "' where gid='"+ strgid + "'";

            }
            if (strtype == "3")//线路管理员
            {
                string sql = "select zpid from t_zyq_info where zid='"+ strzpid + "'";
                DataTable tb5 = WXDBUtility.SqlHelper.GetDataTable(sql);
                string strzpd = tb5.Rows[0]["zpid"].ToString();
                StrSql = " update T_GGQ_INFO set zid='" + strzpid + "',zpid='" + strzpd + "' where gid='" + strgid + "'";

            }
            //if (strtype == "1")//区主任
            //{
            //    string sql = "select zpid from t_zyq_info where zid='" + strzpid + "'";
            //    DataTable tb5 = WXDBUtility.SqlHelper.GetDataTable(sql);
            //    string strzpd = tb5.Rows[0]["zpid"].ToString();
            //    StrSql = " update T_GGQ_INFO set zid='" + strzpid + "',zpid='" + strzpd + "' where gid='" + strgid + "'";

            //}
            try
            {
                int res = WXDBUtility.SqlHelper.ExecuteSql(StrSql);
                if (res > 0)
                {
                    result = "0";
                }
            }
            catch (Exception ex)
            {
                result = ex.Message;
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