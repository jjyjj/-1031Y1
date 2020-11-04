using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MarketInfo.wd_dzrz.wd_disanf
{
    public partial class Disanf_histroy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                if (Request.QueryString["UTID"] != null)
                {
                    this.Hidtid.Value = Request.QueryString["UTID"];                 
                }
                if (Session["CUR_T_ID"].ToString() == "3")
                {
                    this.Hidtid.Value = Session["CUR_TID"].ToString();  
                }
            }
        }
    }
}