using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MarketInfo.wd_dzrz
{
    public partial class main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CUR_TID"] != null)
            {
                this.hideFtid.Value = Session["CUR_TID"].ToString();
                this.hidtype.Value = Session["CUR_T_ID"].ToString();
                this.Hidzid.Value = Session["CUR_ZID"].ToString();
                this.Hidzpid.Value = Session["CUR_PZID"].ToString();

            }
        }
    }
}