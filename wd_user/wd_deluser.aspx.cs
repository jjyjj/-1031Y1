using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WeiXinGIS.wd_user
{
    public partial class wd_deluser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strSQL = "Delete from T_USER_INFO where T_ID='" + Request.QueryString["TID"] + "'";
            WXDBUtility.SqlHelper.ExecuteSql(strSQL);
            Response.Redirect("wd_listuser.aspx");
        }
    }
}