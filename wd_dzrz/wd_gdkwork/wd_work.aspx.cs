using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;

namespace MarketInfo.wd_dzrz.wd_gdkwork
{
    public partial class wd_work : System.Web.UI.Page
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

        public void _DataBind()
        {
            string StrSql = "select top 1 * from dbo.t_gdk_workday order by crtime desc";
            dt = WXDBUtility.SqlHelper.GetDataTable(StrSql);
            if (dt != null)
            {
                //this.txtzq.Value = dt.Rows[0]["fx_zq"].ToString();
                this.txtdd.Value = dt.Rows[0]["didian"].ToString();

                this.txtwork.Value = dt.Rows[0]["zhuyao_gongzuo"].ToString();
                this.txtqt.Value = dt.Rows[0]["qita"].ToString();
                this.txtbzgz.Value= dt.Rows[0]["benzhou_zhongdian"].ToString();
                this.txtxzap.Value = dt.Rows[0]["xiahzou_jihua"].ToString();


            }
        }

        /// <summary>
        /// 绑定/暂存
        /// </summary>
        public void _DataBind(string AisB)
        {
            string StrSql = "select * from dbo.t_gdk_workday WHERE flag='" + AisB + "' and t_id=" + this.hideFid.Value + " and  DateDiff(dd,crtime,getdate())=0 order by id desc";
            dt_1 = WXDBUtility.SqlHelper.GetDataTable(StrSql);
        }
        /// <summary>
        /// 绑定/保存
        /// </summary>
        public void _DataBind(int AisB)
        {
            //七天之内的数据
            string StrSql = "select * from dbo.t_gdk_workday WHERE flag='" + AisB + "' and t_id=" + this.hideFid.Value + "  and  DateDiff(dd,crtime,getdate())<=7 order by id desc";
            dt_2 = WXDBUtility.SqlHelper.GetDataTable(StrSql);
        }

    }
}