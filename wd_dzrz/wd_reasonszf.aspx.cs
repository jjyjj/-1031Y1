using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace MarketInfo.wd_dzrz
{
    public partial class wd_reasonszf : System.Web.UI.Page
    {
        public DataTable tb = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            Binddate();
        }
        public void Binddate()
        {
            if (Request.QueryString["id"] == "" || Request.QueryString["id"] == "") return;
            string strid = Request.QueryString["id"].ToString();
            String strsql = "select a.*,b.t_name   from t_sanzhuangfei a,T_USER_INFO b where b.t_id IN ( a.sprid1,a.sprid2,a.sprid3) and a.s_id='" + Request.QueryString["id"] + "'";
            tb = WXDBUtility.SqlHelper.GetDataTable(strsql);

        }
    }
}