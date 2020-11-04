﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace MarketInfo.it
{
    /// <summary>
    /// SPkwzy 的摘要说明
    /// </summary>
    public class SPkwzy : IHttpHandler, IRequiresSessionState
    {
        public void ProcessRequest(HttpContext context)
        {
            //Reason
            string result;
            String strsql = "";
            //flag=0  使其退回的可以通过编辑之后再次提交
            if (context.Request.Form["TYPE"] == "-1")
            {
                strsql = "UPDATE t_dongtaifengxian set sp" + context.Request.Form["sp"] + "='" + context.Request.Form["TYPE"] + "' ,spid" + context.Request.Form["sp"] + "='" + context.Session["CUR_TID"] + "',reason" + context.Request.Form["sp"] + "='" + context.Request.Form["Reason"] + "',setTime='" + DateTime.Now.ToLocalTime() + "',flag='0'  where id='" + context.Request.Form["ID"] + "'";

            }
            else {
                strsql = "UPDATE t_dongtaifengxian set sp" + context.Request.Form["sp"] + "='" + context.Request.Form["TYPE"] + "' ,spid" + context.Request.Form["sp"] + "='" + context.Session["CUR_TID"] + "',reason" + context.Request.Form["sp"] + "='" + context.Request.Form["Reason"] + "',setTime='" + DateTime.Now.ToLocalTime() + "'  where id='" + context.Request.Form["ID"] + "'";
               
            }
            int res = WXDBUtility.SqlHelper.ExecuteSql(strsql);
            if (res > 0)
            {
                result = "1";
            }
            else
            {
                result = "-1";
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