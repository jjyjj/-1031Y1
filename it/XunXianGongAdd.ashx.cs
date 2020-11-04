using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketInfo.it
{
    /// <summary>
    /// XunXianGongAdd 的摘要说明
    /// </summary>
    public class XunXianGongAdd : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            string result = "保存失败";
            string strtid = context.Request.Form["tid"];
            string strfg = context.Request.Form["fg"];
            string strzs = context.Request.Form["zs"];
            string strqj = context.Request.Form["qj"];
            string strjc = context.Request.Form["jc"];
            string strname = context.Request.Form["name"];
            string strwt = context.Request.Form["wt"];
            string strjf = context.Request.Form["jf"];
            string StrSql = "insert T_xun_xian_gong(x_zongshu,x_jrqingjia,x_jrjiancha,x_name,x_wenti,x_jiangli,flag,t_id)";
            StrSql += "values('" + strzs + "','" + strqj + "','" + strjc + "','" + strname + "','" + strwt + "','" + strjf + "','" + strfg + "','" + strtid + "')";
            try {
                int res = WXDBUtility.SqlHelper.ExecuteSql(StrSql);
                if (res > 0) {
                    result = "0";
                }
            }
            catch (Exception ex) {
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