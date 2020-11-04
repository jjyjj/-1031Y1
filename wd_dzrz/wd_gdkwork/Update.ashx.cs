using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketInfo.wd_dzrz.wd_gdkwork
{
    /// <summary>
    /// Update 的摘要说明
    /// </summary>
    public class Update : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            //  fg: fg, id: txtid, txtddup: txtddup, txtworkup: txtworkup, txtqtup: txtqtup}, function (data) {

            string result = "保存失败";
            string strid = context.Request.Form["id"];
            string strflag = context.Request.Form["fg"];

        //fg: fg, id: txtid, txtddup: txtddup, txtworkup: txtworkup, txtqtup: txtqtup, txtbzgzup: txtbzgzup
        //, txtxzapup: txtxzapup
            string StrSql = "update t_gdk_workday set flag='" + strflag + "',didian='"+ context.Request.Form["txtddup"] + "',zhuyao_gongzuo='"+ context.Request.Form["txtworkup"] + "',qita='" + context.Request.Form["txtqtup"] + "',benzhou_zhongdian='"+ context.Request.Form["txtbzgzup"] 
                + "',xiahzou_jihua='"+ context.Request.Form["txtxzapup"] + "'   where id='" + strid + "'";
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