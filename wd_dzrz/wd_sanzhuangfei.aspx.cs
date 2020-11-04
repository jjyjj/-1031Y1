using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_dzrz
{
    public partial class wd_sanzhuangfei : System.Web.UI.Page
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
            Session["EDIT_SZID"] = "";
            if (Request.QueryString["EDIT_SZID"] != "" && Request.QueryString["EDIT_SZID"] != null)
            {
                Session["EDIT_SZID"] = Request.QueryString["EDIT_SZID"].ToString();
                strSel = "select  * from t_sanzhuangfei where s_tid='" + Session["CUR_TID"] + "' and s_id='" + Request.QueryString["EDIT_SZID"] + "' order by s_time desc";
            }//年月日
            else
            {
                strSel = "select top 1 * from t_sanzhuangfei where s_tid='" + Session["CUR_TID"] + "' order by s_time desc";
            }
            gtb = WXDBUtility.SqlHelper.GetDataTable(strSel);
            if (gtb == null) return;
            this.xiaqu_yf.Value = gtb.Rows[0]["s_xiaqu_yf"].ToString();
            this.jinri_ff.Value = gtb.Rows[0]["s_jinri_ff"].ToString();
            this.bz.Value = gtb.Rows[0]["s_bz"].ToString();//长度
        }
        public void _BindData()
        {
            //表1中绑定昨天的高后果区信息
            String strday = DateTime.Now.AddDays(-1).ToShortDateString().ToString();  //年月日
            String strnow = DateTime.Now.ToShortDateString().ToString();  //年月日

            String strSel = "select *   from t_sanzhuangfei where (s_tid='" + Session["CUR_TID"] + "' and s_time='" + strday + "') or(s_tid='" + Session["CUR_TID"] + "' and s_time='" + strnow + "' and flag='1')";
            tb = WXDBUtility.SqlHelper.GetDataTable(strSel);
            if (tb == null)
            {
                String strSel1 = "select *   from t_sanzhuangfei where s_tid='" + Session["CUR_TID"] + "' ";
                tb = WXDBUtility.SqlHelper.GetDataTable(strSel1);

            }
        }

        public void _BindDataZC()
        {
            //表1中绑定今天的高后果区暂存的信息
            String strday = DateTime.Now.ToShortDateString().ToString();  //年月日
            String strSel = "select *   from t_sanzhuangfei where s_tid='" + Session["CUR_TID"] + "' and s_time='" + strday + "' and flag='0'";
            tbzc = WXDBUtility.SqlHelper.GetDataTable(strSel);
        }
    }
}