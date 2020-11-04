using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace MarketInfo.wd_dzrz.wd_zfxc
{
    /// <summary>
    /// SelUserByType 的摘要说明
    /// </summary>
    public class SelUserByType : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string StrJson = "";
            string strtid = context.Request.Form["tid"];
            if (context.Session["CUR_TID"] != null)
            {
                strtid = context.Session["CUR_TID"].ToString();
            }
            string strtype = context.Request.Form["type"];
            string StrSql = "select  * from dbo.T_XCZF_User  order by id desc";
            if (!string.IsNullOrWhiteSpace(strtype))
            {
                StrSql = "select  * from dbo.T_XCZF_User where  type='" + strtype + "'";
            }
            try
            {
                DataTable dt = WXDBUtility.SqlHelper.GetDataTable(StrSql);
                StrJson = WXDBUtility.JsonHelper.DataTableToJson(dt);
            }
            catch (Exception ex)
            {
                StrJson = "-1";
            }


            context.Response.ContentType = "json";
            context.Response.Write(StrJson);
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