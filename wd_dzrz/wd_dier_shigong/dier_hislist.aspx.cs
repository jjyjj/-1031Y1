using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_dzrz.wd_dier_shigong
{
    public partial class dier_hislist : System.Web.UI.Page
    {
        public DataTable dt_2 = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                _GetGData();
              
            }
        }
        public void _GetGData()
        {

            string strSel = "";

            if (Request.QueryString["UTID"] != "" && Request.QueryString["UTID"] != null)
            {
                this.HideID.Value = Request.QueryString["UTID"];
                strSel = "select  * from dbo.t_DIER_shigong where t_id='" + Request.QueryString["UTID"] + "' and sp1<>'0' and spid1<>'0' and flag='1' order by id desc";
            }
            else
            {
                strSel = "select  * from dbo.t_DIER_shigong where t_id='" + Session["CUR_TID"] + "' and sp1<>'0' and spid1<>'0' and flag='1' order by id desc";
            }
            dt_2 = WXDBUtility.SqlHelper.GetDataTable(strSel);
        }

    }
}