using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_sp
{
    public partial class sp_kwzy : System.Web.UI.Page
    {
        public DataTable tb = null;
        public string UTID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CUR_T_ID"].ToString() != "" && Session["CUR_T_ID"] != null)
            {
                _GetData();
            }

            //if (!IsPostBack)
            //{
            //    if (Request.QueryString["TID"] != null && Session["CUR_T_ID"] != null)
            //    {
            //        this.HideTid.Value = Request.QueryString["TID"].ToString();
            //        UTID = Request.QueryString["TID"].ToString();
            //    }
            //}
            sp_type();//判断哪个级别进入
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
           
            if (strtpe == "2")//站长
            {
                type2(Session["CUR_ZID"].ToString());
            }
            if (strtpe == "1")
            {
                type1(Session["CUR_ZID"].ToString());
            }
            if (strtpe == "0")
            {
                type0(Session["CUR_ZID"].ToString());
            }
        }
        protected void type2(string strzid)
        {

            string StrSql = "select a.*,b.zname,c.T_NAME from dbo.t_dongtaifengxian a,T_ZYQ_INFO b,T_USER_INFO c  where a.ntype='3' and a.zpid='" + strzid + "' and  a.flag='1' and a.sp1='0' and DateDiff(dd,a.setTime ,getdate())=0 and a.zpid=b.zid and c.T_ID=a.t_id";
            tb = WXDBUtility.SqlHelper.GetDataTable(StrSql);
        }
        protected void type1(string strzid)
        {
             String sql = "select zid from t_user_info where zpid='" + strzid + "'";
                DataTable tb1 = WXDBUtility.SqlHelper.GetDataTable(sql);
                string where = "";
                if (tb1 != null)
                {
                    string[] arr = new string[tb1.Rows.Count];
                    for (int i = 0; i < tb1.Rows.Count; i++)
                    {
                        arr[i] = tb1.Rows[i]["zid"].ToString();
                        int len = arr.Length;

                    }
                    string tid = "";
                    for (int j = 0; j < arr.Length; j++)
                    {
                        tid += arr[j].ToString() + ",";
                    }
                    tid = tid.TrimEnd(',');

                    where = "  a.zid IN ( " + tid + ") ";
                    where = "and (" + where + " or a.zpid in ( " + tid + "))";
                }
                string StrSql = "select  a.*,b.zname,c.T_NAME  from t_dongtaifengxian a,T_ZYQ_INFO b,T_USER_INFO c where a.flag='1' and a.sp1='1' and a.spid1<>'0' and a.sp2='0' and a.spid2='0' and  a.zpid=b.zid and c.T_ID=a.t_id and DateDiff(dd,a.setTime ,getdate())=0 " + where;
            tb = WXDBUtility.SqlHelper.GetDataTable(StrSql);
        }
        protected void type0(string strtid)
        {

            string StrSql = "select a.*,b.zname,c.T_NAME  from dbo.t_dongtaifengxian a,T_ZYQ_INFO b,T_USER_INFO c where a.sp2='1' and a.spid2<>'0' and  a.flag='1' and  a.zpid=b.zid and c.T_ID=a.t_id and DateDiff(dd,a.setTime ,getdate())=0 ";
            tb = WXDBUtility.SqlHelper.GetDataTable(StrSql);
        }
        #endregion
        public void _GetData1()
        {
            String strtpe = Session["CUR_T_ID"].ToString();
            String strtid = Request.QueryString["TID"].ToString();
            String Sql = "";
            if (strtpe == "2")
            {
                Sql = "select * from dbo.t_dongtaifengxian where t_id='" + strtid + "' and flag='1' and sp1='0' and spid1='0' and DateDiff(dd,setTime ,getdate())=0 ";
                tb = WXDBUtility.SqlHelper.GetDataTable(Sql);
            }
            if (strtpe == "1")
            {
                Sql = "select * from t_dongtaifengxian where t_id='" + strtid + "' and flag='1' and sp1<>'0' and spid1<>'0' and sp2='0' and spid2='0' and DateDiff(dd,setTime ,getdate())=0 ";
                tb = WXDBUtility.SqlHelper.GetDataTable(Sql);
            }
        }
    }
}