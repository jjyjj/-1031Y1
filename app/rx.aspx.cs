using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.app
{
    public partial class rx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                _GetData();
            }
        }

        public void _GetData()
        {
            String strSQL = "Select * from T_RX_INFO";
            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb == null) return;
            Label_LK.Text = WXDBUtility.DESHelper.Decrypt_DES(tb.Rows[0]["R_MSG"].ToString());
            Label_LKTIME.Text = tb.Rows[0]["R_TIME"].ToString();
        }
    }
}