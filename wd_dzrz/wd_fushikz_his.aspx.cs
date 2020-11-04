using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_dzrz
{
    public partial class wd_fushikz_his : System.Web.UI.Page
    {
        public DataTable dt_2 = null;
        protected void Page_Load(object sender, EventArgs e)
        {
           // _GetGData();

            if (!IsPostBack)
            {
                if (Session["CUR_TID"] != null)
                { _DataBind(); }
            }
        }
        
        public void _DataBind()
        {
            // string StrSql = "select  * from dbo.t_dongtaifengxian where t_id='"+ Session["CUR_TID"] + "' and fx_sfwg='是' and flag='1' order by id desc";
            string StrSql = "";
            if (Request.QueryString["UTID"] != "" && Request.QueryString["UTID"] != null)
            {
                this.HideID.Value = Request.QueryString["UTID"];
                StrSql = "select  * from dbo.t_fushi where fs_tid='" + Request.QueryString["UTID"] + "' and sp1<>'0' and spid1<>'0' and flag='1'  order by fs_id desc";

            }
            else
            {
                StrSql = "select   * from dbo.t_fushi  where fs_tid='" + Session["CUR_TID"] + "' and sp1<>'0' and spid1<>'0' and flag='1' order by fs_id desc";

            }
            dt_2 = WXDBUtility.SqlHelper.GetDataTable(StrSql);
        }
    }
}