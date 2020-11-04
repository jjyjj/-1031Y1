using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Data;

namespace MarketInfo.it
{
    /// <summary>
    /// SP_BG 的摘要说明
    /// </summary>
    public class SP_BG : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string result = "-1";
            string strtid = context.Session["CUR_TID"].ToString();
            string strzid = context.Session["CUR_ZID"].ToString();
            string strzpid = context.Session["CUR_PZID"].ToString();
            string strtjtid = context.Request.Form["TID"].ToString();
            string strreason = context.Request.Form["Reason"].ToString();
            string strflag = context.Request.Form["TYPE"].ToString();
            string ID = context.Request.Form["ID"].ToString();
            //String strup = "";
            //strflag=1审批通过，更新t_user_bg表 然后更新t_user_info表
            if (strflag == "1")
            {
                String Strsqlup = "update T_USER_BG set sp1='1',spid1='" + strtid + "',reason1='" + strreason + "'  where id='" +ID+ "'";
                int res = WXDBUtility.SqlHelper.ExecuteSql(Strsqlup);
                if (res > 0)
                {
                    string ZID = "";
                    String sqlselt = "select n_zid from T_USER_BG where id='" +ID+ "'";
                    DataTable tb1 = WXDBUtility.SqlHelper.GetDataTable(sqlselt);
                    if (tb1 != null)
                    {
                        ZID = tb1.Rows[0]["n_zid"].ToString();
                    }
                    String strsqlup = "update T_USER_INFO set ZPID='" + strzid + "',ZID='" + ZID + "' where T_ID='" + strtjtid + "'";
                    int res2 = WXDBUtility.SqlHelper.ExecuteSql(strsqlup);
                    if (res2 > 0) {
                        //审批通过成功
                        result = "1";
                      
                    }
                }
            }
            //strflag=-1审批退回更新t_user_bg表 sp=-1，reason=传值，spid=strtid
            if (strflag == "-1")
            {
                String strup = "update T_USER_BG set sp1='-1',spid1='" + strtid + "',reason1='" + strreason + "'  where id='" + context.Request.Form["ID "].ToString() + "'";
                 int res = WXDBUtility.SqlHelper.ExecuteSql(strup);
                if (res > 0)
                {  
                    //审批退回成功
                 result = "-1";                   
                }
            }
            try
            {
                
            }
            catch (Exception ex)
            {
                result = "-2";
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