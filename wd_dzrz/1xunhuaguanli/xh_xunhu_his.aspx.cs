using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_dzrz._1xunhuaguanli
{
    public partial class xh_xunhu_his : System.Web.UI.Page
    {
        public DataTable dt_1 = null;
        protected void Page_Load(object sender, EventArgs e)
        {
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
                StrSql = "select  a.*,b.xx_name from dbo.t_xunhuguanli a,t_xunxiangong_info b where a.xh_tid='" + Request.QueryString["UTID"] + "' and a.sp1<>'0' and a.sprid1<>'0' and a.flag='1' and b.xx_id=a.xh_xunxiangong_id order by a.xh_id desc";

            }
            else
            {
                StrSql = "select  a.*,b.xx_name  from dbo.t_xunhuguanli  a,t_xunxiangong_info b where a.xh_tid='" + Session["CUR_TID"] + "' and a.sp1<>'0' and a.sprid1<>'0' and a.flag='1' and b.xx_id=a.xh_xunxiangong_id order by a.xh_id desc";

            }
            dt_1 = WXDBUtility.SqlHelper.GetDataTable(StrSql);
        }
    }
}