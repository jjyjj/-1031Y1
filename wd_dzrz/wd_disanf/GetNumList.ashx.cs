using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;
using System.Web.SessionState;

namespace MarketInfo.wd_dzrz.wd_disanf
{
    /// <summary>
    /// GetNumList 的摘要说明
    /// </summary>
    public class GetNumList : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string result = UpdateNum();
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
        /// <summary>
        /// 获取单位ID
        /// </summary>
        public List<string> Result_()
        {
            List<string> dwlist = new List<string>();//单位
            string sqldw = "select z_id from dbo.T_Dsan_Num";
            DataTable dwdt = WXDBUtility.SqlHelper.GetDataTable(sqldw);
            if (dwdt != null)
            {
                for (int i = 0; i < dwdt.Rows.Count; i++)
                {
                    dwlist.Add(dwdt.Rows[i]["z_id"].ToString());
                }
            }
            return dwlist;
        }
        /// <summary>
        /// 修改
        /// </summary>
        public string UpdateNum()
        {
            string result = "保存失败";
            List<string> listzid = Result_();
            if (listzid.Count == 0) { result = "无数据"; }
            string pq = string.Empty;//片区
            string dw = string.Empty;//单位
            int xz = 0;//新增
            int yk = 0;//预控
            int jh = 0;//监护
            int jrjc = 0;//本日站内检查？
            string StrSql = "";
            try
            {
                foreach (string zid in listzid)
                {
                    if (!string.IsNullOrWhiteSpace(zid))
                    {
                        string sqldw = "select  *,(select zname from dbo.T_ZYQ_INFO where zid in (select  zpid from dbo.T_ZYQ_INFO where zid=" + zid + ")) parent from dbo.T_ZYQ_INFO where zid=" + zid;
                        string sqlxz = "select count(1) from dbo.T_Dsan_xinzengshigong where  sp1='1' and sp2='1' and z_id=" + zid;
                        string sqlyk = "select count(1) from dbo.T_Dsan_shigong  where  sp1='1' and sp2='1' and z_id=" + zid + " and sgjd=0";
                        string sqljh = "select count(1) from dbo.T_Dsan_jindu where  sp1='1' and sp2='1' and z_id=" + zid;
                        string sqljrjc = " select count(1) from T_Dsan_jiancha where  sp1='1' and sp2='1' and DateDiff(dd,settime ,getdate())=0 and z_id=" + zid;


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

                        StrSql = "update T_Dsan_Num set pq='" + pq + "',dw='" + dw + "',xz='" + xz + "',yk='" + yk + "',jh='" + jh + "',jrjc='" + jrjc + "' where z_id=" + zid;

                        int res = WXDBUtility.SqlHelper.ExecuteSql(StrSql);
                        if (res > 0)
                        {
                            result = "0";
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                result = ex.Message;
            }
            return result;

        }
    }
}