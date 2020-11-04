using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.SessionState;

namespace MarketInfo.wd_shenpi.itface
{
    /// <summary>
    /// jieduancount 的摘要说明
    /// </summary>
    public class jieduancount : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            int data =0;
            string strtpe = context.Session["CUR_T_ID"].ToString();//TYPE
            string strtid = context.Request.Form["tid"];

           // String StrSql = "";

            if (strtpe == "2")
            {
                String StrSql1 = "select count(*) as num from t_sanzhuangfei where s_tid='" + strtid + "' and flag='1' and sp1='0' and sprid1='0' and DateDiff(dd,s_time ,getdate())<=0 ";
                DataTable dt = WXDBUtility.SqlHelper.GetDataTable(StrSql1);
                int count1 = Convert.ToInt16(dt.Rows[0]["num"]);

                String StrSql2 = "select count(*) as num from t_guandao_glfc where gd_tid='" + strtid + "' and flag='1' and sp1='0' and spid1='0' and DateDiff(dd,gd_time ,getdate())<=0";
                DataTable dt2 = WXDBUtility.SqlHelper.GetDataTable(StrSql2);
                int count2 = Convert.ToInt16(dt2.Rows[0]["num"]);

                String StrSql3 = "select count(*) as num from t_fangxun where fx_tid='" + strtid + "' and flag='1' and sp1='0' and spid1='0' and DateDiff(dd,f_time ,getdate())<=0";
                DataTable dt3 = WXDBUtility.SqlHelper.GetDataTable(StrSql3);
                int count3 = Convert.ToInt16(dt3.Rows[0]["num"]);
                data = count1 + count2 + count3;

            }
            if (strtpe == "1")
            {

                String StrSql1 = "select count(*) as num from t_sanzhuangfei where s_tid='" + strtid + "' and flag='1' and sp1='1' and sprid1<>'0' and sp2='0' and DateDiff(dd,s_time ,getdate())<=0 ";
                DataTable dt = WXDBUtility.SqlHelper.GetDataTable(StrSql1);
                int count1 = Convert.ToInt16(dt.Rows[0]["num"]);

                String StrSql2 = "select count(*) as num from t_guandao_glfc where gd_tid='" + strtid + "' and flag='1' and sp1='1' and spid1<>'0' and sp2='0' and DateDiff(dd,gd_time ,getdate())<=0";
                DataTable dt2 = WXDBUtility.SqlHelper.GetDataTable(StrSql2);
                int count2 = Convert.ToInt16(dt2.Rows[0]["num"]);

                String StrSql3 = "select count(*) as num from t_fangxun where fx_tid='" + strtid + "' and flag='1' and sp1='0' and spid1<>'0' and sp2='0' and DateDiff(dd,f_time ,getdate())<=0";
                DataTable dt3 = WXDBUtility.SqlHelper.GetDataTable(StrSql3);
                int count3 = Convert.ToInt16(dt3.Rows[0]["num"]);
                data = count1 + count2 + count3;
            }

            try
            {
                data=data+0;
            }
            catch (Exception ex)
            {
                data = -1;
            }
            context.Response.ContentType = data.ToString();
            context.Response.Write(data);
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