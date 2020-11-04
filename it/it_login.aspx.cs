using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;


namespace MarketInfo.it
{
    public partial class it_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Islogin();
        }
        public void Islogin()
        {
            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "LOGIN") return;
            String strnowdate = DateTime.Now.ToShortDateString().ToString();

            String strSQL = "Select * from T_USER_INFO where T_UNAME='" + Request.QueryString["UNAME"]
                + "' and T_PWD='" +  Request.QueryString["UP"] + "'";
            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb != null)
            {
                Session["U_LoginName"] = Request.QueryString["UNAME"];
                Session["CUR_T_ID"] = tb.Rows[0]["T_TYPE"].ToString();
                Session["CUR_TID"] = tb.Rows[0]["T_ID"].ToString();
                Session["Name"] = Request.QueryString["T_NAME"];

                Session["CUR_ZID"] = tb.Rows[0]["ZID"].ToString();
                Session["CUR_PZID"] = tb.Rows[0]["ZPID"].ToString();
                //登录日志
                //筛选这些tid是否处于休假状态，是flag为0
                String StrSqlq = "select  T_ID from dbo.T_WORK_INFO1 where  (T_TYPEID='1' or T_TYPEID='2') and DATEDIFF (S, T_WSTART,'" + strnowdate + "')  > 0 and DATEDIFF(S,T_WEND,'" + strnowdate + "' )<0  and T_ID='" + Session["CUR_TID"] + "'";
                string strflag = "1";
                DataTable t = WXDBUtility.SqlHelper.GetDataTable(StrSqlq);
                if (t != null)
                {
                    strflag = "0";
                }
                //获取客户端IP
                String strip = getip();
                //查询今天是否有过登录记录，只记录一次
                String strsqlo = "select T_ID from t_log where T_ID ='"+ tb.Rows[0]["T_ID"].ToString() + "' and DateDiff(dd,trctime ,getdate())=0";
                DataTable tbo = WXDBUtility.SqlHelper.GetDataTable(strsqlo);
                if (tbo == null)
                {
                    string strzid = tb.Rows[0]["ZID"].ToString();
                    if (Session["CUR_T_ID"].ToString() == "3") {
                        strzid = tb.Rows[0]["ZPID"].ToString();
                    }
                    String StrSql = "INSERT INTO t_log([T_ID],[ip],zid,flag)  VALUES ('" + tb.Rows[0]["T_ID"].ToString() + "','" + strip + "','" + strzid + "','"+ strflag + "')";
                    int red = WXDBUtility.SqlHelper.ExecuteSql(StrSql);
                }
                else {
                    String sql = "update t_log set ip='" + strip + "' where  DateDiff(dd,trctime ,getdate())=0 and T_ID='" + tb.Rows[0]["T_ID"].ToString() + "'";
                    int rer = WXDBUtility.SqlHelper.ExecuteSql(sql);
                }
                Response.Write("1");//成功
                return;

            }
            else
            {
                Response.Write("-1");//失败
                return;
                //Response.Write("<Script Language=JavaScript>alert('登录失败，账号或密码错误！');</Script>");
            }            
        }

        private string getip()
        {
            string _ip = String.Empty;
            foreach (IPAddress IPA in Dns.GetHostAddresses(HttpContext.Current.Request.UserHostAddress))
            {
                if (IPA.AddressFamily.ToString() == "InterNetwork")
                {
                    _ip = IPA.ToString();
                    break;
                }
            }
            if (_ip != String.Empty)
            {
                return _ip;
            }
            foreach (IPAddress IPA in Dns.GetHostAddresses(Dns.GetHostName()))
            {
                if (IPA.AddressFamily.ToString() == "InterNetwork")
                {
                    _ip = IPA.ToString();
                    break;
                }
            }
            return _ip;

        }
    }
}