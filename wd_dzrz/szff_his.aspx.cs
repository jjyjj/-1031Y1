using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_dzrz
{
    public partial class szff_his : System.Web.UI.Page
    {
        public DataTable dt_2 = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            _GetGData();
        }
        public void _GetGData()
        {
            string StrSql = "";
            if (Request.QueryString["UTID"] != "" && Request.QueryString["UTID"] != null)
            {
                this.HideID.Value = Request.QueryString["UTID"];
                StrSql = "select  * from dbo.t_sanzhuangfei where s_tid='" + Request.QueryString["UTID"] + "' and sp1<>'0' and sprid1<>'0' and flag='1'  order by s_id desc";

            }
            else
            {
                StrSql = "select   * from dbo.t_sanzhuangfei  where s_tid='" + Session["CUR_TID"] + "' and sp1<>'0' and sprid1<>'0' and flag='1' order by s_id desc";

            }
            dt_2 = WXDBUtility.SqlHelper.GetDataTable(StrSql);
        }
    }
}