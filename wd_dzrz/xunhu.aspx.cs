using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_dzrz
{
    public partial class xunhu : System.Web.UI.Page
    {
         public DataTable gtb;
        public DataTable tb = null;
        public DataTable tbzc = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CUR_TID"] != null)
            {
                this.hideFtid.Value = Session["CUR_TID"].ToString();
                this.hidtype.Value = Session["CUR_T_ID"].ToString();
                this.Hidzid.Value = Session["CUR_ZID"].ToString();
                this.Hidzpid.Value = Session["CUR_PZID"].ToString();

            }
            //绑定默认显示值
              //  _GetGData();
                //绑定本人负责的防汛管理信息
                _BindData();
                _BindDataZC();
        }
        //public void _GetGData()
        //{
        //    //进入之后绑定当天的高后果区信息
        //    String strnow = DateTime.Now.ToShortDateString().ToString();
        //    String strSel = "";
        //    Session["EDIT_XHID"] = "";
        //    if (Request.QueryString["EDIT_XHID"] != "" && Request.QueryString["EDIT_XHID"] != null)
        //    {
        //        Session["EDIT_XHID"] = Request.QueryString["EDIT_XHID"].ToString();
        //        strSel = "select  * from t_xunhu where x_tid='" + Session["CUR_TID"] + "' and x_id='" + Request.QueryString["EDIT_XHID"] + "' order by x_time desc";
        //    }//年月日
        //    else
        //    {
        //        strSel = "select top 1 * from t_xunhu where x_tid='" + Session["CUR_TID"] + "' order by x_time desc";
        //    }
        //    gtb = WXDBUtility.SqlHelper.GetDataTable(strSel);
        //    if (gtb == null) return;
        //    this.changzhan.Value = gtb.Rows[0]["x_changzhan"].ToString();
        //    this.zhuguan_zz.Value = gtb.Rows[0]["x_zhuguan_zz"].ToString();
        //    this.xianlu_gl.Value = gtb.Rows[0]["x_xianlu_gl"].ToString();//线路管理员

        //    this.bianhao.Value = gtb.Rows[0]["x_bianhao"].ToString();//编号
        //    this.chengbao_xxg.Value = gtb.Rows[0]["x_chengbao_xxg"].ToString();//承包巡线工

        //    this.qidian_xzqy.Value = gtb.Rows[0]["x_qidian_xzqy"].ToString();//起点行政区域
        //    this.zhuanghao.Value = gtb.Rows[0]["x_zhuanghao"].ToString();//桩号
        //    this.zhongdian_xzqy.Value = gtb.Rows[0]["x_zhongdian_xzqy"].ToString();//终点行政区域

        //    this.licheng.Value = gtb.Rows[0]["x_licheng"].ToString();//里程

        //    this.xunhu_xzqy.Value = gtb.Rows[0]["x_xunhu_xzqy"].ToString();//巡护行政区域
        //    this.xunhu_lc.Value = gtb.Rows[0]["x_xunhu_lc"].ToString();//巡护里程
        //    this.beizhu.Value = gtb.Rows[0]["x_beizhu"].ToString();//备注
        //    //this.gwenti.Value = gtb.Rows[0]["g_fxwt"].ToString();


        //}
        public void _BindData()
        {
            //表1中绑定昨天的高后果区信息
            String strday = DateTime.Now.AddDays(-1).ToShortDateString().ToString();  //年月日
            String strnow = DateTime.Now.ToShortDateString().ToString();  //年月日

            //需要添加上查询临时id等于当前登录id的数据
            //String strSel = "select *   from t_xunhuguanli where (xh_tid='" + Session["CUR_TID"] + "' and DateDiff(dd,xh_time,getdate())=0) or(xh_tid='" + Session["CUR_TID"] + "' and  DateDiff(dd,xh_time,getdate())=0 and flag='1')";
            String strSel = "select *   from t_xunhuguanli where  (xh_tid='" + Session["CUR_TID"] + "' and  DateDiff(dd,xh_time,getdate())=0 and flag='1')";
            tb = WXDBUtility.SqlHelper.GetDataTable(strSel);
            //if (tb == null)
            //{
            //    //需要添加上查询临时id等于当前登录id的数据
            //    String strSel1 = "select *   from t_xunhuguanli where xh_tid='" + Session["CUR_TID"] + "' ";
            //    tb = WXDBUtility.SqlHelper.GetDataTable(strSel1);

            //}
        }

        public void _BindDataZC()
        {
            //表1中绑定今天的高后果区暂存的信息
            String strday = DateTime.Now.ToLongDateString();  //年月日
            String strSel = "select *   from t_xunhuguanli where xh_tid='" + Session["CUR_TID"] + "' and flag='0'";
            //select * from 表名 where DateDiff(xh_time,datetime,getdate())=0
            tbzc = WXDBUtility.SqlHelper.GetDataTable(strSel);
        }
    }
}