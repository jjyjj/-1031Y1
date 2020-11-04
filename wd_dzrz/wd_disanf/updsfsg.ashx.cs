using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Data;

namespace MarketInfo.wd_dzrz.wd_disanf
{
    /// <summary>
    /// updsfsg 的摘要说明
    /// </summary>
    public class updsfsg : IHttpHandler, IRequiresSessionState 
    {

        public void ProcessRequest(HttpContext context)
        {
            string result = "保存失败";
            string strtid = context.Request.Form["tid"];
            if (context.Session["CUR_TID"] != null)
            {
                strtid = context.Session["CUR_TID"].ToString();
            }
            string strfg = context.Request.Form["fg"];
            string strid = context.Request.Form["id"];

            string zczyq = context.Request.Form["zczyq"];
            string xzqyzh = context.Request.Form["xzqyzh"];
            string gcmc = context.Request.Form["gcmc"];
            string ms = context.Request.Form["ms"];
            string lxfs = context.Request.Form["lxfs"];
            string gdglsm = context.Request.Form["gdglsm"];
            string startime = context.Request.Form["startime"];
            string sgjd = context.Request.Form["sgjd"];
            string is_hfff_jc = context.Request.Form["is_hfff_jc"];
            string gdms = context.Request.Form["gdms"];
            string sg_isns = context.Request.Form["sg_isns"];
            string pshjl = context.Request.Form["pshjl"];
            string is_jd = context.Request.Form["is_jd"];
            string bzsg = context.Request.Form["bzsg"];
            string xzsg = context.Request.Form["xzsg"];
            string zcfzr = context.Request.Form["zcfzr"];
            string remark = context.Request.Form["remark"];
            string zh= context.Request.Form["zh"];
            string sql = "select  * from dbo.T_ZYQ_INFO where zid=" + zczyq + " order by zid desc";
            string zid = context.Request.Form["zczyq"];

            try
            {
                DataTable dt = WXDBUtility.SqlHelper.GetDataTable(sql);
                if (dt != null)
                {
                    zczyq = dt.Rows[0]["zname"].ToString();
                }
                string StrSql = "update T_Dsan_shigong set zczyq='" + zczyq + "',zh='"+ zh + "',xzqyzh='" + xzqyzh + "',gcmc='" + gcmc + "',ms='" + ms + "',lxfs='" + lxfs + "',gdglsm='" + gdglsm + "',";
                StrSql += "startime='" + startime + "',sgjd='" + sgjd + "',is_hfff_jc='" + is_hfff_jc + "',gdms='" + gdms + "',sg_isns='" + sg_isns + "',pshjl='" + pshjl + "',is_jd='" + is_jd + "',";
                StrSql += "bzsg='" + bzsg + "',xzsg='" + xzsg + "',zcfzr='" + zcfzr + "',remark='" + remark + "',t_id='" + strtid + "',z_id='" + zid + "',sp1='0',sp2='0',sp3='0',spid1='0',spid2='0',spid3='0',setTime=getdate()  where id=" + strid;
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