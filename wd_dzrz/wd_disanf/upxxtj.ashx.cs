﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.SessionState;

namespace MarketInfo.wd_dzrz.wd_disanf
{
    /// <summary>
    /// upxxtj 的摘要说明
    /// </summary>
    public class upxxtj : IHttpHandler, IRequiresSessionState 
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
            string zid = context.Request.Form["zid"];




            // int ljdc = int.Parse(context.Request.Form["ljdc"]);

            string pq = string.Empty;//片区
            string dw = string.Empty;//单位
            int xz = 0;//新增
            int yk = 0;//预控
            int jh = 0;//监护
            string ywg_dx = context.Request.Form["ywg_dx"]; //其中大型
            int jrjc = 0;//本日站内检查？


            string sqldw = "select  *,(select zname from dbo.T_ZYQ_INFO where zid in (select  zpid from dbo.T_ZYQ_INFO where zid=" + zid + ")) parent from dbo.T_ZYQ_INFO where zid='" + zid + "'";
            string sqlxz = "select count(1) from dbo.T_Dsan_xinzengshigong where  sp1='1' and sp2='1' and z_id='" + zid + "'";
            string sqlyk = "select count(1) from dbo.T_Dsan_shigong  where  sp1='1' and sp2='1' and z_id='" + zid + "' and sgjd=0";
            string sqljh = "select count(1) from dbo.T_Dsan_jindu where  sp1='1' and sp2='1' and z_id='" + zid+"'";
            string sqljrjc = " select count(1) from T_Dsan_jiancha where  sp1='1' and sp2='1' and DateDiff(dd,settime ,getdate())=0 and z_id='" + zid + "'";

            string ywg = context.Request.Form["ywg"];//已完工
            string zzsg = context.Request.Form["zzsg"];//正在施工
            int ljsg = (Convert.ToInt32(ywg) + Convert.ToInt32(zzsg));//累计

            string StrSql = "";

            try
            {
                DataTable dt = WXDBUtility.SqlHelper.GetDataTable(sqldw);
                if (dt != null)
                {
                    pq = dt.Rows[0]["parent"].ToString();
                    dw = dt.Rows[0]["zname"].ToString();
                }
                xz = Convert.ToInt32(WXDBUtility.SqlHelper.GetSingle(sqlxz));
                yk = Convert.ToInt32(WXDBUtility.SqlHelper.GetSingle(sqlyk));
                jh = Convert.ToInt32(WXDBUtility.SqlHelper.GetSingle(sqljh));
                jrjc = Convert.ToInt32(WXDBUtility.SqlHelper.GetSingle(sqljrjc));

                StrSql = "update T_Dsan_Num set ywg='" + ywg + "',zzsg='" + zzsg + "',ljsg='" + ljsg + "',pq='" + pq + "',dw='" + dw + "',xz='" + xz + "',yk='" + yk + "',jh='" + jh + "',jrjc='" + jrjc + "',ywg_dx='" + ywg_dx + "',t_id='" + strtid + "' where id=" + strid;

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
        /// <summary>
        /// 判断时间
        /// </summary>
        /// <param name="timeStr"></param>
        /// <returns></returns>
        protected bool getTimeSpan(string timeStr)
        {
            //判断当前时间是否在工作时间段内
            string _strWorkingDayAM = "00:00";
            string _strWorkingDayPM = "23:59";
            TimeSpan dspWorkingDayAM = DateTime.Parse(_strWorkingDayAM).TimeOfDay;
            TimeSpan dspWorkingDayPM = DateTime.Parse(_strWorkingDayPM).TimeOfDay;

            //string time1 = "2017-2-17 8:10:00";
            DateTime t1 = Convert.ToDateTime(timeStr);

            TimeSpan dspNow = t1.TimeOfDay;
            if (dspNow > dspWorkingDayAM && dspNow < dspWorkingDayPM)
            {
                return true;
            }
            return false;
        } 


    }
}