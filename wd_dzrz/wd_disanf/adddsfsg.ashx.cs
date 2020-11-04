using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Data;

namespace MarketInfo.wd_dzrz.wd_disanf
{
    /// <summary>
    /// adddsfsg 的摘要说明
    /// </summary>
    public class adddsfsg : IHttpHandler, IRequiresSessionState 
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
            string zh = context.Request.Form["zh"]; 
            string sql = "select  * from dbo.T_ZYQ_INFO where zid="+zcfzr+" order by zid desc";
            string zid = context.Request.Form["zczyq"];
            try
            {
                DataTable dt= WXDBUtility.SqlHelper.GetDataTable(sql);
                if (dt != null) {
                    zczyq = dt.Rows[0]["zname"].ToString();
                }
                string StrSql = "insert T_Dsan_shigong(zh,zczyq,xzqyzh,gcmc,ms,lxfs,gdglsm,startime,sgjd,is_hfff_jc,gdms,sg_isns,pshjl,is_jd,bzsg,xzsg,zcfzr,remark,t_id,z_id) values";
                StrSql += "('"+zh+"','" + zczyq + "','" + xzqyzh + "','" + gcmc + "','" + ms + "','" + lxfs + "','" + gdglsm + "','" + startime + "','" + sgjd + "','" + is_hfff_jc + "',";
                StrSql += "'" + gdms + "','" + sg_isns + "','" + pshjl + "','" + is_jd + "','" + bzsg + "','" + xzsg + "','" + zcfzr + "','" + remark + "','" + strtid + "','" + zid + "')";
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