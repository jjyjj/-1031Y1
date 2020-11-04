using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_shenpi
{
    public partial class GDGL : System.Web.UI.Page
    {
        public DataTable tb = null;
        public string UTID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CUR_T_ID"].ToString() != "" && Session["CUR_T_ID"] != null)
            {
                _GetData();
            }
            if (!IsPostBack)
            {
                if (Request.QueryString["TID"] != null && Session["CUR_T_ID"] != null)
                {
                    this.HideTid.Value = Request.QueryString["TID"].ToString();
                    UTID = Request.QueryString["TID"].ToString();
                }
            }
            sp_type();//判断哪个级别进入
        }
        public void sp_type()
        {
            string strtpe = string.Empty;
            if (Session["CUR_T_ID"] != null)
            {
                strtpe = Session["CUR_T_ID"].ToString();
            }
            switch (strtpe)
            {
                case "0":
                    this.Hide_Sp.Value = "3";
                    break;
                case "1":
                    this.Hide_Sp.Value = "2";
                    break;
                case "2":
                    this.Hide_Sp.Value = "1";
                    break;
            }
        }

        #region
        
        public void _GetData()
        {
            String strtpe = Session["CUR_T_ID"].ToString();
            String strtid = Request.QueryString["TID"].ToString();
            if (strtpe == "2")
            {
                type2(Session["CUR_ZID"].ToString());
            }
            if (strtpe == "1")
            {
                type1(Request.QueryString["TID"].ToString());
            }
            if (strtpe == "0")
            {
                type0(Request.QueryString["TID"].ToString());
            }
        }
        protected void type2(string strtid)
        {
            string data_zid = string.Empty;
            data_zid += Session["CUR_TID"].ToString() + "," + Request.QueryString["TID"].ToString();

            string StrSql = "select * from dbo.t_guandao_glfc where gd_tid in (" + data_zid + ")and  flag='1' and sp1='0' and DateDiff(dd,gd_time ,getdate())=0 ";
            tb = WXDBUtility.SqlHelper.GetDataTable(StrSql);
        }
        protected void type1(string strtid)
        {
            string sql = " select t_id from T_USER_INFO where zpid in (select ZID from T_USER_INFO where T_ID ='" + strtid + "')";
            DataTable tb1 = WXDBUtility.SqlHelper.GetDataTable(sql);
            string data_zid = string.Empty;
            if (tb1 != null)
            {
                for (int i = 0; i < tb1.Rows.Count; i++)
                {
                    data_zid += tb1.Rows[i]["t_id"].ToString() + ",";
                }
            }
            data_zid += strtid;

            string StrSql = "select * from dbo.t_guandao_glfc  where gd_tid in (" + data_zid + ")   and sp1='1' and sp2='0' and spid2='0' and  flag='1'   and DateDiff(dd,gd_time ,getdate())=0 ";
            tb = WXDBUtility.SqlHelper.GetDataTable(StrSql);
        }
        protected void type0(string strtid)
        {
            //获取分输站ID
            string sql = "  select * from T_USER_INFO where zpid in (select ZID from T_USER_INFO where T_ID ='" + strtid + "')";
            DataTable tb1 = WXDBUtility.SqlHelper.GetDataTable(sql);
            string data_zid = string.Empty;
            if (tb1 != null)
            {
                for (int i = 0; i < tb1.Rows.Count; i++)
                {
                    data_zid += tb1.Rows[i]["t_id"].ToString() + ",";
                }
                data_zid = data_zid.TrimEnd(',');
            }
            //获取分输站ID
            string sql1 = "  select T_ID from T_USER_INFO where zpid in (" + data_zid + ")";
            DataTable tb2 = WXDBUtility.SqlHelper.GetDataTable(sql1);
            if (tb2 != null)
            {
                for (int i = 0; i < tb2.Rows.Count; i++)
                {
                    data_zid += "," + tb2.Rows[i]["t_id"].ToString();
                }
            }
            string StrSql = "select * from dbo.t_guandao_glfc  where gd_tid in (" + data_zid + ")   and sp2='1' and spid2<>'0' and  flag='1'   and DateDiff(dd,gd_time ,getdate())=0 ";
            tb = WXDBUtility.SqlHelper.GetDataTable(StrSql);
        }
        #endregion 
    }
}