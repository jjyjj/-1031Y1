using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace wxsoft
{
    public partial class rx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                _GetVisitor();
                Response.Redirect("http://wxgis.henangis.com/app/rx.aspx");
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