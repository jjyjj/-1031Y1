using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MarketInfo
{
    public partial class wd_index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["U_LoginName"]!=null)
                {
                    m_curuser.Text = Session["U_LoginName"].ToString();
                }
                else
                {
                    Response.Redirect("wd_login.aspx");
                }
            }
        }
    }
}