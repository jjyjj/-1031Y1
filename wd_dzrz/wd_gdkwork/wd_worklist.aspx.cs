using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_dzrz.wd_gdkwork
{
    public partial class wd_worklist : System.Web.UI.Page
    {
        public DataTable dt_1 = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CUR_TID"] != null)
                { _DataBind(); }
            }
        }
        public void _DataBind()
        {
            string StrSql = "select  a.*,b.T_NAME as name from dbo.t_gdk_workday a,T_USER_INFO b where a.t_id=b.T_ID and DateDiff(dd,a.crtime ,getdate())=0 order by a.id desc";
            dt_1 = WXDBUtility.SqlHelper.GetDataTable(StrSql);

        }
    }
}