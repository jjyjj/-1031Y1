using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketInfo.it
{
    /// <summary>
    /// XunXianGongUpdateFg 有暂存变为保存
    /// </summary>
    public class XunXianGongUpdateFg : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string result = "保存失败";
            string strfg = context.Request.Form["fg"];
            string strid = context.Request.Form["id"];
            string StrSql = "update T_xun_xian_gong set flag='" + strfg + "' where id=" + strid;
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