using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketInfo.wd_dzrz._1xunhuaguanli
{
    /// <summary>
    /// itfenpei 的摘要说明
    /// </summary>
    public class itfenpei : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string tpid = context.Request.Form["pid"];
            string strid = context.Request.Form["id"];
            string result = "保存失败";
            string StrSql = "update t_xunxiangong_info set xx_tid_lishi='" + tpid + "' where xx_id=" + strid;
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