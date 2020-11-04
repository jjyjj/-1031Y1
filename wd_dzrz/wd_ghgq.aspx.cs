using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_dzrz
{
    public partial class wd_ghgq : System.Web.UI.Page
    {
        public DataTable gtb;
        public DataTable tb = null;
        public DataTable tbzc = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!Page.IsPostBack)
            //{
                //绑定默认显示值
                _GetGData();
                //绑定本人负责的高后果区
                _BindData();
                //绑定暂存的数据
                _BindDataZC();

           // }
        }
        public void _GetGData()
        {
            //进入之后绑定当天的高后果区信息
            String strnow = DateTime.Now.ToShortDateString().ToString();  //年月日
            String strSel = "";
            Session["EDIT_GID"] = "";
            if (Request.QueryString["EDIT_GID"] != "" && Request.QueryString["EDIT_GID"] != null)
            {
               
                Session["EDIT_GID"] = Request.QueryString["EDIT_GID"].ToString();
                strSel = "select * from t_ghgq_info  where g_tid='" + Session["CUR_TID"] + "' and g_id='" + Request.QueryString["EDIT_GID"] + "'";
            }//年月日
            else
            {
                strSel = "select top 1 * from t_ghgq_info where g_tid='" + Session["CUR_TID"] + "'order by g_time desc";
            }
            gtb = WXDBUtility.SqlHelper.GetDataTable(strSel);
            if (gtb == null) return;
            //this.gzhanchang.Value = gtb.Rows[0]["g_zhanchang"].ToString();
            //this.gbianhao.Value = gtb.Rows[0]["g_ggqbh"].ToString();
            //this.ghangdu.Value = gtb.Rows[0]["g_ggqcd"].ToString();//长度

            //this.gquyu.Value = gtb.Rows[0]["g_ggqxzqy"].ToString();//行政区域
            //this.gggqshu.Value = gtb.Rows[0]["g_ggqsl"].ToString();

            //this.gjcshu.Value = gtb.Rows[0]["g_jrjcsl"].ToString();
            //this.gzoufang.Value = gtb.Rows[0]["g_xczfqk"].ToString();//宣传走访情况
            //this.gzoufangci.Value = gtb.Rows[0]["g_zfrc"].ToString();//走访人次

            ////this.yanlianqk.Value = gtb.Rows[0]["g_ylqk"].ToString();
            //this.ylqk.Value = gtb.Rows[0]["g_ylqk"].ToString();
            //this.gwenti.Value = gtb.Rows[0]["g_fxwt"].ToString();
        }

        public void _BindData()
        {
            //表1中绑定今天的高后果区信息
            String strday = DateTime.Now.AddDays(-1).ToShortDateString().ToString();  //年月日
            String strnow = DateTime.Now.ToShortDateString().ToString();  //年月日
            String strSel = "select a.*,b.ghgqcode,b.xian,b.xiang,b.cun,b.changdu,b.dengji,b.code  from t_ghgq_info as a,T_GGQ_INFO as b where  a.g_tid='" + Session["CUR_TID"] + "' and  a.flag='1' and a.g_ggqbh=b.ghgqcode and DateDiff(dd,a.g_time,getdate())=0";
             tb = WXDBUtility.SqlHelper.GetDataTable(strSel);            
        }
        public void _BindDataZC()
        {
            //表1中绑定今天的高后果区暂存的信息
            String strday = DateTime.Now.ToShortDateString().ToString();  //年月日
            String strSel = "select *   from t_ghgq_info where g_tid='" + Session["CUR_TID"] + "' and flag='0'";
            tbzc = WXDBUtility.SqlHelper.GetDataTable(strSel);
        }
    }
}