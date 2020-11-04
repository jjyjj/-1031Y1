using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_dzrz
{
    public partial class wd_fskzlist : System.Web.UI.Page
    {
        public DataTable dt_2 = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            _GetGData();
        }
        public void _GetGData()
        {
            string strSel = "select  * from t_fushi where fs_id='" + Request.QueryString["CURTID"] + "' ";


            dt_2 = WXDBUtility.SqlHelper.GetDataTable(strSel);
        }
    }
}