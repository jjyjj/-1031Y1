using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.SessionState;

namespace MarketInfo.wd_dzrz.wd_file
{
    /// <summary>
    /// GetListBind 的摘要说明
    /// </summary>
    public class GetListBind : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string StrJson = "";
             
            string strtid = string.Empty;//用户ID
            string hideid = context.Request.Form["hideid"];
            if (context.Session["CUR_TID"] != null)
            {
                strtid = context.Session["CUR_TID"].ToString();
            } 

            string StrSql = "select  * from dbo.T_File";

            if (!string.IsNullOrWhiteSpace(hideid))
            {
                string strid = context.Session["file_id"].ToString();
                if (context.Session["Is_File"] != null)
                {
                    if (context.Session["Is_File"].ToString() == "A")
                    { StrSql = "select  * from dbo.T_File where id=" + strid; }
                    else
                    { StrSql = "select  * from dbo.T_File_1 where id=" + strid; }

                    //(select count(*) from T_File where id='" + strid+"')+(select count(*) from T_File_1 where id='"+strid+"') as num
                }
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