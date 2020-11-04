using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.SessionState;

namespace MarketInfo.wd_shenpi.itface
{
    /// <summary>
    /// ygtongzhi 的摘要说明
    /// </summary>
    public class ygtongzhi : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            int data = 0;
            string strtpe = context.Session["CUR_T_ID"].ToString();//TYPE
            string strtid = context.Request.Form["tid"];
            
            String StrSql2 = "select count(*) as num from T_File_1 ";
            DataTable dt2 = WXDBUtility.SqlHelper.GetDataTable(StrSql2);
            int count2 = Convert.ToInt16(dt2.Rows[0]["num"]);
            data = count2;

            try
            {
                data = data + 0;
            }
            catch (Exception ex)
            {
                data = -1;
            }
            context.Response.ContentType = data.ToString();
            context.Response.Write(data);
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