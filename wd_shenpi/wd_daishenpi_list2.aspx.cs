using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace MarketInfo.wd_shenpi
{
    public partial class wd_daishenpi_list2 : System.Web.UI.Page
    {
        public DataTable tb = null;
        public string strdw = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["DWNAME"]!=null && Request.QueryString["DWNAME"].ToString() != "")
                {
                    strdw = Request.QueryString["DWNAME"].ToString();
                }
            }
            _Getdata2();
        }
        public void _Getdata2()
        {
            
            
            //String Strsql = "select a.*,b.zname as dwname,b.ztype as type from T_USER_INFO as a,T_ZYQ_INFO as b where  (a.ZPID='" + Request.QueryString["CURTID"] + "' or a.ZID='" + Request.QueryString["CURTID"] + "') and a.ZID=b.zid order by a.ZID";
            String Strsql = "select a.*,b.zname as dwname,b.ztype as type from T_USER_INFO as a,T_ZYQ_INFO as b where  (a.ZPID in (select a.zid from T_USER_INFO as a,T_ZYQ_INFO as b where  (a.ZPID='" + Request.QueryString["CURTID"]
                + "' or a.ZID='" + Request.QueryString["CURTID"] + "') and a.ZID=b.zid ) or a.ZID in (select a.zid from T_USER_INFO as a,T_ZYQ_INFO as b where  (a.ZPID='" + Request.QueryString["CURTID"]
                + "' or a.ZID='" + Request.QueryString["CURTID"] + "') and a.ZID=b.zid )) and a.ZID=b.zid order by t_type";         
            tb = WXDBUtility.SqlHelper.GetDataTable(Strsql);

        }
    }
}