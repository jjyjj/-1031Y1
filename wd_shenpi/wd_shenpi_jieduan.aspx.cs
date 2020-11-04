using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MarketInfo.wd_shenpi
{
    public partial class wd_shenpi_jieduan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                hide_tid.Value = Request.QueryString["TID"];

            }
        }
    }
}