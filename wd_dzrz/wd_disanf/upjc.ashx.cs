using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace MarketInfo.wd_dzrz.wd_disanf
{
    /// <summary>
    /// upjc 的摘要说明
    /// </summary>
    public class upjc : IHttpHandler, IRequiresSessionState 
    {

        public void ProcessRequest(HttpContext context)
        {
            string result = "保存失败";
            string strtid = context.Request.Form["tid"];
            if (context.Session["CUR_TID"] != null)
            {
                strtid = context.Session["CUR_TID"].ToString();
            }
            string strfg = context.Request.Form["fg"];
            string strid = context.Request.Form["id"];

            string jrjcxm = context.Request.Form["jrjcxm"];
            string fxwt = context.Request.Form["fxwt"];
            string wtzg = context.Request.Form["wtzg"];
            string qt = context.Request.Form["qt"];
            string zid = context.Request.Form["zid"];
            //int num = int.Parse(context.Request.Form["num"]);

            string StrSql = "update T_Dsan_jiancha set  jrjcxm='" + jrjcxm + "',fxwt='" + fxwt + "',wtzg='" + wtzg + "',qt='" + qt + "',z_id=" + zid + ",";
            StrSql += "t_id='" + strtid + "' ,settime=getdate(),sp1='0',sp2='0',sp3='0',spid1='0',spid2='0',spid3='0' where id=" + strid;
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