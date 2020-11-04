using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace MarketInfo.wd_shenpi
{
    public partial class wd_bg_list : System.Web.UI.Page
    {
        public DataTable tb = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            _Getdata();
        }
        public void _Getdata()
        {
            String Strsql = "select a.*,b.zname as ydwname,b.ztype as type,c.T_NAME from t_user_bg as a,T_ZYQ_INFO as b,T_USER_INFO as c where a.tid=c.T_ID and  a.n_zid='" + Session["CUR_ZID"] + "' and a.y_zpid=b.zid order by a.id";
            tb = WXDBUtility.SqlHelper.GetDataTable(Strsql);
        }    
    }
}