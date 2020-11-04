using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketInfo.it
{
    /// <summary>
    /// XuanChuanZouFangUpdateFg 的摘要说明
    /// </summary>
    public class XuanChuanZouFangUpdateFg : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string result = "保存失败";
            string strfg = context.Request.Form["fg"];
            string strid = context.Request.Form["id"];
            string StrSql = "update T_xuan_chuan_zou_fang set flag='" + strfg + "',setTime='" + DateTime.Now + "' where id=" + strid;
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