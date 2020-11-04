using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_dzrz.wd_dier_shigong
{
    public partial class wd_dier : System.Web.UI.Page
    {
        public DataTable dt = null;
        public DataTable dt_1 = null;
        public DataTable dt_2 = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CUR_TID"] != null) 
                {
                    this.hideFid.Value = Session["CUR_TID"].ToString();
                }
                _DataBind();
            }
            _DataBind("0");
            _DataBind(1); 
        }

         
        /// <summary>
        /// 绑定 TOP1
        /// </summary>
        public void _DataBind()
        {
            string StrSql = "select top 1 * from dbo.t_DIER_shigong where t_id='" + Session["CUR_TID"].ToString() + "' order by er_time desc";
            dt = WXDBUtility.SqlHelper.GetDataTable(StrSql);
            if (dt != null)
            {
                this.txtsl.Value = dt.Rows[0]["er_xiangmu"].ToString();
                this.txtxm.Value = dt.Rows[0]["er_zydw"].ToString();
                this.txtwz.Value = dt.Rows[0]["er_xgdw"].ToString();
                this.txtjd.Value = dt.Rows[0]["er_zyqk"].ToString();
                this.fxwt.Value = dt.Rows[0]["er_wt"].ToString();

                this.wtzggz.Value = dt.Rows[0]["er_gz"].ToString();
                this.qt.Value = dt.Rows[0]["er_qt"].ToString();


            }
        }

        /// <summary>
        /// 绑定/暂存
        /// </summary>
        public void _DataBind(string AisB)
        {
            string StrSql = "select * from dbo.t_DIER_shigong WHERE flag='" + AisB + "' and t_id=" + this.hideFid.Value + " order by id desc";
            dt_1 = WXDBUtility.SqlHelper.GetDataTable(StrSql);
        }
        /// <summary>
        /// 绑定/保存
        /// </summary>
        public void _DataBind(int AisB)
        {
            string StrSql = "select * from dbo.t_DIER_shigong WHERE flag='" + AisB + "' and t_id=" + this.hideFid.Value + "and DateDiff(dd,er_time,getdate())=0 order by id desc";
            dt_2 = WXDBUtility.SqlHelper.GetDataTable(StrSql);
        }



    }
}