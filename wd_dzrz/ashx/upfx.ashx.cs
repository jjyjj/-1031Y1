using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketInfo.wd_dzrz.ashx
{
    /// <summary>
    /// upfx 的摘要说明
    /// </summary>
    public class upfx : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string result = "保存失败";
            string strid = context.Request.Form["id"];
            string strflag = context.Request.Form["fg"];
            string txt1 = context.Request.Form["txt1"];
            string txt2 = context.Request.Form["txt2"];
            string txt3 = context.Request.Form["txt3"];
            string txt4 = context.Request.Form["txt4"];
            string txt5 = context.Request.Form["txt5"];
            string txt6 = context.Request.Form["txt6"];
            string txt7 = context.Request.Form["txt7"];
            string txt8 = context.Request.Form["txt8"];
            string txta1 = context.Request.Form["txta1"];
            string txt9 = context.Request.Form["txt9"];
            string txt10 = context.Request.Form["txt10"];
            string txt11 = context.Request.Form["txt11"];

            string StrSql = "update dbo.t_fangxun set fx_zhanchang='" + txt1 + "',fx_xingzhengweizhi='" + txt2 + "',fx_zhongdianbuwei='" + txt3 + "',fx_leixing='" + txt4 + "'," +
                 "fx_bzxxgsfmtxj='" + txt5 + "',fx_xxgxxjg='" + txt6 + "',fx_bzxxglryxxdj='" + txt7 + "',fx_xxglryxxjg='" + txt8 + "',fx_qkxxsm='" + txta1 + "',fx_zzzx='" + txt9 + "',fx_sswh='" + txt10 + "'," +
                 "fx_qtbz='" + txt11 + "',  flag='" + strflag + "',sp1='0',sp2='0',sp3='0',spid1='0',spid2='0',spid3='0' where   fx_id=" + strid;
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