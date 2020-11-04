using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_dzrz.wd_gdkwork
{
    public partial class wd_hiswork : System.Web.UI.Page
    {
        public DataTable dt_1 = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CUR_TID"] != null)
                { _DataBind(); 
                
                }
            }
        }
        public void _DataBind()
        {
            // string StrSql = "select  * from dbo.t_dongtaifengxian where t_id='"+ Session["CUR_TID"] + "' and fx_sfwg='是' and flag='1' order by id desc";
            string StrSql = "";
            if (Request.QueryString["UTID"] != "" && Request.QueryString["UTID"] != null)
            {
                Session["CRT_UTID"] = Request.QueryString["UTID"];
                StrSql = "select  * from dbo.t_gdk_workday where t_id='" + Request.QueryString["UTID"] + "' and DateDiff(dd,crtime ,getdate())<=7  order by id desc";

            }
            else
            {
                StrSql = "select  * from dbo.t_gdk_workday where t_id='" + Session["CUR_TID"] + "'  order by id desc";

                //StrSql = "select  * from dbo.t_gdk_workday where t_id='" + Session["CUR_TID"] + "' and sp1<>'0' and spid1<>'0' and flag='1' order by id desc";
            }
            dt_1 = WXDBUtility.SqlHelper.GetDataTable(StrSql);
        }
    }
}