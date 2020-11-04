using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace MarketInfo.wd_dzrz
{
    public partial class wd_disanfang_sg : System.Web.UI.Page
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
            String strSel = "select top 1 * from t_disanfang where d_tid='" + Session["CUR_TID"] + "' order by d_time desc";
           
            gtb = WXDBUtility.SqlHelper.GetDataTable(strSel);
            if (gtb == null) return;
            this.shigong_sl.Value = gtb.Rows[0]["d_shigong_sl"].ToString();
            this.xiangmu_mc.Value = gtb.Rows[0]["d_xiangmu_mc"].ToString();
            this.jinri_xzsl.Value = gtb.Rows[0]["d_jinri_xzsl"].ToString();

            this.zuoye_wz.Value = gtb.Rows[0]["d_zuoye_wz"].ToString();
            this.jinri_jcxcqk.Value = gtb.Rows[0]["d_jinri_jcxcqk"].ToString();
            this.qtbz.Value = gtb.Rows[0]["d_qtbz"].ToString();




        }
        public void _BindData()
        {
            //表1中绑定昨天的高后果区信息
            String strday = DateTime.Now.AddDays(-1).ToShortDateString().ToString();  //年月日
            String strnow = DateTime.Now.ToShortDateString().ToString();  //年月日

            String strSel = "select *   from t_disanfang where (d_tid='" + Session["CUR_TID"] + "' and d_time='" + strday + "') or(d_tid='" + Session["CUR_TID"] + "' and d_time='" + strnow + "' and flag='1')";
            tb = WXDBUtility.SqlHelper.GetDataTable(strSel);
            if (tb == null)
            {
                String strSel1 = "select *   from t_disanfang where z_tid='" + Session["CUR_TID"] + "' ";
                tb = WXDBUtility.SqlHelper.GetDataTable(strSel1);

            }
        }

        public void _BindDataZC()
        {
            //表1中绑定今天的高后果区暂存的信息
            String strday = DateTime.Now.ToShortDateString().ToString();  //年月日
            String strSel = "select *   from t_disanfang where d_tid='" + Session["CUR_TID"] + "' and d_time='" + strday + "' and flag='0'";
            tbzc = WXDBUtility.SqlHelper.GetDataTable(strSel);
        }
    }
}