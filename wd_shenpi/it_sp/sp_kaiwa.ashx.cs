using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.SessionState;

namespace MarketInfo.wd_shenpi.it_sp
{
    /// <summary>
    /// sp_kaiwa 的摘要说明
    /// </summary>
    public class sp_kaiwa : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string StrJson = "";
            //string strid = context.Request.QueryString["TID"];//TYPE
            string strtpe = context.Session["CUR_T_ID"].ToString();//TYPE
            string strzid = context.Session["CUR_ZID"].ToString();
            string strzpid = context.Session["CUR_PZID"].ToString();
            string StrSql = "";
            if (strtpe == "2")//zhanzhang站长
            {
                StrSql = "select count(*) as num from dbo.t_dongtaifengxian where ntype='3' and zpid='" + strzid + "' and flag='1' and sp1='0' and spid1='0' and DateDiff(dd,setTime ,getdate())=0 ";
                // tb = WXDBUtility.SqlHelper.GetDataTable(Sql);
            }
            if (strtpe == "1")//区主任
            {
                //1、查询站长的type=2；2、查询线路管理员的type=3
                //
                String sql = "select zid from t_user_info where zpid='" + strzid + "'";
                DataTable tb1 = WXDBUtility.SqlHelper.GetDataTable(sql);
                string where = "";
                if (tb1 != null)
                {
                    string[] arr = new string[tb1.Rows.Count];
                    for (int i = 0; i < tb1.Rows.Count; i++)
                    {
                        arr[i] = tb1.Rows[i]["zid"].ToString();
                        int len = arr.Length;

                    }
                    string tid = "";
                    for (int j = 0; j < arr.Length; j++)
                    {
                        tid += arr[j].ToString() + ",";
                    }
                    tid = tid.TrimEnd(',');

                    where = "  zid IN ( " + tid + ") ";
                    where = "and (" + where + " or zpid in ( " + tid + "))";
                }
                StrSql = "select  count(*) as num from t_dongtaifengxian where flag='1' and sp1='1' and spid1<>'0' and sp2='0' and spid2='0' and DateDiff(dd,setTime ,getdate())=0 " + where ;
                
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