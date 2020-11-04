using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MarketInfo.wd_shenpi
{
    public partial class wd_shenpinew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Hidzid.Value = Session["CUR_ZID"].ToString();
            Hidzpid.Value = Session["CUR_PZID"].ToString(); 
        }
    }
}