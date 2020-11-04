using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketInfo.it
{
    /// <summary>
    /// XunXianGongUpdate 修改
    /// </summary>
    public class XunXianGongUpdate : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string result = "保存失败";
            string strtid = context.Request.Form["tid"];
            string strid = context.Request.Form["id"];
            string strfg = context.Request.Form["fg"];
            string strzs = context.Request.Form["zs"];
            string strqj = context.Request.Form["qj"];
            string strjc = context.Request.Form["jc"];
            string strname = context.Request.Form["name"];
            string strwt = context.Request.Form["wt"];
            string strjf = context.Request.Form["jf"];
            string StrSql = "update T_xun_xian_gong set x_zongshu='" + strzs + "',x_jrqingjia='" + strqj + "',x_jrjiancha='"+strjc+"'";
            StrSql += ",x_name='" + strname + "',x_wenti='" + strwt + "',x_jiangli='" + strjf + "',flag='" + strfg + "',t_id='" + strtid + "' where id=" + strid;
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