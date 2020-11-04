using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace wxsoft
{
    public partial class it : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            _GetCnt();
            _GetTodaySDCnt();
            _GetMapX();
            _GetCntAndNum();
        }

        public void _GetCnt()
        {
            if (Request.QueryString["CMD"] == null) return;
            String strCMD = Request.QueryString["CMD"];
            if (strCMD != "GETALLCNT") return;
            String strSQL = "Select * from T_IP_NUM";
            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb != null)
            {
                Response.Write(tb.Rows[0][0].ToString());
            }           

        }

        public void _GetTodaySDCnt()
        {
            if (Request.QueryString["CMD"] == null) return;
            String strCMD = Request.QueryString["CMD"];
            if (strCMD != "GETTODAYSDCNT") return;
            String strSQL = "select DATENAME(HOUR,V_TIME) as m_h,count(*) as num from T_TODAY_IP group by DATENAME(HOUR,V_TIME) order by DATENAME(HOUR,V_TIME)+0";
            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb != null)
            {
                String strRes = WXDBUtility.JsonHelper.DataTableToJson(tb);
                Response.Write(strRes);
            }
        }

        public void _GetMapX()
        {
            if (Request.QueryString["CMD"] == null) return;
            String strCMD = Request.QueryString["CMD"];
            if (strCMD != "GETMAPX") return;
            string strSQL = "Select LSMAP from T_WXMSG_CUR_INFO";
            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            String strXiaoMap = WXDBUtility.DESHelper.Decrypt_DES(tb.Rows[0]["LSMAP"].ToString());
            Response.Write(strXiaoMap);
        }

        public void _GetCntAndNum()
        {
            if (Request.QueryString["CMD"] == null) return;
            String strCMD = Request.QueryString["CMD"];
            if (strCMD != "GETCNT") return;
            _GetVisitor();
            string strSQL = "Select *,(select count(*) from T_TODAY_IP) as tnum from T_IP_NUM";
            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb == null) return;
            Response.Write(int.Parse(tb.Rows[0][0].ToString()).ToString("N0") + "#" + int.Parse(tb.Rows[0][1].ToString()).ToString("N0"));            
        }

        public void _GetVisitor()
        {
            String strIP = GetIP();
            String strSQL2 = "Insert into T_IP(IP_ADD) Values('" + strIP + "')";
            int res = WXDBUtility.SqlHelper.ExecuteSql(strSQL2);
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