using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace MarketInfo.wd_dzrz.wd_gdkwork
{
    /// <summary>
    /// Addwork 的摘要说明
    /// </summary>
    public class Addwork : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string result = "保存失败";
            string strtid ="";
            if (context.Session["CUR_TID"] != null)
            {
                strtid = context.Session["CUR_TID"].ToString();
            }
            string strwork = context.Request.Form["txtwork"];
            string strdd = context.Request.Form["txtdd"];
            string strflag = context.Request.Form["fg"];
            string txtqt = context.Request.Form["txtqt"];

            // fg: fg, txtdd: txtdd, txtwork: txtwork, txtqt: txtqt, txtbzgz: txtbzgz, txtxzap: txtxzap
            string StrSql = "insert t_gdk_workday(zhuyao_gongzuo,didian,t_id,flag,qita,benzhou_zhongdian,xiahzou_jihua) values";
            StrSql += "('" + strwork + "','" + strdd + "','"+ strtid + "','"+ strflag + "','" + txtqt + "','" + context.Request.Form["txtbzgz"]  + "','" + context.Request.Form["txtxzap"] + "')";
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