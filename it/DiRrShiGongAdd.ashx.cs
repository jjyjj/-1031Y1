using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.SessionState;

namespace MarketInfo.it
{
    /// <summary>
    /// DiRrShiGongAdd 新增/暂存/缓存
    /// </summary>
    public class DiRrShiGongAdd : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
          
            string result = "保存失败";
            string strfg = context.Request.Form["fg"];
            string tid = context.Request.Form["tid"];
            String strtpe = context.Session["CUR_T_ID"].ToString();
           // string strtype_n = Session["CUR_T_ID"].ToString();
            string strzid_n = context.Session["CUR_ZID"].ToString();
            string strzpid_n = context.Session["CUR_PZID"].ToString();
            string StrSql = "";
            if (strtpe == "2")
            {
                StrSql = "insert t_DIER_shigong(er_xiangmu,er_zydw,er_xgdw,er_zyqk,flag,t_id,er_wt,er_gz,er_qt,sp1,spid1,reason1,ntype,zid,zpid)";
                StrSql += "values('" + context.Request.Form["txtmc"] + "','" + context.Request.Form["txtzydw"] + "','" + context.Request.Form["txtxgdw"] + "','" + context.Request.Form["txtzyqk"] + "','" + strfg + "','" + tid
                    + "','" + context.Request.Form["txtfxwt"] + "','" + context.Request.Form["txtwtzggz"] + "','" + context.Request.Form["txtqt"] + "','1','" + tid + "','本人直接提交！','" + strtpe + "','" + strzid_n + "','" + strzpid_n + "')";
            }
            else { 
            StrSql = "insert t_DIER_shigong(er_xiangmu,er_zydw,er_xgdw,er_zyqk,flag,t_id,er_wt,er_gz,er_qt,ntype,zid,zpid)";
            StrSql += "values('" + context.Request.Form["txtmc"] + "','" + context.Request.Form["txtzydw"] + "','" + context.Request.Form["txtxgdw"] + "','" + context.Request.Form["txtzyqk"] + "','" + strfg + "','" + tid
                + "','" + context.Request.Form["txtfxwt"] + "','" + context.Request.Form["txtwtzggz"] + "','" + context.Request.Form["txtqt"] + "','" + strtpe + "','" + strzid_n + "','" + strzpid_n + "')";
            }
                try
            {
                int res = WXDBUtility.SqlHelper.ExecuteSql(StrSql);
                if (res > 0)
                { 
                    result = "0";
                    //更新logo表，填写工作视为在线 2020-9-29  齐
                    WXDBUtility.Updatelog.Uplgo(tid);
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