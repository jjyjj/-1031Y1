using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace MarketInfo.wd_dzrz.wd_disanf
{
    /// <summary>
    /// upjhd 的摘要说明
    /// </summary>
    public class upjhd : IHttpHandler, IRequiresSessionState 
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

            string strjhd = context.Request.Form["jhd"];
            string strjhname = context.Request.Form["jhname"];
            string strjhphone = context.Request.Form["jhphone"];
            string strjhtype = context.Request.Form["jhtype"];
            string strjd = context.Request.Form["jd"];
            string zid = context.Request.Form["zid"];

            string StrSql = "update T_Dsan_jindu set  jhd='" + strjhd + "',jhname='" + strjhname + "',jhphone='" + strjhphone + "',jhtype='" + strjhtype + "',jd='" + strjd + "',z_id='" + zid + "'";
            StrSql += ",t_id='" + strtid + "' ,setTime=getdate(),sp1='0',sp2='0',sp3='0',spid1='0',spid2='0',spid3='0' where id=" + strid;
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