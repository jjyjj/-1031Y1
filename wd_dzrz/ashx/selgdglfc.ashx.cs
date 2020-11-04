﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace MarketInfo.wd_dzrz.ashx
{
    /// <summary>
    /// selgdglfc 的摘要说明
    /// </summary>
    public class selgdglfc : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string StrJson = "";
            string strid = context.Request.Form["id"];
            string StrSql = "select  * from dbo.t_guandao_glfc where  gd_id=" + strid;
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