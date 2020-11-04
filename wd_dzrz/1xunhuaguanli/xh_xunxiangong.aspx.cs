using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_dzrz._1xunhuaguanli
{
    public partial class xh_xunxiangong : System.Web.UI.Page
    {
        public DataTable dt_1 = null;
        public DataBinder dt_2 = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CUR_TID"] != null)
            {
                this.hideFid.Value = Session["CUR_TID"].ToString();
                this.hideZid.Value = Session["CUR_ZID"].ToString();
            }
            if (Session["CUR_T_ID"].ToString() != "0" && Session["CUR_T_ID"].ToString() != "1")
            { 
                String Strsql="select zname from T_ZYQ_INFO where zid='"+ Session["CUR_PZID"].ToString()+"'";
                DataTable tb=WXDBUtility.SqlHelper.GetDataTable(Strsql);
                if(tb!=null)
                {
                    this.changzhan.Value = tb.Rows[0]["zname"].ToString();
                }
              
            }
            if (Session["CUR_T_ID"].ToString() == "1")
            {
                String Strsql = "select zname from T_ZYQ_INFO where zid='" + Session["CUR_ZID"].ToString() + "'";
                DataTable tb = WXDBUtility.SqlHelper.GetDataTable(Strsql);
                if (tb != null)
                {
                    this.changzhan.Value = tb.Rows[0]["zname"].ToString();
                }

            }
            _DataBind();
        }
        public void _DataBind()
        {
            string StrSql = "select * from dbo.t_xunxiangong_info WHERE xx_tid='" + Session["CUR_TID"] + "'  order by xx_id desc";//and t_id=" + this.hideFid.Value + "
            dt_1 = WXDBUtility.SqlHelper.GetDataTable(StrSql);
        }
    }
}