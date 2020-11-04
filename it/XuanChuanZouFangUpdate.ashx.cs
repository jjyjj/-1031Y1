using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketInfo.it
{
    /// <summary>
    /// XuanChuanZouFangUpdate 的摘要说明
    /// </summary>
    public class XuanChuanZouFangUpdate : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string result = "保存失败";
            string strtid = context.Request.Form["tid"];
            string strfg = context.Request.Form["fg"];
            string strid = context.Request.Form["id"];

            string strxjbm = context.Request.Form["xjbm"];
            string strxzbm = context.Request.Form["xzbm"];
            string strcw = context.Request.Form["cw"];
            string strjxs = context.Request.Form["jxs"];
            string strxxy = context.Request.Form["xxy"];
            string strnthz = context.Request.Form["nthz"];
            string strjrnum = context.Request.Form["jrnum"];

            string strjxsall = context.Request.Form["alljxs"];
            string strnthzall = context.Request.Form["allnthz"];
            string strxxyall = context.Request.Form["allxxy"];

            string StrSql = "update T_xuan_chuan_zou_fang set zf_xjbm='" + strxjbm + "',zf_xzbm='" + strxzbm + "',zf_cw='" + strcw + "',zf_jxs='" + strjxs + "',";
            StrSql += "zf_xxy='" + strxxy + "',zf_nthz='" + strnthz + "',zf_jr_num='" + strjrnum + "',flag='" + strfg + "',t_id='" + strtid + "'," +
                "zf_jxs_all='" + strjxsall + "',zf_nthz_all='" + strnthzall + "',zf_xxy_all='" + strxxyall + "',sp1='0',spid1='0',sp2='0',spid2='0',sp3='0',spid3='0' where id=" + strid;
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