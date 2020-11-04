using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace MarketInfo.wd_dzrz.wd_file
{
    /// <summary>
    /// updatedata 的摘要说明
    /// </summary>
    public class updatedata : IHttpHandler, IRequiresSessionState 
    {

        public void ProcessRequest(HttpContext context)
        {
            string result = "保存失败";
            string strtid = context.Request.Form["tid"];
            if (context.Session["CUR_TID"] != null)
            {
                strtid = context.Session["CUR_TID"].ToString();
            }  
            string strid=context.Request.Form["id"];
            string strtitle=context.Request.Form["title"];
            string strtype = context.Request.Form["type"];
            string StrSql = "update T_File set title='" + strtitle + "',file_type='" + strtype + "' where id=" + strid;
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