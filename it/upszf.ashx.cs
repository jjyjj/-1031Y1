using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketInfo.it
{
    /// <summary>
    /// upszf 的摘要说明
    /// </summary>
    public class upszf : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
           
            string strid = context.Request.Form["id"];
            string result = "保存失败";
            string StrSql = "update t_sanzhuangfei set flag='" + context.Request.Form["fg"] + "',s_xiaqu_yf='" + context.Request.Form["yf"] + "',s_jinri_ff='" + context.Request.Form["sf"] + "',s_jd='" + context.Request.Form["jd"] + "'  where s_id=" + strid;
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