using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_shenpi
{
    public partial class sp_sanzhuangfei : System.Web.UI.Page
    {
        public DataTable tb = null;
        public string UTID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CUR_T_ID"] != null  && Session["CUR_T_ID"].ToString() != "")
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

        }

        #region 操作
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

            string StrSql = " ";
            StrSql = "select a.*,b.T_NAME as truename,c.zname as dwname from t_sanzhuangfei as a,T_USER_INFO as b,T_ZYQ_INFO as c " +
    "where a.s_tid in (" + data_zid + ") and  a.flag='1' and a.sp1='0' and a.s_tid=b.T_ID and c.zid=b.ZPID and DateDiff(dd,a.s_time ,getdate())=0";
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

            string StrSql = " ";

            StrSql = "select a.*,b.T_NAME as truename,c.zname as dwname from t_sanzhuangfei as a,T_USER_INFO as b,T_ZYQ_INFO as c " +
                "where a.s_tid in (" + data_zid + ") and  a.flag='1' and a.sp1='1' and a.sp2='0' and a.sprid2='0' and a.s_tid=b.T_ID and c.zid=b.ZPID and DateDiff(dd,a.s_time ,getdate())=0";
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
            string StrSql = "";
            StrSql = "select a.*,b.T_NAME as truename,c.zname as dwname from t_sanzhuangfei as a,T_USER_INFO as b,T_ZYQ_INFO as c " +
                "where a.s_tid in (" + data_zid + ") and  a.flag='1' and a.sp2='1' and a.sprid2<>'0 and a.s_tid=b.T_ID and c.zid=b.ZPID and DateDiff(dd,a.s_time ,getdate())=0";
            tb = WXDBUtility.SqlHelper.GetDataTable(StrSql);
        }
        #endregion


        public void _GetData1()
        { 
            String strtpe=Session["CUR_T_ID"].ToString();
            String strtid = Request.QueryString["TID"].ToString();
            String Sql = "";
            //站长角色
            if (strtpe == "2")
            {
                String where = "";
                String sqlq = "select T_ID from T_USER_INFO  where ZPID='" + Session["CUR_ZID"] + "'  ";
                DataTable tb1 = WXDBUtility.SqlHelper.GetDataTable(sqlq);
                if (tb1 != null)
                {
                    string[] arr = new string[tb1.Rows.Count];
                    for (int i = 0; i < tb1.Rows.Count; i++)
                    {
                        arr[i] = tb1.Rows[i]["T_ID"].ToString();
                        int len = arr.Length;

                    }
                    string tid = "";
                    for (int j = 0; j < arr.Length; j++)
                    {
                        tid += arr[j].ToString() + ",";
                    }
                    //包括站长自己
                    tid =tid.TrimEnd(',');

                    where = " a.s_tid IN ( " + tid + ") and ";
                }
                Sql = "select a.*,b.T_NAME as truename,c.zname as dwname from t_sanzhuangfei as a,T_USER_INFO as b,T_ZYQ_INFO as c where" + where + " a.flag='1' and a.sp1='0' and a.sprid1='0' and a.s_tid=b.T_ID and c.zid=b.ZPID";
                tb = WXDBUtility.SqlHelper.GetDataTable(Sql);
            }
            //区主任角色
            if (strtpe == "1")
            {
                //站长登录时需要查询出来所所有线路管理员下的巡线工
                String strsql1 = "select ZID from T_USER_INFO where T_ID='" + strtid + "'";
                DataTable tbzid = WXDBUtility.SqlHelper.GetDataTable(strsql1);
                String strzid = "";
                String where = "";
                if (tbzid != null)
                {
                    strzid = tbzid.Rows[0]["ZID"].ToString();
                    String sqlq = "select T_ID from T_USER_INFO where ZPID='" + strzid + "'";
                    DataTable tb1 = WXDBUtility.SqlHelper.GetDataTable(sqlq);
                    if (tb1 != null)
                    {
                        string[] arr = new string[tb1.Rows.Count];
                        for (int i = 0; i < tb1.Rows.Count; i++)
                        {
                            arr[i] = tb1.Rows[i]["T_ID"].ToString();
                            int len = arr.Length;

                        }
                        string tid = "";
                        for (int j = 0; j < arr.Length; j++)
                        {
                            tid += arr[j].ToString() + ",";
                        }
                        //包括传过来的站长自己
                        tid = strtid + "," + tid.TrimEnd(',');
                        where = " a.s_tid IN ( " + tid + ") and ";
                    }
                }
                Sql = "select a.*,b.T_NAME as truename,c.zname as dwname from t_sanzhuangfei as a,T_USER_INFO as b,T_ZYQ_INFO as c where " + where + " a.flag='1' and a.sp1='1'   and a.s_tid=b.T_ID and c.zid=b.ZPID";
                tb = WXDBUtility.SqlHelper.GetDataTable(Sql);
            }
            //管理处
            if (strtpe == "0")
            {

                Sql = "select a.*,b.T_NAME as truename,c.zname as dwname from t_sanzhuangfei as a,T_USER_INFO as b,T_ZYQ_INFO as c where  a.flag='1' and a.sp2='1'  and a.s_tid=b.T_ID and c.zid=b.ZPID";
                tb = WXDBUtility.SqlHelper.GetDataTable(Sql);
            }
        }
    }
}