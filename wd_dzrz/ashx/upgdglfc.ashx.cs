using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketInfo.wd_dzrz.ashx
{
    /// <summary>
    /// upgdglfc 的摘要说明
    /// </summary>
    public class upgdglfc : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string result = "保存失败";
            string strid = context.Request.Form["id"];
            string strflag = context.Request.Form["fg"];
            string a = context.Request.Form["a"];
            string b = context.Request.Form["b"];
            string c = context.Request.Form["c"];
            string d = context.Request.Form["d"];
            string e = context.Request.Form["e"];
            string f = context.Request.Form["f"];
            string g = context.Request.Form["g"];
            string h = context.Request.Form["h"];
            string i = context.Request.Form["i"];
            string StrSql = "update t_guandao_glfc set gd_xiaqu_gdlc='" + a + "',gd_xiaqu_gllc='" + b + "',gd_jinri_fcgdlc='" + c + "',gd_jinri_fcgllc='" + d + "',gd_faxian_wt='" + e + "'," +
                              "gd_fuce_lc='" + f + "',gd_fh='" + g + "',gd_wt='" + h + "',gd_fuce_jd='" + i + "', flag='" + strflag + "',sp1='0',sp2='0',sp3='0',spid1='0',spid2='0',spid3='0'  where gd_id=" + strid;
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