using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketInfo.wd_dzrz.wd_gdkwork
{
    /// <summary>
    /// UpdateFg 的摘要说明
    /// </summary>
    public class UpdateFg : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string result = "保存失败";
            string strid = context.Request.Form["id"];
            string strflag = context.Request.Form["fg"];

            string StrSql = "update t_gdk_workday set flag='"+ strflag + "' where id='"+ strid + "'";
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