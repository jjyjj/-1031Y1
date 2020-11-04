using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_shenpi
{
    public partial class wd_shenpi : System.Web.UI.Page
    {
        public DataTable tb;
        public string name = "";
        public string tid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            hide_tid.Value = Request.QueryString["TID"].ToString();
            tid = Request.QueryString["TID"].ToString();
            String sql = "select T_UNAME from T_USER_INFO where T_ID='" + Request.QueryString["TID"].ToString() + "'";
            tb = WXDBUtility.SqlHelper.GetDataTable(sql);
            if (tb != null)
            {
                name = tb.Rows[0]["T_UNAME"].ToString();
            }
        }
    }
}