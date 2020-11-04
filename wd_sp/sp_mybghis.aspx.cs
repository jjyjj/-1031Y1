using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_sp
{
    public partial class sp_mybghis : System.Web.UI.Page
    {
        public DataTable tb = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CUR_T_ID"].ToString() != "" && Session["CUR_T_ID"] != null)
            {
                _GetData();
            }
        }
        public void _GetData()
        {
            string StrSql = "select a.*,b.T_NAME,c.zname from dbo.T_USER_BG a,T_USER_INFO b,T_ZYQ_INFO c where a.y_zid=c.zid and a.tid=b.T_ID and  a.del='1' and a.tid='" + Session["CUR_TID"] + "' order by a.id";// and DateDiff(dd,setTime ,getdate())=0 
            tb = WXDBUtility.SqlHelper.GetDataTable(StrSql);
        }
    }
}