using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketInfo.wd_dzrz.ashx
{
    /// <summary>
    /// upqita 的摘要说明
    /// </summary>
    public class upqita : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string result = "保存失败"; 
            string strid = context.Request.Form["id"];
            string strflag = context.Request.Form["fg"];
            string strbz = context.Request.Form["bz"];


            string StrSql = "update t_qita set sprid1='0',sp1='0',sprid2='0',sp2='0',sprid3='0',sp3='0', q_bz='" + strbz + "',flag='" + strflag + "' where q_id=" + strid;
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