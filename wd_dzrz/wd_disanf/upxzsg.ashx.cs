using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace MarketInfo.wd_dzrz.wd_disanf
{
    /// <summary>
    /// upxzsg 的摘要说明
    /// </summary>
    public class upxzsg : IHttpHandler, IRequiresSessionState 
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

            string strcontent = context.Request.Form["content"];
            string strxxqd = context.Request.Form["xxqd"];
            string strclgc = context.Request.Form["clgc"];
            string strsname = context.Request.Form["sname"];
            string strsphone = context.Request.Form["sphone"];
            string strtype = context.Request.Form["type"];
            string zid = context.Request.Form["zid"];

            string StrSql = "update T_Dsan_xinzengshigong set  _content='" + strcontent + "',xinxiqudao='" + strxxqd + "',clgc='" + strclgc + "'";
            StrSql += ",sname='" + strsname + "',sphone='" + strsphone + "',type='" + strtype + "',t_id='" + strtid + "',z_id='" + zid + "' ,setTime=getdate(),sp1='0',sp2='0',sp3='0',spid1='0',spid2='0',spid3='0'  where id=" + strid;
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