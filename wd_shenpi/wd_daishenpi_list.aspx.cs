using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_shenpi
{
    public partial class wd_daishenpi_list : System.Web.UI.Page
    {
        public DataTable tb = null;
        protected void Page_Load(object sender, EventArgs e)
        {           
            _Getdata();
        }
        public void _Getdata()
        {
            String Strsql = "select a.*,b.zname as dwname,b.ztype as type from T_USER_INFO as a,T_ZYQ_INFO as b where  a.ZPID='" + Session["CUR_ZID"] + "' and a.ZID=b.zid order by dwname";
            tb = WXDBUtility.SqlHelper.GetDataTable(Strsql);        
        }        
    }
}