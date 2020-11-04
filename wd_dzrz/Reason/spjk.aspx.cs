using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_dzrz.Reason
{
    public partial class spjk1 : System.Web.UI.Page
    {
        public DataTable tb = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                Binddate();
            }
        }

        public void Binddate()
        {
            string strid = Request.QueryString["id"].ToString();
            String strsql = "select a.*,b.t_name,b.t_id  from t_shipinjiankong a,T_USER_INFO b where b.t_id IN ( a.spid1,a.spid2,a.spid3) and a.s_id='" + strid + "'";
            tb = WXDBUtility.SqlHelper.GetDataTable(strsql);
        }

    }
}