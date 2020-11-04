using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WXDBUtility;

namespace MarketInfo.wd_msg
{
    public partial class wd_tongxing_info : System.Web.UI.Page
    {
        public DataTable tb = null;
        public DataTable contenttb = null;
        public DataTable LKtb = null;
        
        public string strtime = "";
        public string strinfo = "";
        public string strconten = "";
        public string strlk= "";
        public string isok = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //_GetVisitor();
                Response.Redirect(System.Configuration.ConfigurationManager.ConnectionStrings["GSWX_IP"].ToString());
            }
        }
        //默认显示当天信息
        private void _GetData()
        {
             string sqlStr = "";
             sqlStr = "select *  from T_ZL_INFO order by ZL_ID desc";
             tb = SqlHelper.GetDataTable(sqlStr);
             if (tb != null)
             {
                 strtime = tb.Rows[0]["ZL_FS_TIME"].ToString();
                 strinfo = tb.Rows[0]["ZL_DESC"].ToString();
             }
            String sqlStr1 = "select *  from T_SHIGONG_INFO";
            contenttb = SqlHelper.GetDataTable(sqlStr1);
            if (contenttb != null)
             {
                 strconten = contenttb.Rows[0]["HTML"].ToString();
                 // strinfo = contenttb.Rows[0]["ZL_DESC"].ToString();
             }
            String sqlStr2 = "select *  from T_SHIGONG_INFO";
            LKtb = SqlHelper.GetDataTable(sqlStr2);
            if (LKtb != null)
            {
                strlk = LKtb.Rows[0]["LK"].ToString();
                // strinfo = contenttb.Rows[0]["ZL_DESC"].ToString();
            }
            String sqlStr3 = "select *  from T_DITU";
            DataTable tb3 = SqlHelper.GetDataTable(sqlStr3);
            if (tb3 != null)
            {
                isok = tb3.Rows[0]["type"].ToString();
                // strinfo = contenttb.Rows[0]["ZL_DESC"].ToString();
            }

        }
        //选择编辑时
        //private void _GetDataold(string strzid)
        //{
        //    string sqlStr = "";
        //    int zid = Convert.ToInt32(strzid);
        //    sqlStr = "select *  from T_ZL_INFO where ZL_ID=" + zid;
        //    tb = SqlHelper.GetDataTable(sqlStr);
        //    if (tb != null)
        //    {
        //        strtime = tb.Rows[0]["ZL_FS_TIME"].ToString();
        //        strinfo = tb.Rows[0]["ZL_DESC"].ToString();
        //    }
        //}
        public void _GetVisitor()
        {
            String strIP = GetIP();
            //if (strIP != "127.0.0.1")
            {
                String strSQL2 = "Insert into T_IP(IP_ADD) Values('" + strIP + "')";
                int res = WXDBUtility.SqlHelper.ExecuteSql(strSQL2);
            }
        }
        public static string GetIP()
        {
            //如果客户端使用了代理服务器，则利用HTTP_X_FORWARDED_FOR找到客户端IP地址
            try
            {
                string userHostAddress = userHostAddress = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
                return userHostAddress;
            }
            catch (Exception ex)
            {

            }
            return "127.0.0.1";
        }
       
    }
}