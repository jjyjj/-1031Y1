using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_msg
{
    public partial class wd_editrx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack){
                String strSQL = "Select * from T_RX_INFO";
                DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
                if (tb == null) return;
                m_data.Value= WXDBUtility.DESHelper.Decrypt_DES(tb.Rows[0]["R_MSG"].ToString());
            }
        }

        protected void ButtonSV_Click(object sender, EventArgs e)
        {
            String strSQL = "Update T_RX_INFO set R_MSG='" 
                + WXDBUtility.DESHelper.Encrypt_DES(m_data.Value)
                + "',R_SENDER='" + Session["U_LoginName"].ToString() + "',R_TIME=getdate()";
            int res = WXDBUtility.SqlHelper.ExecuteSql(strSQL);
            Response.Redirect("wd_rxinfo.aspx");
        }

        protected void ButtonFH_Click(object sender, EventArgs e)
        {
            Response.Redirect("wd_rxinfo.aspx");
        }
    }
}