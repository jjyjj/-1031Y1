using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.SessionState;

namespace MarketInfo.wd_shenpi.it_sp
{
    /// <summary>
    /// sp_dwbg 的摘要说明
    /// </summary>
    public class sp_dwbg : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string StrJson = "";
            int data = 0;
            //string strid = context.Request.QueryString["TID"];//TYPE
            string strtpe = context.Session["CUR_T_ID"].ToString();//TYPE
            string strzid = context.Session["CUR_ZID"].ToString();
            string strzpid = context.Session["CUR_PZID"].ToString();

            string StrSql = "";
            if (strtpe == "1")//区主任
            {
                StrSql = "select count(*) as num from dbo.T_USER_BG where n_zpid='" + strzid + "'  and sp1='0' and spid1='0' and del='1' and type='2'";
                //DateDiff(dd,setTime ,getdate())=0 
                // tb = WXDBUtility.SqlHelper.GetDataTable(Sql);
            }
            if (strtpe == "2")  //站长          
            {
                StrSql = "select  count(*) as num from T_USER_BG where n_zid='" + strzid + "'and n_zpid='" + strzpid + "'  and sp1='0' and spid1='0' and del='1' and type='3' ";
                //tb = WXDBUtility.SqlHelper.GetDataTable(Sql);
            }
            if (strtpe == "0")  //管理处          
            {
                StrSql = "select  count(*) as num from T_USER_BG where  sp1='0' and spid1='0' and del='1' and type='1'";
                //tb = WXDBUtility.SqlHelper.GetDataTable(Sql);
            }
            DataTable dt2 = WXDBUtility.SqlHelper.GetDataTable(StrSql);
            int count2 = Convert.ToInt16(dt2.Rows[0]["num"]);
            data = count2;

            try
            {
                data = data + 0;
            }
            catch (Exception ex)
            {
                data = 0;
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