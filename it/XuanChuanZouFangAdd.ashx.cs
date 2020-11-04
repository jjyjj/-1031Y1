using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketInfo.it
{
    /// <summary>
    /// XuanChuanZouFangAdd 的摘要说明
    /// </summary>
    public class XuanChuanZouFangAdd : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string result = "保存失败";
            string strtid = context.Request.Form["tid"];
            string strfg = context.Request.Form["fg"];

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
            

            string StrSql = "insert T_xuan_chuan_zou_fang (zf_xjbm,zf_xzbm,zf_cw,zf_jxs,zf_xxy,zf_nthz,zf_jr_num,flag,t_id,zf_jxs_all,zf_nthz_all,zf_xxy_all)";
            StrSql += "values('" + strxjbm + "','" + strxzbm + "','" + strcw + "','" + strjxs + "','" + strxxy + "','" + strnthz + "','" + strjrnum + "','" + strfg + "','" + strtid + "','"+ strjxsall + "','"+ strnthzall + "','"+ strxxyall + "')";
            try
            {
                int res = WXDBUtility.SqlHelper.ExecuteSql(StrSql);
                if (res > 0)
                {
                    result = "0";
                    //更新logo表，填写工作视为在线 2020-9-29  齐
                    WXDBUtility.Updatelog.Uplgo(strtid);
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