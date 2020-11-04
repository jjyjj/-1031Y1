using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace MarketInfo.wd_dzrz
{
    public partial class wd_ghgqlist : System.Web.UI.Page
    {
        public DataTable dt_2 = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            _GetGData();
        }
        public void _GetGData()
        {
            string strtype =Session["CUR_T_ID"].ToString();//TYPE
            string strzid = Session["CUR_ZID"].ToString();
            string strzpid =Session["CUR_PZID"].ToString();
            string strSel = "select  * from T_GGQ_INFO where zid in('"+ strzid + "','"+ strzpid + "','0') order by zid desc";
            dt_2 = WXDBUtility.SqlHelper.GetDataTable(strSel);
        }
    }
}