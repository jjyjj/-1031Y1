using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.SessionState;

namespace MarketInfo.it
{
    /// <summary>
    /// selDisanf 的摘要说明
    /// </summary>
    public class selDisanf : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string StrJson = "";
            string strtype = "";
            if (context.Session["CUR_T_ID"] != null && context.Session["CUR_T_ID"].ToString() != "")
            {
                strtype = context.Session["CUR_T_ID"].ToString();
            }
            string strZid = string.Empty;
            if (context.Session["CUR_ZID"] != null && context.Session["CUR_ZID"].ToString() != "")
            {
                strZid = context.Session["CUR_ZID"].ToString();
            }
            string strTable = context.Request.Form["table"];
            string strtid = context.Request.Form["tid"];
            string strSetTime = context.Request.Form["time"];
            string StrSql = string.Empty;
            if (strtype == "2")
            {
                //string sql = "select t_id from T_USER_INFO where zpid='" + strZid + "'";
                //DataTable tb1 = WXDBUtility.SqlHelper.GetDataTable(sql);
                string data_zid = string.Empty;
                //if (tb1 != null)
                //{
                //    for (int i = 0; i < tb1.Rows.Count; i++)
                //    {
                //        data_zid += tb1.Rows[i]["t_id"].ToString() + ",";
                //    }
                //}
                data_zid += context.Session["CUR_TID"].ToString() + "," + strtid;
                StrSql = "select * from " + strTable + "  where t_id in (" + data_zid + ")and sp1='0' and DateDiff(dd," + strSetTime + " ,getdate())=0  order by id desc";
            }
            if (strtype == "1")
            {
                string sql = " select t_id from T_USER_INFO where zpid in (select ZID from T_USER_INFO where T_ID ='" + strtid + "')";
                DataTable tb1 = WXDBUtility.SqlHelper.GetDataTable(sql);
                string data_zid = string.Empty;
                if (tb1 != null) {
                    for (int i = 0; i < tb1.Rows.Count; i++)
                    {
                        data_zid += tb1.Rows[i]["t_id"].ToString()+",";
                    }
                }
                data_zid += strtid;

                StrSql = "select * from " + strTable + "  where t_id in (" + data_zid + ")   and sp1='1' and sp2='0' and spid2='0' and DateDiff(dd," + strSetTime + " ,getdate())=0  order by id desc";
            }
            if (strtype == "0")
            {
                //获取分输站ID
                string sql = "  select * from T_USER_INFO where zpid in (select ZID from T_USER_INFO where T_ID ='" + strtid + "')";
                DataTable tb1 = WXDBUtility.SqlHelper.GetDataTable(sql);
                string data_zid = string.Empty;
                if (tb1 != null)
                {
                    for (int i = 0; i < tb1.Rows.Count; i++)
                    {
                        data_zid += tb1.Rows[i]["t_id"].ToString() + ",";
                    }
                    data_zid = data_zid.TrimEnd(',');
                }
                //获取分输站ID
                string sql1 = "  select T_ID from T_USER_INFO where zpid in (" + data_zid + ")";
                DataTable tb2 = WXDBUtility.SqlHelper.GetDataTable(sql1);
                if (tb2 != null)
                {
                    for (int i = 0; i < tb2.Rows.Count; i++)
                    {
                        data_zid += "," + tb2.Rows[i]["t_id"].ToString();
                    }
                }
                StrSql = "select * from " + strTable + " where t_id in (" + data_zid + ")   and sp2='1' and spid2<>'0' and DateDiff(dd," + strSetTime + " ,getdate())=0  order by id desc";
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