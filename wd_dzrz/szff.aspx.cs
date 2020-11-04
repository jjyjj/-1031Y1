using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_dzrz
{
    public partial class szff : System.Web.UI.Page
    {
        public DataTable gtb;
        public DataTable tb = null;
        public DataTable tbzc = null;
        public DataTable tbyc = null;
        public DataTable tbtj = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            //绑定显示默认值
            _GetGData();
            //绑定本人负责的监控
            _BindData();
            //绑定暂存的数据
            _BindDataZC();
            _BindDataYC();
         



        }
        public void _GetGData()
        {
            //  t_shipinjiankong

            String strSel = "";

            if (Request.QueryString["EDIT_GID"] != "" && Request.QueryString["EDIT_GID"] != null)
            {
                Session["EDIT_GID"] = Request.QueryString["EDIT_GID"].ToString();
                strSel = "select  * from t_sanzhuangfei where s_id='" + Request.QueryString["EDIT_GID"] + "' ";
            }//年月日
            else
            {
                strSel = "select top 1 * from t_sanzhuangfei  where s_tid='" + Session["CUR_TID"] + "' order by s_id DESC ";
            }



            gtb = WXDBUtility.SqlHelper.GetDataTable(strSel);
            if (gtb == null) return;

            this.zhanming.Value = gtb.Rows[0]["s_jinri_ff"].ToString();// 走访部门
            this.anzhuangweizhi.Value = gtb.Rows[0]["s_xiaqu_yf"].ToString();//协调项目
            this.xmgcqc.Value = gtb.Rows[0]["s_jd"].ToString();//其他工作  
            this.sfzcsy.Value = gtb.Rows[0]["s_bz"].ToString();//其他工作 

            // String strSel = "select top 1 * from t_wbxt where w_id='" + Request.QueryString["w_id"] + "'";




        }

        public void _BindData()
        {


            String strSel = "select *   from t_sanzhuangfei where s_tid='" + Session["CUR_TID"] + "'and DateDiff(dd,s_time,getdate())=0";
            tb = WXDBUtility.SqlHelper.GetDataTable(strSel);

            if (tb == null)
            {
                String strSel1 = "select * s_id  from t_sanzhuangfei where s_tid='" + Session["CUR_TID"] + "'and DateDiff(dd,s_time,getdate())=0";
                tb = WXDBUtility.SqlHelper.GetDataTable(strSel1);

            }
        }


        public void _BindDataZC()
        {


            String strSel = "select *   from t_sanzhuangfei where s_tid='" + Session["CUR_TID"] + "' and flag='0'";
            tbzc = WXDBUtility.SqlHelper.GetDataTable(strSel);
        }

        public void _BindDataYC()
        {


            String strSel = "select *   from t_sanzhuangfei where s_tid='" + Session["CUR_TID"] + "' and flag='1'";
            tbyc = WXDBUtility.SqlHelper.GetDataTable(strSel);
        }

   




    }
}




