using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_xxg
{
    public partial class xxglist : System.Web.UI.Page
    {        
        public DataTable dt=null;
        public DataTable dt_1 = null;
        public DataTable dt_2 = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
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
        public void _DataBind() {
            string StrSql = "select top 1 * from dbo.T_xun_xian_gong where  t_id=" + this.hideFid.Value + " order by id desc";
            dt = WXDBUtility.SqlHelper.GetDataTable(StrSql);
            if (dt != null) {
                this.txtjc.Value = dt.Rows[0]["x_jrjiancha"].ToString();
                this.txtjf.Value = dt.Rows[0]["x_jiangli"].ToString();
                this.txtname.Value = dt.Rows[0]["x_name"].ToString();
                this.txtqj.Value = dt.Rows[0]["x_jrqingjia"].ToString();
                this.txtwt.Value = dt.Rows[0]["x_wenti"].ToString();
                this.txtzs.Value = dt.Rows[0]["x_zongshu"].ToString();
            }
        }

        /// <summary>                                              
        /// 绑定/暂存
        /// </summary>
        public void _DataBind(string AisB)
        {
            string StrSql = "select * from dbo.T_xun_xian_gong WHERE flag='" + AisB + "' and t_id=" + this.hideFid.Value + " order by id desc";
            dt_1 = WXDBUtility.SqlHelper.GetDataTable(StrSql);            
        }
        /// <summary>
        /// 绑定/保存
        /// </summary>
        public void _DataBind(int AisB)
        {
            string StrSql = "select * from dbo.T_xun_xian_gong WHERE flag='" + AisB + "' and t_id=" + this.hideFid.Value + " order by id desc";
            dt_2 = WXDBUtility.SqlHelper.GetDataTable(StrSql);
        }


    }
}