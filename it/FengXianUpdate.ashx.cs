using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketInfo.it
{
    /// <summary>
    /// FengXianUpdate 的摘要说明
    /// </summary>
    public class FengXianUpdate : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string result = "保存失败";
            string strtid = context.Request.Form["tid"];
            string strfg = context.Request.Form["fg"];
            string strid = context.Request.Form["id"];

            string strtypes = context.Request.Form["types"];
            string strxzzh = context.Request.Form["xzzh"];
            string strgcm = context.Request.Form["gcm"];
            string strgdgl = context.Request.Form["gdgl"];
            string strisag = context.Request.Form["isag"];
            string strgk = context.Request.Form["gk"];
            string strjrsg = context.Request.Form["jrsg"];
            string strmrjh = context.Request.Form["mrjh"];
            string strxzjh = context.Request.Form["xzjh"];
            string strname = context.Request.Form["name"];
            string strremark = context.Request.Form["remark"];
            string strtxtzhup = context.Request.Form["txtzhup"]; 
            string StrSql = "update t_dongtaifengxian set fx_xzzh='" + strxzzh + "',fx_gcm='" + strgcm + "',fx_gdgl='" + strgdgl + "',fx_type='" + strtypes + "',";
            StrSql += "fx_gcqk_and_gdgx='" + strisag + "',fx_gk='" + strgk + "',fx_jrsg='" + strjrsg + "',fx_mrjh='" + strmrjh + "',fx_xzjh='" + strxzjh + "',fx_name='" + strname + "',";
            StrSql += "fx_remark='"+strremark+"',flag='"+strfg+"',t_id='"+strtid+"',fx_zh='"+ strtxtzhup + "'  where id=" + strid;
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