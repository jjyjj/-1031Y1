using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.SessionState;


namespace MarketInfo.wd_dzrz._1xunhuaguanli
{
    /// <summary>
    /// itxunxiangong 的摘要说明
    /// </summary>
    public class itxunxiangong : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string StrJson = "";
            string strid = context.Request.QueryString["TID"];//TYPE
            string strtype = context.Session["CUR_T_ID"].ToString();//TYPE
            string strzid = context.Session["CUR_ZID"].ToString();
            string strzpid = context.Session["CUR_PZID"].ToString();
            string StrSql = "";
            if (strtype == "2")
            {
                //站长登录时需要查询出来所所有线路管理员下的巡线工
                String strsql1 = "select T_ID from T_USER_INFO where ZPID='" + strzid + "'";
                String where = "";
                DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strsql1);
                if (tb != null)
                {
                    string[] arr=new string[tb.Rows.Count];
                    for(int i=0;i<tb.Rows.Count;i++)
                    {
                        arr[i] = tb.Rows[i]["T_ID"].ToString();
                        int len = arr.Length;

                    }
                    string tid="";
                    for (int j=0; j < arr.Length; j++)
                    {
                        tid+=arr[j].ToString()+",";                      
                    }
                    tid=tid.TrimEnd(',');
                    
                    where = " xx_tid IN ( " + tid + ") or xx_tid_lishi IN ( " + tid + ") ";
                }
                StrSql = "select  * from dbo.t_xunxiangong_info where "+  where +" order by xx_id desc";

            }
            else 
            {

             StrSql = "select  * from dbo.t_xunxiangong_info where xx_tid='" + strid + "' or xx_tid_lishi='" + strid + "' order by xx_id desc";
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