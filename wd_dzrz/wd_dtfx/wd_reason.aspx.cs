using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_dzrz.wd_dtfx
{
    public partial class wd_reason : System.Web.UI.Page
    {
        public DataTable tb = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            Binddate();
        }
        public void Binddate() {
            if (Request.QueryString["id"] == "" || Request.QueryString["id"] == "") return;
            string strid = Request.QueryString["id"].ToString();
            //String strsql1 = "select spid1,spid2,spid3 from t_dongtaifengxian where id='" + strid + "'";
            //String where = "";
            //DataTable tb1 = WXDBUtility.SqlHelper.GetDataTable(strsql1);
           
            //if (tb1 != null)
            //{
            //    string tid = "";
            //    if (tb1.Rows[0]["spid1"] != null)
            //    {
            //        tid = tb1.Rows[0]["spid1"].ToString();
            //    }
            //    if (tb1.Rows[0]["spid2"] != null)
            //    {
            //        tid+=","+ tb1.Rows[0]["spid2"].ToString();
            //    }
            //    if (tb1.Rows[0]["spid3"] != null)
            //    {
            //        tid += "," + tb1.Rows[0]["spid3"].ToString();
            //    }
            //    where = " b.t_id IN ( a.spid1,a.spid2,a.spid3) and ";
            //}
            String strsql = "select a.*,b.t_name,b.t_id   from t_dongtaifengxian a,T_USER_INFO b where b.t_id IN ( a.spid1,a.spid2,a.spid3) and a.id='" + Request.QueryString["id"] + "'";
            tb = WXDBUtility.SqlHelper.GetDataTable(strsql);

        }
    }
}