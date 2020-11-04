using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketInfo.it
{
    /// <summary>
    /// FengXianUpdateFg 的摘要说明
    /// </summary>
    public class FengXianUpdateFg : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string result = "保存失败";
            string strfg = context.Request.Form["fg"];
            string strid = context.Request.Form["id"];
            //提交时将审批过得sp以及spid初始化
            string StrSql = "update t_dongtaifengxian set flag='" + strfg + "',sp1='0',sp2='0',spid1='0',spid2='0',setTime='" + DateTime.Now + "' where id=" + strid;
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