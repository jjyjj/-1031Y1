using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.SessionState;

namespace MarketInfo.wd_tongji
{
    /// <summary>
    /// xuexipeixun 的摘要说明
    /// </summary>
    public class xuexipeixun : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string StrJson = "";
            string strid = context.Session["CUR_TID"].ToString();//Tid
            string strtype = context.Session["CUR_T_ID"].ToString();//TYPE
            string strzid = context.Session["CUR_ZID"].ToString();
            String strnowdate = DateTime.Now.ToShortDateString().ToString();
            string StrSql = "";
            if (strtype == "2")//站长
            {
                //站长登录时需要查询出来所所有线路管理员
                String strsql1 = "select T_ID from T_USER_INFO where ZPID='" + strzid + "'";
                String where = "";
                DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strsql1);
                if (tb != null)
                {
                    string[] arr = new string[tb.Rows.Count];
                    for (int i = 0; i < tb.Rows.Count; i++)
                    {
                        arr[i] = tb.Rows[i]["T_ID"].ToString();
                        int len = arr.Length;

                    }
                    string tid = "";
                    for (int j = 0; j < arr.Length; j++)
                    {
                        tid += arr[j].ToString() + ",";
                    }
                    tid = strid + "," + tid.TrimEnd(',');

                    where = " T_ID IN ( " + tid + ") ";
                }
                StrSql = "select  count(*) as num from dbo.T_WORK_INFO1 where " + where + " and T_TYPEID='4' and  DATEDIFF (S, T_WSTART,'" + strnowdate + "')  >= 0 and DATEDIFF(S,T_WEND,'" + strnowdate + "' )<=0 ";

            }
            if (strtype == "1")//区主任
            {
                String strsql2 = "select T_ID,ZID from T_USER_INFO where ZPID='" + strzid + "'";
                DataTable tb2 = WXDBUtility.SqlHelper.GetDataTable(strsql2);
                String where = "";
                if (tb2 != null)
                {
                    //1.存储T_ID、ZID 
                    string tid = "";
                    string[] arrtid = new string[tb2.Rows.Count];
                    string[] arrzid = new string[tb2.Rows.Count];
                    //根据zid再次取出tid
                    for (int i = 0; i < tb2.Rows.Count; i++)
                    {
                        arrtid[i] = tb2.Rows[i]["T_ID"].ToString();
                        arrzid[i] = tb2.Rows[i]["ZID"].ToString();

                    }
                    for (int j = 0; j < arrtid.Length; j++)
                    {
                        tid += arrtid[j].ToString() + ",";
                    }
                    string zid = "";
                    for (int j = 0; j < arrzid.Length; j++)
                    {
                        zid += arrzid[j].ToString() + ",";
                    }
                    zid = zid.TrimEnd(',');
                    String SQL1 = "Select T_ID from T_USER_INFO where ZPID IN ( " + zid + ") ";
                    DataTable tb3 = WXDBUtility.SqlHelper.GetDataTable(SQL1);
                    string tid2 = "";
                    if (tb3 != null)
                    {
                        //1.存储T_ID、ZID 

                        string[] arrtid2 = new string[tb3.Rows.Count];
                        for (int i = 0; i < tb3.Rows.Count; i++)
                        {
                            arrtid2[i] = tb3.Rows[i]["T_ID"].ToString();

                        }
                        for (int j = 0; j < arrtid2.Length; j++)
                        {
                            tid2 += arrtid2[j].ToString() + ",";
                        }
                    }
                    tid = tid + tid2.TrimEnd(',');
                    where = " T_ID IN ( " + tid + ") ";
                }
                StrSql = "select  count(*) as num from dbo.T_WORK_INFO1 where " + where + " and T_TYPEID='4' and   DATEDIFF (S, T_WSTART,'" + strnowdate + "')  >= 0 and DATEDIFF(S,T_WEND,'" + strnowdate + "' )<=0 ";

            }
            if (strtype == "0")//区主任
            {

                StrSql = "select  count(*) as num from dbo.T_WORK_INFO1 where T_TYPEID='4' and   DATEDIFF (S, T_WSTART,'" + strnowdate + "')  >= 0 and DATEDIFF(S,T_WEND,'" + strnowdate + "' )<=0 ";
            }
            if (strtype == "3")//线路管理员
            {

                StrJson = "-1";

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