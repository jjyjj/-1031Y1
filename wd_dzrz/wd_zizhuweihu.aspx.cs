using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_dzrz
{
    public partial class wd_zizhuweihu : System.Web.UI.Page
    {
        public DataTable gtb;
        public DataTable tb = null;
        public DataTable tbzc = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            //绑定默认显示值
            _GetGData();
            //绑定本人负责的防汛管理信息
            _BindData();
            _BindDataZC();
        }
        public void _GetGData()
        {
            //进入之后绑定当天的高后果区信息
            String strnow = DateTime.Now.ToShortDateString().ToString();
            String strSel = "";
            Session["EDIT_ZZID"] = "";
            if (Request.QueryString["EDIT_ZZID"] != "" && Request.QueryString["EDIT_ZZID"] != null)
            {
                Session["EDIT_ZZID"] = Request.QueryString["EDIT_ZZID"].ToString();
                strSel = "select  * from t_zizhu_weihu where z_tid='" + Session["CUR_TID"] + "' and z_id='" + Request.QueryString["EDIT_ZZID"] + "' order by z_time desc";
            }//年月日
            else
            {
                strSel = "select top 1 * from t_zizhu_weihu where z_tid='" + Session["CUR_TID"] + "' order by z_time desc";
            }
            gtb = WXDBUtility.SqlHelper.GetDataTable(strSel);
            if (gtb == null) return;
            this.qita_zy.Value = gtb.Rows[0]["z_qita_zy"].ToString();
            this.kaiwa_zy.Value = gtb.Rows[0]["z_kaiwa_zy"].ToString();
        }
        public void _BindData()
        {
            //表1中绑定昨天的高后果区信息
            String strday = DateTime.Now.AddDays(-1).ToShortDateString().ToString();  //年月日
            String strnow = DateTime.Now.ToShortDateString().ToString();  //年月日

            String strSel = "select *   from t_zizhu_weihu where (z_tid='" + Session["CUR_TID"] + "' and z_time='" + strday + "') or(z_tid='" + Session["CUR_TID"] + "' and z_time='" + strnow + "' and flag='1')";
            tb = WXDBUtility.SqlHelper.GetDataTable(strSel);
            if (tb == null)
            {
                String strSel1 = "select *   from t_zizhu_weihu where z_tid='" + Session["CUR_TID"] + "' ";
                tb = WXDBUtility.SqlHelper.GetDataTable(strSel1);

            }
        }

        public void _BindDataZC()
        {
            //表1中绑定今天的高后果区暂存的信息
            String strday = DateTime.Now.ToShortDateString().ToString();  //年月日
            String strSel = "select *   from t_zizhu_weihu where z_tid='" + Session["CUR_TID"] + "' and z_time='" + strday + "' and flag='0'";
            tbzc = WXDBUtility.SqlHelper.GetDataTable(strSel);
        }
    }
}