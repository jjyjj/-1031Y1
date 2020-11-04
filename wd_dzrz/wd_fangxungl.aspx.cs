using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_dzrz
{
    public partial class wd_fangxungl : System.Web.UI.Page
    {
        public DataTable gtb;
        public DataTable tb = null;
        public DataTable tbzc = null;
        protected void Page_Load(object sender, EventArgs e)
        {
           //if (!IsPostBack)
           // {                
                //绑定默认显示值
                _GetGData();
                //绑定本人负责的防汛管理信息
                _BindData();
                _BindDataZC();
                //EDIT_ID
            
            //}
           
        }
        public void _GetGData()
        {
            //进入之后绑定当天的高后果区信息
            String strnow = DateTime.Now.ToShortDateString().ToString();
            String strSel = "";
            Session["EDIT_ID"] = "";
            if (Request.QueryString["EDIT_ID"] != "" && Request.QueryString["EDIT_ID"] != null)
            {
                Session["EDIT_ID"] = Request.QueryString["EDIT_ID"].ToString();
                strSel = "select  * from t_fangxun where fx_tid='" + Session["CUR_TID"] + "' and fx_id='" + Request.QueryString["EDIT_ID"] + "' order by f_time desc";
            }//年月日
            else {
                strSel = "select top 1 * from t_fangxun where fx_tid='" + Session["CUR_TID"] + "' order by f_time desc";            
            }
            gtb = WXDBUtility.SqlHelper.GetDataTable(strSel);
            if (gtb == null) return;
            this.fzhanchang.Value = gtb.Rows[0]["fx_zhanchang"].ToString();
            this.fweizhi.Value = gtb.Rows[0]["fx_xingzhengweizhi"].ToString();
            this.fbuwei.Value = gtb.Rows[0]["fx_zhongdianbuwei"].ToString();//长度

            this.fleixing.Value = gtb.Rows[0]["fx_leixing"].ToString();//行政区域
            this.fsfxunxian.Value = gtb.Rows[0]["fx_bzxxgsfmtxj"].ToString();//本周巡线工是否每天巡检

            this.fxunxianjg.Value = gtb.Rows[0]["fx_xxgxxjg"].ToString();//巡线工巡线结果
            this.fbenzhou.Value = gtb.Rows[0]["fx_bzxxglryxxdj"].ToString();//本周巡线管理人员请填写巡检登记，若不是管理人员请填写无
            this.fglyjieguo.Value = gtb.Rows[0]["fx_xxglryxxjg"].ToString();//巡线管理人员请填写巡检结果

            //this.yanlianqk.Value = gtb.Rows[0]["g_ylqk"].ToString();
            this.fshuoming.Value = gtb.Rows[0]["fx_qkxxsm"].ToString();//巡线管理人员请填写发现异常情况详细说明
            this.fzhizao.Value = gtb.Rows[0]["fx_zzzx"].ToString();//治早治小
            this.fweihu.Value = gtb.Rows[0]["fx_sswh"].ToString();//设施维护
            this.fqt.Value = gtb.Rows[0]["fx_qtbz"].ToString();//其他备注
            //this.gwenti.Value = gtb.Rows[0]["g_fxwt"].ToString();


        }
        public void _BindData()
        {
            //表1中绑定昨天的高后果区信息
            String strday = DateTime.Now.ToShortDateString().ToString();  //年月日
            String strSel = "select *   from t_fangxun where fx_tid='" + Session["CUR_TID"] + "' and f_time='" + strday + "' and flag='1'";
            tb = WXDBUtility.SqlHelper.GetDataTable(strSel);
            //if (tb == null)
            //{
            //    String strSel1 = "select *   from t_fangxun where fx_tid='" + Session["CUR_TID"] + "' ";
            //    tb = WXDBUtility.SqlHelper.GetDataTable(strSel1);

            //}
        }

        public void _BindDataZC()
        {
            //表1中绑定今天的高后果区暂存的信息
            String strday = DateTime.Now.ToShortDateString().ToString();  //年月日
            String strSel = "select *   from t_fangxun where fx_tid='" + Session["CUR_TID"] + "' and f_time='" + strday + "' and flag='0'";
            tbzc = WXDBUtility.SqlHelper.GetDataTable(strSel);
        }
    }
}