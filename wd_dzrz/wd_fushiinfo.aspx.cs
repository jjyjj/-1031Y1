using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MarketInfo.wd_dzrz
{
    public partial class wd_fushiinfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["file_id"] != null)
                {
                    Session["file_id"] = Request.QueryString["file_id"];
                    this.hide_id.Value = Session["file_id"].ToString();
                   // this.txtxxgname.Value = Request.QueryString["name"];
                }
            }
        }
    }
}