using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace MarketInfo.wd_dzrz.wd_disanf
{
    /// <summary>
    /// addjhd 的摘要说明
    /// </summary>
    public class addjhd : IHttpHandler, IRequiresSessionState 
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

            string strjhd = context.Request.Form["jhd"];
            string strjhname = context.Request.Form["jhname"];
            string strjhphone = context.Request.Form["jhphone"];
            string strjhtype = context.Request.Form["jhtype"];
            string strjd = context.Request.Form["jd"];
            string zid = context.Request.Form["zid"];


            string StrSql = "insert T_Dsan_jindu(jhd,jhname,jhphone,jhtype,jd,t_id,z_id)";
            StrSql += " values('" + strjhd + "','" + strjhname + "','" + strjhphone + "','" + strjhtype + "','" + strjd + "','" + strtid + "','" + zid + "')";
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