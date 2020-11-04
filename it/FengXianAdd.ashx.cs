using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketInfo.it
{
    /// <summary>
    /// FengXianAdd 的摘要说明
    /// </summary>
    public class FengXianAdd : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string result = "保存失败";
            string strtid = context.Request.Form["tid"];
            string strfg = context.Request.Form["fg"];
            string strzq = context.Request.Form["zq"];
            string strtype = context.Request.Form["type"];
            string strxzzh = context.Request.Form["xzzh"];//今日是否有开挖作业
            string strgcm = context.Request.Form["gcm"];
            string strgdgl = context.Request.Form["gdgl"];
            string strisag = context.Request.Form["isag"];
            string strgk = context.Request.Form["gk"];
            string strjrsg = context.Request.Form["jrsg"];
            string strmrjh = context.Request.Form["mrjh"];
            string strxzjh = context.Request.Form["xzjh"];
            string strname = context.Request.Form["name"];
            string strremark = context.Request.Form["remark"];
            string strtxtzh = context.Request.Form["txtzh"];
            

            string StrSql = "insert t_dongtaifengxian(fx_type,fx_xzzh,fx_gcm,fx_gdgl,fx_gcqk_and_gdgx,fx_jrsg,fx_mrjh,fx_name,fx_remark,flag,t_id,fx_zh) values";
            StrSql += "('" + strtype + "','" + strxzzh + "','" + strgcm + "','" + strgdgl + "','" + strisag + "','" + strjrsg + "','" + strmrjh + "','" + strname + "'";
            StrSql += ",'" + strremark + "','" + strfg + "','" + strtid + "','"+ strtxtzh + "')";
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