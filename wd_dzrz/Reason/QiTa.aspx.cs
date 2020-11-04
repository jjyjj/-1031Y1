using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MarketInfo.wd_dzrz.Reason
{
    public partial class QiTa : System.Web.UI.Page
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
            String strsql = "select a.*,b.t_name,b.t_id  from t_qita a,T_USER_INFO b where b.t_id IN ( a.sprid1,a.sprid2,a.sprid3) and a.q_id='" + strid + "'";
            tb = WXDBUtility.SqlHelper.GetDataTable(strsql);
        }


    }
}