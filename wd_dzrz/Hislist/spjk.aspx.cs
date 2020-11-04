using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MarketInfo.wd_dzrz.Reason
{
    public partial class spjk : System.Web.UI.Page
    {
        public DataTable tbyc = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                _DataBind();
            }
        }

        public void _DataBind()
        {
            // string StrSql = "select  * from dbo.t_dongtaifengxian where t_id='"+ Session["CUR_TID"] + "' and fx_sfwg='是' and flag='1' order by id desc";
            string StrSql = "";
            if (Request.QueryString["UTID"] != null)
            {
                this.HideID.Value = Request.QueryString["UTID"];
                StrSql = "select  * from dbo.t_shipinjiankong where s_tid='" + Request.QueryString["UTID"].ToString() + "' and sp1<>'0' and spid1<>'0' and flag='1' order by s_id desc";
            }
            else
            {
                if (Session["CUR_TID"] != null)
                {
                    StrSql = "select  * from dbo.t_shipinjiankong where s_tid='" + Session["CUR_TID"].ToString() + "' and sp1<>'0' and spid1<>'0' and flag='1' order by s_id desc";
                }
            }
            tbyc = WXDBUtility.SqlHelper.GetDataTable(StrSql);
        }

    }
}