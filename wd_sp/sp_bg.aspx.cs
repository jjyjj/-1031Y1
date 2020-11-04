using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_sp
{
    public partial class sp_bg : System.Web.UI.Page
    {
        public DataTable tb = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CUR_T_ID"].ToString() != "" && Session["CUR_T_ID"] != null)
            {
                _GetData();
            }
        }
        public void _GetData()
        {
            String strtpe = Session["CUR_T_ID"].ToString();
            String strzid = Request.QueryString["ZID"].ToString();
            String strzpid = Request.QueryString["ZPID"].ToString();
            if (strtpe == "2" )//站长,区主任
            {
                type2(Session["CUR_ZID"].ToString());
            }
            if (strtpe == "1")//站长,区主任
            {
                type1(Session["CUR_ZID"].ToString());
            }
            if (strtpe == "0")//管理处
            {
                type0();
            }
        }
        protected void type2(string strzid)
        {
            string StrSql = "select a.*,b.T_NAME,c.zname from dbo.T_USER_BG a,T_USER_INFO b,T_ZYQ_INFO c where a.y_zid=c.zid and a.tid=b.T_ID and a.n_zid='" + strzid + "' and a.n_zpid='" + Session["CUR_PZID"] + "' and a.del='1' and a.sp1='0' order by a.id";// and DateDiff(dd,setTime ,getdate())=0 
           // string StrSql = "select a.*,b.T_NAME,c.zname from dbo.T_USER_BG a,T_USER_INFO b,T_ZYQ_INFO c where a.y_zid=c.zid and a.tid=b.T_ID and a.n_zpid='" + Session["CUR_ZID"] + "' and a.del='1' and a.sp1='0' order by a.id";// and DateDiff(dd,setTime ,getdate())=0 
            tb = WXDBUtility.SqlHelper.GetDataTable(StrSql);
        }
        protected void type1(string strzid)
        {
              string StrSql = "select a.*,b.T_NAME,c.zname from dbo.T_USER_BG a,T_USER_INFO b,T_ZYQ_INFO c where a.y_zid=c.zid and a.tid=b.T_ID and a.n_zpid='" + strzid + "'  and  a.type='2' and a.del='1' and a.sp1='0' order by a.id";// and DateDiff(dd,setTime ,getdate())=0 
            tb = WXDBUtility.SqlHelper.GetDataTable(StrSql);
        }
        protected void type0()
        {
            string StrSql = "select a.*,b.T_NAME,c.zname from dbo.T_USER_BG a,T_USER_INFO b,T_ZYQ_INFO c where a.y_zid=c.zid and a.tid=b.T_ID and a.del='1' and a.sp1='0' order by a.id";// and DateDiff(dd,setTime ,getdate())=0 
            tb = WXDBUtility.SqlHelper.GetDataTable(StrSql);
        }
    }
}