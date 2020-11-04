using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace MarketInfo.wd_dzrz.wd_disanf
{
    /// <summary>
    /// addjc 的摘要说明
    /// </summary>
    public class addjc : IHttpHandler, IRequiresSessionState 
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

            string jrjcxm = context.Request.Form["jrjcxm"];
            string fxwt = context.Request.Form["fxwt"];
            string wtzg = context.Request.Form["wtzg"];
            string qt = context.Request.Form["qt"];
            string zid = context.Request.Form["zid"];
      //      int num = int.Parse(context.Request.Form["num"]);

            string settime = DateTime.Now.ToString();



            string StrSql = "insert T_Dsan_jiancha(jrjcxm,fxwt,wtzg,qt,t_id,z_id,settime)";
            StrSql += "values('" + jrjcxm + "','" + fxwt + "','" + wtzg + "','" + qt + "','" + strtid + "','" + zid + "','" + settime + "')";
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