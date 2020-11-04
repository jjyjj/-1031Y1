using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_dzrz._1xunhuaguanli
{
    public partial class xh_xunxiangonglist : System.Web.UI.Page
    {
        public DataTable tb = null;
        public string zname = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CUR_TID"] != null)
            {
                this.hideFid.Value = Session["CUR_TID"].ToString();
            }
            if (Session["CUR_T_ID"].ToString() != "0" && Session["CUR_T_ID"].ToString() != "1")
            {
                String Strsql = "select zname from T_ZYQ_INFO where zid='" + Session["CUR_PZID"].ToString() + "'";
                DataTable tb = WXDBUtility.SqlHelper.GetDataTable(Strsql);
                if (tb != null)
                {
                    zname = tb.Rows[0]["zname"].ToString();
                }

            } if (Session["CUR_T_ID"].ToString()== "1")
            {
                String Strsql = "select zname from T_ZYQ_INFO where zid='" + Session["CUR_ZID"].ToString() + "'";
                DataTable tb = WXDBUtility.SqlHelper.GetDataTable(Strsql);
                if (tb != null)
                {
                    zname = tb.Rows[0]["zname"].ToString();
                }

            }
            _BindData();
        }
        public void _BindData()
        {
            String sql = "select * from t_xunxiangong_info where xx_tid='" + Session["CUR_TID"].ToString() + "' or xx_tid_lishi='" + Session["CUR_TID"].ToString() + "'";
            tb = WXDBUtility.SqlHelper.GetDataTable(sql);
        
        }
    }
}