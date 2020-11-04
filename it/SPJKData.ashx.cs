﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace MarketInfo.it
{
    /// <summary>
    /// SPJKData 的摘要说明
    /// </summary>
    public class SPJKData : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string strid = context.Request.Form["id"];
            string StrSql = "select  * from dbo.t_shipinjiankong where s_id='" + strid + "' ";
            DataTable dt = WXDBUtility.SqlHelper.GetDataTable(StrSql);
            string StrJson = WXDBUtility.JsonHelper.DataTableToJson(dt);



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