using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace MarketInfo.wd_dzrz
{
    public partial class wd_fushikz : System.Web.UI.Page
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
            //进入之后绑定当天的信息
            String strnow = DateTime.Now.ToShortDateString().ToString();
            String strSel = "";
            Session["EDIT_FSID"] = "";
            if (Request.QueryString["EDIT_FSID"] != "" && Request.QueryString["EDIT_FSID"] != null)
            {
                Session["EDIT_FSID"] = Request.QueryString["EDIT_FSID"].ToString();
                strSel = "select  * from t_fushi where fs_tid='" + Session["CUR_TID"] + "' and fs_id='" + Request.QueryString["EDIT_FSID"] + "' order by fs_time desc";
            }//年月日
            else
            {
                strSel = "select top 1 * from t_fushi where fs_tid='" + Session["CUR_TID"] + "' order by fs_time desc";
            }
            gtb = WXDBUtility.SqlHelper.GetDataTable(strSel);
            if (gtb == null) return;
            this.guzhang_cl.Value = gtb.Rows[0]["fs_guzhang_cl"].ToString();
            this.shebei_tz.Value = gtb.Rows[0]["fs_shebei_tz"].ToString();
            this.dingqi_cs.Value = gtb.Rows[0]["fs_dingqi_cs"].ToString();//长度
            this.weizhi.Value= gtb.Rows[0]["fs_xingzheng_weizhi"].ToString();//长度
            this.zhuanghao.Value= gtb.Rows[0]["fs_zhuanghao"].ToString();//长度
            this.fsbz.Value = gtb.Rows[0]["fs_bz"].ToString();//行政区域
            
            //this.gwenti.Value = gtb.Rows[0]["g_fxwt"].ToString();


        }
        public void _BindData()
        {
            //腐蚀控制提交列表
            String strday = DateTime.Now.AddDays(-1).ToShortDateString().ToString();  //年月日
            String strnow = DateTime.Now.ToShortDateString().ToString();  //年月日

            //String strSel = "select *   from t_fushi where (fs_tid='" + Session["CUR_TID"] + "' and fs_time='" + strday + "') or(fs_tid='" + Session["CUR_TID"] + "' and fs_time='" + strnow + "' and flag='1')";
            String strSel = "select *   from t_fushi where fs_tid='" + Session["CUR_TID"] + "' and fs_time='" + strnow + "' and flag='1'";
            tb = WXDBUtility.SqlHelper.GetDataTable(strSel);
            //if (tb == null)
            //{
            //    String strSel1 = "select *   from t_fushi where fs_tid='" + Session["CUR_TID"] + "' ";
            //    tb = WXDBUtility.SqlHelper.GetDataTable(strSel1);

            //}
        }

        public void _BindDataZC()
        {
            //腐蚀控制暂存的信息
            String strday = DateTime.Now.ToShortDateString().ToString();  //年月日
            String strSel = "select *   from t_fushi where fs_tid='" + Session["CUR_TID"] + "'and flag='0'";
            tbzc = WXDBUtility.SqlHelper.GetDataTable(strSel);
        }
    }
}