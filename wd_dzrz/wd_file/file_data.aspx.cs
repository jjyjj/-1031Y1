using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MarketInfo.wd_dzrz.wd_file
{
    public partial class file_data : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                if (Request.QueryString["file_id"] != null && Request.QueryString["Is_File"] != null)
            {
                Session["file_id"] = Request.QueryString["file_id"];
                Session["Is_File"] = Request.QueryString["Is_File"];
                this.HideType.Value = Session["Is_File"].ToString();
                this.HideID.Value = Session["file_id"].ToString();
            }
            }
        }
    }
}