using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace MarketInfo.it
{
    /// <summary>
    /// UpdateDisanfSpr 的摘要说明
    /// </summary>
    public class UpdateDisanfSpr : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string result = "保存失败";
            string strspid = "0";
            if (context.Session["CUR_TID"] != null) { strspid = context.Session["CUR_TID"].ToString(); }
            string id = context.Request.Form["id"];
            string strtables = context.Request.Form["table"];
            string strsp = context.Request.Form["sp"];
            string strtypes = context.Request.Form["types"];
            string strName = context.Request.Form["Name"];
            string StrSql = "";
            //flag=0  使其退回的可以通过编辑之后再次提交
            if (strsp == "-1")
            {
                StrSql = "update " + strtables + " set sp" + strtypes + "='" + strsp + "', spid" + strtypes + "='" + strspid + "',flag='0',reason" +
                    strtypes + "='" + strName + "'  where id=" + id;
            }
            else {
                StrSql = "update " + strtables + " set sp" + strtypes + "='" + strsp + "', spid" + strtypes + "='" + strspid + "',reason" + strtypes + "='" + strName + "' where id=" + id;
            }
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