using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_dzrz
{
    public partial class wd_guandao_fc : System.Web.UI.Page
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
            Session["EDIT_GDID"] = "";
            if (Request.QueryString["EDIT_GDID"] != "" && Request.QueryString["EDIT_GDID"] != null)
            {
                Session["EDIT_GDID"] = Request.QueryString["EDIT_GDID"].ToString();
                strSel = "select  * from t_guandao_glfc where gd_tid='" + Session["CUR_TID"] + "' and gd_id='" + Request.QueryString["EDIT_GDID"] + "' order by gd_time desc";
            }//年月日
            else
            {
                strSel = "select top 1 * from t_guandao_glfc where gd_tid='" + Session["CUR_TID"] + "' order by gd_time desc";
            }
            gtb = WXDBUtility.SqlHelper.GetDataTable(strSel);
            if (gtb == null) return;
            this.xiaqu_gdlc.Value = gtb.Rows[0]["gd_xiaqu_gdlc"].ToString();
            this.xiaqu_gllc.Value = gtb.Rows[0]["gd_xiaqu_gllc"].ToString();
            this.jinri_fcgdlc.Value = gtb.Rows[0]["gd_jinri_fcgdlc"].ToString();//长度
            this.jinri_fcgllc.Value = gtb.Rows[0]["gd_jinri_fcgllc"].ToString();//行政区域
            this.faxian_wt.Value = gtb.Rows[0]["gd_faxian_wt"].ToString();//本周巡线工是否每天巡检

            this.fuce_lc.Value = gtb.Rows[0]["gd_fuce_lc"].ToString();//巡线工巡线结果
            this.fuce_jd.Value = gtb.Rows[0]["gd_fuce_jd"].ToString();//本周巡线管理人员请填写巡检登记，若不是管理人员请填写无

            this.wt.Value = gtb.Rows[0]["gd_wt"].ToString();//巡线工巡线结果
            this.fh.Value = gtb.Rows[0]["gd_fh"].ToString();
           


        }
        public void _BindData()
        {
            //表1中绑定昨天的高后果区信息
            String strday = DateTime.Now.AddDays(-1).ToShortDateString().ToString();  //年月日
            String strnow = DateTime.Now.ToShortDateString().ToString();  //年月日

            //String strSel = "select *   from t_guandao_glfc where (gd_tid='" + Session["CUR_TID"] + "' and gd_time='" + strday + "') or(gd_tid='" + Session["CUR_TID"] + "' and gd_time='" + strnow + "' and flag='1')";
            String strSel = "select *   from t_guandao_glfc where gd_tid='" + Session["CUR_TID"] + "' and gd_time='" + strnow + "' and flag='1'";
            tb = WXDBUtility.SqlHelper.GetDataTable(strSel);

            //if (tb == null)
            //{
            //    String strSel1 = "select *   from t_guandao_glfc where gd_tid='" + Session["CUR_TID"] + "' ";
            //    tb = WXDBUtility.SqlHelper.GetDataTable(strSel1);
            //}
        }

        public void _BindDataZC()
        {
            //表1中绑定今天的高后果区暂存的信息
            String strday = DateTime.Now.ToShortDateString().ToString();  //年月日
            String strSel = "select *   from t_guandao_glfc where gd_tid='" + Session["CUR_TID"] + "' and gd_time='" + strday + "' and flag='0'";
            tbzc = WXDBUtility.SqlHelper.GetDataTable(strSel);
        }
    }
}