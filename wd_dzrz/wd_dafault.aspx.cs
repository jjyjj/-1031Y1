using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_dzrz
{
    public partial class wd_dafault : System.Web.UI.Page
    {
        public DataTable gtb;
        protected void Page_Load(object sender, EventArgs e)
        {
            _GetGData();
        }
        public void _GetGData()
        {
            //进入之后绑定当天的高后果区信息
            String strnow = DateTime.Now.ToShortDateString().ToString();  //年月日
            String strSel = "select top 1 * from t_ghgq where g_tid='" + Session["CUR_TID"] + "'";
            gtb = WXDBUtility.SqlHelper.GetDataTable(strSel);
            if (gtb == null) return;
            this.gzhanchang.Value = gtb.Rows[0]["g_zhanchang"].ToString();
            this.gbianhao.Value = gtb.Rows[0]["g_ggqbh"].ToString();
            this.ghangdu.Value = gtb.Rows[0]["g_ggqcd"].ToString();//长度

            this.gquyu.Value = gtb.Rows[0]["g_ggqxzqy"].ToString();//行政区域
            this.gggqshu.Value = gtb.Rows[0]["g_ggqsl"].ToString();

            this.gjcshu.Value = gtb.Rows[0]["g_jrjcsl"].ToString();
            this.gzoufang.Value = gtb.Rows[0]["g_xczfqk"].ToString();//宣传走访情况
            this.gzoufangci.Value = gtb.Rows[0]["g_zfrc"].ToString();//走访人次

            this.gyanlian.Value = gtb.Rows[0]["g_ylqk"].ToString();
            this.gwenti.Value = gtb.Rows[0]["g_fxwt"].ToString();

        }
    }
}