using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace MarketInfo.wd_dzrz.wd_disanf
{
    /// <summary>
    /// addxzsg 的摘要说明
    /// </summary>
    public class addxzsg : IHttpHandler, IRequiresSessionState 
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

            string strcontent = context.Request.Form["content"];
            string strxxqd = context.Request.Form["xxqd"];
            string strclgc = context.Request.Form["clgc"];
            string strsname = context.Request.Form["sname"];
            string strsphone = context.Request.Form["sphone"];
            string strtype = context.Request.Form["type"];
            string zid = context.Request.Form["zid"];

            string StrSql = "insert T_Dsan_xinzengshigong(_content,xinxiqudao,clgc,sname,sphone,type,t_id,z_id) values";
            StrSql += "('" + strcontent + "','" + strxxqd + "','" + strclgc + "','" + strsname + "','" + strsphone + "','" + strtype + "','" + strtid + "','" + zid + "')";
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