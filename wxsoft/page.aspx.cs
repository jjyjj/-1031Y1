using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace wxsoft
{
    public partial class page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                _GetVisitor();
                _GetRedrect();
            }
        }

        public void _GetRedrect()
        {
            String strSQL = "Select * from T_URL";
            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb != null)
            {
                String strURL="page/" + tb.Rows[0][0].ToString();
                Response.Redirect(strURL);
            }
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