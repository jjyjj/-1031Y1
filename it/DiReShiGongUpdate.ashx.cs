using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketInfo.it
{
    /// <summary>
    /// DiReShiGongUpdate 修改
    /// </summary>
    public class DiReShiGongUpdate : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string tid = context.Request.Form["tid"];
            string strid = context.Request.Form["id"]; 
            string result = "保存失败";
            string strfg = context.Request.Form["fg"];
            string strsl = context.Request.Form["sl"];
            string strxm = context.Request.Form["xm"];
            string strwz = context.Request.Form["wz"];
            string strjd = context.Request.Form["jd"];
           
            string StrSql = "update t_DIER_shigong set er_xiangmu='" + strsl
                + "',er_zydw='" + strxm + "',er_xgdw='" + strwz + "',er_zyqk='" + strjd + "',er_wt='" + context.Request.Form["txtfaxianwenti"] +
                "',er_gz='" + context.Request.Form["txtwentigenzong"] + "',er_time='" + DateTime.Now + "'";
            StrSql += ",er_qt='" + context.Request.Form["txtqita"] + "' ,flag='" + strfg + "',sp1='0',spid1='0',sp2='0',spid2='0',sp3='0',spid3='0' where id=" + strid;
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