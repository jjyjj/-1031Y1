using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_dzrz.user
{
    public partial class wd_userbg : System.Web.UI.Page
    {
        public DataTable dt_2 = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CUR_TID"] != null)
                {
                    this.hideFid.Value = Session["CUR_TID"].ToString();
                }
                _DataBind();
               // _binddata();
               
            }
        }
        public void _DataBind()
        {
            string StrSql = "select a.* ,b.zname from dbo.T_USER_BG a,T_ZYQ_INFO b WHERE a.n_zid=b.zid and  a.tid=" + this.hideFid.Value + " and a.del='1' order by a.id desc";
            dt_2 = WXDBUtility.SqlHelper.GetDataTable(StrSql);
        }        
    }
}