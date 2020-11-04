using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_dzrz.wd_zfxc
{
    public partial class wd_zfxclist : System.Web.UI.Page
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
            string StrSql = "select top 1 * from dbo.T_xuan_chuan_zou_fang order by id desc";
            dt = WXDBUtility.SqlHelper.GetDataTable(StrSql);
            if (dt != null)
            {
                this.txtxjbm.Value = dt.Rows[0]["zf_xjbm"].ToString();
                this.txtxzbm.Value = dt.Rows[0]["zf_xzbm"].ToString();
                this.txtcw.Value = dt.Rows[0]["zf_cw"].ToString();
                this.txtjxs.Value = dt.Rows[0]["zf_jxs"].ToString();
                this.txtxxy.Value = dt.Rows[0]["zf_xxy"].ToString();
                this.txtnthz.Value = dt.Rows[0]["zf_nthz"].ToString();
                this.txtjr_num.Value = dt.Rows[0]["zf_jr_num"].ToString(); 
                this.hidejxs.Value = dt.Rows[0]["zf_jxs_all"].ToString();
                this.hidenthz.Value= dt.Rows[0]["zf_nthz_all"].ToString();
                this.hidexxy.Value= dt.Rows[0]["zf_xxy_all"].ToString();
            }
        }

        /// <summary>
        /// 绑定/暂存
        /// </summary>
        public void _DataBind(string AisB)
        {
            string StrSql = "select * from dbo.T_xuan_chuan_zou_fang WHERE flag='" + AisB + "' and t_id=" + this.hideFid.Value + " order by id desc";
            dt_1 = WXDBUtility.SqlHelper.GetDataTable(StrSql);
        }
        /// <summary>
        /// 绑定/保存
        /// </summary>
        public void _DataBind(int AisB)
        {
            string StrSql = "select * from dbo.T_xuan_chuan_zou_fang WHERE flag='" + AisB + "' and t_id=" + this.hideFid.Value + "and DateDiff(dd,setTime,getdate())=0 order by id desc";
            dt_2 = WXDBUtility.SqlHelper.GetDataTable(StrSql);
        }



    }
}