using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.SessionState;

namespace MarketInfo.wd_tongji
{
    /// <summary>
    /// tongzhi 的摘要说明
    /// </summary>
    public class tongzhi : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string StrJson = "";
            string strid = context.Session["CUR_TID"].ToString();//Tid
            string strtype = context.Session["CUR_T_ID"].ToString();//TYPE
            string strzid = context.Session["CUR_ZID"].ToString();
            string StrSql = "select count(1) as num from T_File_1 where DateDiff(dd,crtime ,getdate())<7";
            try
            {
                DataTable dt = WXDBUtility.SqlHelper.GetDataTable(StrSql);
                StrJson = WXDBUtility.JsonHelper.DataTableToJson(dt);
            }
            catch (Exception ex)
            {
                StrJson = "-1";
            }
            //查询出来所有管理处发的通知数
            //string strsql1 = "select count(1) as num from T_File_1 where zpid='0'";

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