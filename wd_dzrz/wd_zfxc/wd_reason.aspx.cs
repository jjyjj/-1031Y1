using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MarketInfo.wd_dzrz.wd_zfxc
{
    public partial class wd_reason : System.Web.UI.Page
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
            String strsql = "select a.*,b.t_name,b.t_id  from T_xuan_chuan_zou_fang a,T_USER_INFO b where b.t_id IN ( a.spid1,a.spid2,a.spid3) and a.id='" + strid + "'";
            tb = WXDBUtility.SqlHelper.GetDataTable(strsql);

        }

    }
}